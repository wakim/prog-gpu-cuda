package br.com.wakim.index;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.IntBuffer;
import java.nio.channels.FileChannel;

public class TermDocumentMatrixWriter {
	private File mPath;
	private FileOutputStream writer;
	
	public TermDocumentMatrixWriter(String path) {
		mPath = new File(path);
	}
	
	public TermDocumentMatrixWriter(File path) {
		mPath = path;
	}
	
	public void open() throws IOException {
		writer = new FileOutputStream(mPath, false);
	}
	
	public void write(int[][] termDocumentMatrix) throws IOException {
		int termLength = termDocumentMatrix.length, documentLength = termDocumentMatrix[0].length;
		int capacity = (termLength * documentLength) + 2;
		
		System.out.println(termLength + " : " + documentLength);
		System.out.println("capacity: " + (capacity * 4));
		FileChannel channel = writer.getChannel();
		ByteBuffer byteBuffer = ByteBuffer.allocateDirect(capacity * 4);
		// Com isso o programa em C vai ler corretamente os dados !
		byteBuffer.order(ByteOrder.LITTLE_ENDIAN);
		IntBuffer buffer = byteBuffer.asIntBuffer();
		
		System.out.printf("termos: %d documentos: %d\n", termLength, documentLength);
		
		channel.lock();
		
		buffer.put(termLength);
		buffer.put(documentLength);
		
		for(int i = 0; i < termLength; ++i) {
			buffer.put(termDocumentMatrix[i], 0, documentLength);
		}
		
		channel.write(byteBuffer);
		
		channel.close();
		
		System.gc();
	}
	
	public void close() throws IOException {
		writer.close();
	}
}
