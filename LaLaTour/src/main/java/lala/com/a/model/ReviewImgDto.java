package lala.com.a.model;

import java.io.Serializable;

public class ReviewImgDto implements Serializable {

	private int seq;
	private String fileName_Af;
	
	
	public ReviewImgDto() {
	}

	
	
	
	

	public ReviewImgDto(int seq, String fileName_Af) {
		super();
		this.seq = seq;
		this.fileName_Af = fileName_Af;
	}






	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getFileName_Af() {
		return fileName_Af;
	}


	public void setFileName_Af(String fileName_Af) {
		this.fileName_Af = fileName_Af;
	}


	@Override
	public String toString() {
		return "ReviewImgDto [seq=" + seq + ", fileName_Af=" + fileName_Af + "]";
	}
	
	
	
	
}
