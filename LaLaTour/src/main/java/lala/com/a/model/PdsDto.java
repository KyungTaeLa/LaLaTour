package lala.com.a.model;

import java.io.Serializable;

public class PdsDto implements Serializable {

	private int seq;
	private int pseq; //본문글 seq
	private String fileName_Bf; //원본파일명
	private String fileName_Af; //수정된 파일명
	private String tname; //이거 해당테이블들의 이름이 입력돼야 함
	private String content;
	

	public PdsDto() {}

	public PdsDto(int seq, int pseq, String fileName_Bf, String fileName_Af, String tname) {
		super();
		this.seq = seq;
		this.pseq = pseq;
		this.fileName_Bf = fileName_Bf;
		this.fileName_Af = fileName_Af;
		this.tname = tname;
	}
	public PdsDto(int seq, int pseq, String fileName_Bf, String fileName_Af, String tname, String content) {
		super();
		this.seq = seq;
		this.pseq = pseq;
		this.fileName_Bf = fileName_Bf;
		this.fileName_Af = fileName_Af;
		this.tname = tname;
		this.content = content;
	}

	
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	public String getFileName_Bf() {
		return fileName_Bf;
	}

	public void setFileName_Bf(String fileName_Bf) {
		this.fileName_Bf = fileName_Bf;
	}

	public String getFileName_Af() {
		return fileName_Af;
	}

	public void setFileName_Af(String fileName_Af) {
		this.fileName_Af = fileName_Af;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	@Override
	public String toString() {
		return "PdsDto [seq=" + seq + ", pseq=" + pseq + ", fileNameBf=" + fileName_Bf + ", fileNameAf=" + fileName_Af
				+ ", tname=" + tname +"content"+ content+"]";
	}
}
