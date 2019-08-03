package lala.com.a.location.food;

public class pagingBean {
	
	private String findWord;
	private String choice;
	private int nowPage;	
	private int startNum;	// rownumber로 오라클이 임의로 설정해준 번호
	private int totalCount;	
	private int countPerPage;	// 한페이지에 남길 게시글 갯수
	private int blockCount;
	private int pseq;
	private String place;
	
	public pagingBean() {
	}
	
	public pagingBean(String findWord, String choice, int nowPage, int startNum, int totalCount, int countPerPage,
			int blockCount, int pseq, String place) {
		super();
		this.findWord = findWord;
		this.choice = choice;
		this.nowPage = nowPage;
		this.startNum = startNum;
		this.totalCount = totalCount;
		this.countPerPage = countPerPage;
		this.blockCount = blockCount;
		this.pseq = pseq;
		this.place = place;
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

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	@Override
	public String toString() {
		return "pagingBean [findWord=" + findWord + ", choice=" + choice + ", nowPage=" + nowPage + ", startNum="
				+ startNum + ", totalCount=" + totalCount + ", countPerPage=" + countPerPage + ", blockCount="
				+ blockCount + ", pseq=" + pseq + ", place=" + place + "]";
	}
	
	
}
