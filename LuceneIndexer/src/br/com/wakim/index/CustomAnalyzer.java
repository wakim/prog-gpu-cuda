package br.com.wakim.index;

import java.io.Reader;

import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.Tokenizer;
import org.apache.lucene.analysis.en.PorterStemFilter;
import org.apache.lucene.analysis.miscellaneous.ASCIIFoldingFilter;
import org.apache.lucene.analysis.standard.StandardTokenizer;
import org.apache.lucene.analysis.util.StopwordAnalyzerBase;
import org.apache.lucene.util.Version;

/***
 * A idéia aqui é simular o mesmo comportamento do PorterStemmerAnalyzer
 * do trabalho do fabrício.
 * Não sei o que foi modificado no MyASCIIFoldingFilter porque não tenho o source
 * do ASCIIFoldingFilter.
 * E simplesmente "copiar" não funciona
 * @author wakim
 */
public class CustomAnalyzer extends StopwordAnalyzerBase {
	protected CustomAnalyzer(Version version) {
		super(version);
	}

	@Override
	protected TokenStreamComponents createComponents(String fieldName, Reader reader) {
		Tokenizer tokenizer = new StandardTokenizer(matchVersion, reader);
		TokenStream filter = new PorterStemFilter(tokenizer);
		
		filter = new ASCIIFoldingFilter(filter);
		
		return new TokenStreamComponents(tokenizer, filter);
	}
}
