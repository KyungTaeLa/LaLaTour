package lala.com.a.member;

import java.util.List;

import lala.com.a.hotel.pagingBean;
import lala.com.a.model.BbsDto;
import lala.com.a.model.CalendarDto;
import lala.com.a.model.FestivalDto;
import lala.com.a.model.GoodsDto;
import lala.com.a.model.HotelDto;
import lala.com.a.model.LocationDto;
import lala.com.a.model.MeetingDto;
import lala.com.a.model.MemberDto;
import lala.com.a.model.QuestionDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.model.ReserveDto;
import lala.com.a.model.ReviewDto;
import lala.com.a.util.MemberUtil;

public interface LalaMemberService {

	//로그인
	public MemberDto loginaf(MemberDto dto);
	
	
	//회원가입 관련
	public List<QuestionDto> getQuestionList(); //비밀번호 질문리스트
	public int idSameCheck(String id); //아이디 중복체크
	public boolean addMember(MemberDto dto); //회원가입
	public String findId(MemberDto dto);//아이디찾기
	public String findPwd1(MemberDto dto);//비밀번호 찾기
	public boolean findPwd2(MemberDto dto);//비밀번호 이메일로찾기
	
	public List<CalendarDto> meetCalendar(String id);  // 미팅예약 리스트가져오기
	
//	호텔 예약 갯수
	public int getReserveCont(String id);
	
	public List<CalendarDto> hotelCalendar(String id); // 호텔예약 리스트가져오기
	
	public List<ReserveDto> myReserveList(pagingBean paging);
	
	public boolean myCancelReserve(int seq);
	
//	자기정보
	public MemberDto getMyInfo(String id);
//	회원정보 수정
	public boolean setMyInfo(MemberDto member);
	
	
//	☆★☆★☆★☆  회 ! 원 ! 탈 ! 퇴 ! ★☆★☆★☆★
	
//	회원탈퇴_쇼핑
	public boolean dropMemShop(String id);
//	내 모든 상품평들
	public List<GoodsDto> getDropMemGoods(String id);
//	상품평 별점 최신화
	public boolean setDropMemGoods(GoodsDto goods);
	/*
	 드럽게도 해놓은건많아서 주석도 개같네
//	내가관여한 상품들 목록
	public List<Integer> getDropMemShop(String id);
//	상품평들 총점
	public int getDropMemPoint(int gpseq);
//	상품평 점수 초기화
	public boolean setDropMemPoint(GoodsDto goods);
	*/
//	회원탈퇴_호텔
//	내가관여한 호텔 리스트들
	public List<Integer> getDropMemHotel(String id);
//	 탈퇴회원의 자식댓글들 ref 목록
	public List<Integer> getDropMemRef(String id);
//	관여한 호텔의 댓글갯수와 grade총점
	public MemberUtil getDropMemGrade(int pseq);
//	관여한 호텔 평점 초기화
	public boolean setDropMemGrade(HotelDto hotel);
//	자기후기 + 자식코멘트들 삭제
	public boolean dropMemRereply(int ref);
//	호텔 예약내역 삭제
	public boolean dropMemReserve(String id);
	
//	회원탈퇴_회원
	public boolean setDropMem(String id);
	
	//mypage 내가 쓴 댓글
	public List<ReplyDto> myWriteReply(pagingBean paging);
	//댓글 삭제전 TNAME==HOTEL인거 따로 빼기
	public ReplyDto seachTname(int seq);
	//내가 작성한 댓글 삭제
	public void MyWriteReplyDel(int seq);
	//내가 작성한글 Reivew
	public List<ReviewDto> myWriteReviewList(lala.com.a.hotel.pagingBean paging);
	//내가 작성한 meeting
	public List<MeetingDto> MyWriteMeeting(pagingBean paging);
	//내가 작성한 Bbs
	public List<BbsDto> MyWriteBbs(pagingBean paging);
	//main 에서 festival Thumbnail노출
	public List<FestivalDto> mainThumbNail();
	//main 에서 location 썸네일 노출하기
	public List<LocationDto> locationThumb();
}






