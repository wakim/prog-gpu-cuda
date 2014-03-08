package br.com.wakim.index;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.FieldType;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.FieldInfo.IndexOptions;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Terms;
import org.apache.lucene.index.TermsEnum;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.RAMDirectory;
import org.apache.lucene.util.BytesRef;
import org.apache.lucene.util.Version;

import br.com.wakim.index.dao.DataSet;
import br.com.wakim.index.dao.DataSetDAO;
import br.com.wakim.index.dao.DocumentDAO;

public class LuceneIndexer {
	
	private static final String FIELD = "contents";
	private static final FieldType fieldType;
	
	private static int currentTermPosition = 0;
	
	static {
		fieldType = new FieldType();
		
		fieldType.setStoreTermVectors(true);
		fieldType.setIndexOptions(IndexOptions.DOCS_AND_FREQS_AND_POSITIONS_AND_OFFSETS);
		fieldType.setStored(true);
		fieldType.setIndexed(true);
		fieldType.setTokenized(true);
	}
	
	public static IndexWriter indexDocuments(IndexWriter indexWriter, List<String> documents) throws IOException {
		for(String document : documents) {
			Document d = new Document();
			Field field = new Field(FIELD, document, fieldType);
			d.add(field);
			indexWriter.addDocument(d);
		}
		
		return indexWriter;
	}
	
	public static void main(String args[]) {
		try {
			StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_40);
			Directory dir = new RAMDirectory();
			IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_40, analyzer);
			IndexWriter indexWriter = new IndexWriter(dir, config);
			DocumentDAO docDao = new DocumentDAO();
			DataSetDAO setDao = new DataSetDAO();
			int dataSetId = 7;
			int documentsLength = 17036 / 4;
			
			HashMap<String, TermInfo> terms = new HashMap<String, TermInfo>();
			
			DataSet set = setDao.getDataSet(dataSetId);
			
			List<String> documents = docDao.getDocuments(dataSetId, documentsLength);
			
			indexDocuments(indexWriter, documents);
			
			indexWriter.commit();
			IndexReader reader = DirectoryReader.open(dir);
			
			int[][] TxD = getTermDocumentMatrix(reader, terms);
			
			indexWriter.close();
			reader.close();
			dir.close();
			
			documents = null;
			
			indexWriter = null;
			reader = null;
			dir = null;
			terms = null;
			
			System.gc();
			
			// Debug
//			for(int i = 0; i < TxD.length; ++i) {
//				for(int j = 0; j < TxD[i].length; ++j) {
//					System.out.print(TxD[i][j] + " ");
//				}
//				
//				System.out.println();
//			}
			
			TermDocumentMatrixWriter writer =
				new TermDocumentMatrixWriter(set.name + "_" + TxD.length + "_" + TxD[0].length);
			writer.open();
			
			writer.write(TxD);
			
			writer.close();
			
			System.gc();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * retorna a matriz DxT, transposta da matriz TxD procurada.
	 * @param reader
	 * @param terms
	 * @return
	 * @throws IOException 
	 */
	public static int[][] getTermDocumentMatrix(IndexReader reader, HashMap<String, TermInfo> terms) throws IOException {
		int[][] TxD = null;
		TermInfo info;
		
		String termString = null;
		Terms termsObject = null;
		TermsEnum it = null;
		BytesRef text = null;
		
		System.out.println("Num Docs: " + reader.numDocs());
		
		for(int i = 0; i < reader.numDocs(); ++i) {
			termsObject = reader.getTermVector(i, FIELD);
			
			if(termsObject == null) {
				continue;
			}
			it = termsObject.iterator(it);
			
			text = null;
			
			while((text = it.next()) != null) {
				termString = text.utf8ToString();
				
				if((info = terms.get(termString)) == null) {
					info = new TermInfo();
					info.docs = new int[reader.numDocs()];
					info.rowPosition = currentTermPosition++;
					info.term = termString;
					terms.put(termString, info);
				}
				
				info.docs[i] += (int) it.totalTermFreq();
			}
		}
		
		System.out.println(currentTermPosition + "_" + terms.size());
		
		TxD = new int[currentTermPosition][];
		
		for(TermInfo indexedInfo : terms.values()) {
			TxD[indexedInfo.rowPosition] = indexedInfo.docs;
		}
		
		return TxD;
	}
}
