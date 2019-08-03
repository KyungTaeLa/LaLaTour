package lala.com.a.admin;

public class PagingBean {
	private int nowPage;	// 현재 페이지	[1][2][3][4] ~ [10]   [11][12][13][14] ~ [20]
	private int startNum;	// 현재 첫번째 페이지의 row number  << [5][6] 7 [8][9] >>
	private int totalCount;	// 게시판의 총 글의 갯수
	private int countPerPage;	// 페이지당 보여줄 글의 갯수
	private int blockCount;		// page 숫자의 블록 카운트	[1][2][3]
	
	private int search_seq; //검색에 쓰일 seq (아마 product_seq로 주로 쓰이지 않을까 싶다)
	private String id; //로그인한 사람 id (주문내역 selllist에 쓰일 예정)
	
	private String choice;
	private String findWord;
	
	public PagingBean() {}
	
	public int getNowPage() {
		return nowPage;
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
	public String getChoice() {
		return choice;
	}
	public void setChoice(String choice) {
		this.choice = choice;
	}
	public String getFindWord() {
		return findWord;
	}
	public void setFindWord(String findWord) {
		this.findWord = findWord;
	}
	public int getSearch_seq() {
		return search_seq;
	}
	public void setSearch_seq(int search_seq) {
		this.search_seq = search_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "PagingBean [nowPage=" + nowPage + ", startNum=" + startNum + ", totalCount=" + totalCount
				+ ", countPerPage=" + countPerPage + ", blockCount=" + blockCount + ", search_seq=" + search_seq
				+ ", choice=" + choice + ", findWord=" + findWord + "]";
	}
}
