package lala.com.a.util;

public class pagingBean {
	
	private int seq;
	private String findWord;
	private String choice;
	private int nowPage;	
	private int startNum;
	private int totalCount;	
	private int countPerPage;	
	private int blockCount;		
	private int pseq;
	
	public pagingBean() {
	}
	
	
	

	public pagingBean(int seq, String findWord, String choice, int nowPage, int startNum, int totalCount,
			int countPerPage, int blockCount, int pseq) {
		super();
		this.seq = seq;
		this.findWord = findWord;
		this.choice = choice;
		this.nowPage = nowPage;
		this.startNum = startNum;
		this.totalCount = totalCount;
		this.countPerPage = countPerPage;
		this.blockCount = blockCount;
		this.pseq = pseq;
	}




	public int getNowPage() {
		return nowPage;
	}
	
	public String getFindWord() {
		return findWord;
	}

	public void setFindWord(String findWord) {
		this.findWord = findWord;
	}

	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}
	public int getBlockCount() {
		return blockCount;
	}
	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
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

	public String toString() {
		return "pagingBean [seq=" + seq + ", findWord=" + findWord + ", choice=" + choice + ", nowPage=" + nowPage
				+ ", startNum=" + startNum + ", totalCount=" + totalCount + ", countPerPage=" + countPerPage
				+ ", blockCount=" + blockCount + ", pseq=" + pseq + "]";
	}


	
}
