package br.com.wakim.index;

public class TermInfo {
	public int rowPosition;
	public String term;
	public int[] docs;
	
	@Override
	public int hashCode() {
		return term.hashCode();
	}
	
	@Override
	public boolean equals(Object other) {
		return term.equals(other.toString());
	}
	
	@Override
	public String toString() {
		return term;
	}
}