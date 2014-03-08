package br.com.wakim.index;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.LongBuffer;
import java.nio.channels.FileChannel;

public class ReadMatrix {
	public static void main(String[] args) throws IOException {
		FileInputStream inputStream = new FileInputStream(new File("teste.matrix"));
		
		FileChannel channel = inputStream.getChannel();
		ByteBuffer buffer = ByteBuffer.allocateDirect(2 * 8);
		LongBuffer longBuffer = buffer.asLongBuffer();
		
		// Le rows + collumn;
		channel.read(buffer);
		
		long rows = longBuffer.get();
		long columns = longBuffer.get();
		
		System.out.println(rows + " " + columns);
		
		buffer = ByteBuffer.allocateDirect((int) (rows * columns * 8));
		
		longBuffer = buffer.asLongBuffer();
		
		channel.read(buffer);
		
		channel.close();
		
		inputStream.close();
		
		long[] line = new long[(int) columns];
		
		for(int i = 0; i < rows; ++i) {
			longBuffer.get(line);
			for(long l : line) {
				System.out.print(l + " ");
			}
			System.out.println();
		}
	}
}
