package lala.com.a.model;

import java.io.Serializable;

public class PollDto implements Serializable {

	private int seq;
	private String id;
	private int pseq;
	private double score;
	private int progress;
	
	public PollDto() {
	}

	public PollDto(int seq, String id, int pseq, double score, int progress) {
		super();
		this.seq = seq;
		this.id = id;
		this.pseq = pseq;
		this.score = score;
		this.progress = progress;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	@Override
	public String toString() {
		return "PollDto [seq=" + seq + ", id=" + id + ", pseq=" + pseq + ", score=" + score + ", progress=" + progress
				+ "]";
	}
	
	
}
