package lala.com.a.model;

import java.io.Serializable;

public class ReviewDto implements Serializable {

	private int seq;
	private int pseq;
	private String id;
	private String title;
	private String content;
	private int del;
	private double score;
	private String wdate;
	
	//join용
	private String ftitle;
	private String place;
	private String sdate;
	private String edate;
	
	
	
	
	public ReviewDto() {
	}
	
	public ReviewDto(int seq, int pseq, String id, String title, String content, int del, double score) {
		super();
		this.seq = seq;
		this.pseq = pseq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.del = del;
		this.score = score;
	}
	
	
	
	
	
	
	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getFtitle() {
		return ftitle;
	}
	
	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}
	
	public String getPlace() {
		return place;
	}
	
	public void setPlace(String place) {
		this.place = place;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}


	@Override
	public String toString() {
		return "ReviewDto [seq=" + seq + ", pseq=" + pseq + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", del=" + del + ", score=" + score + "]";
	}
	
	
}