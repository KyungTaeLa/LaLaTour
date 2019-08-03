package lala.com.a.member;

import java.util.List;

import com.sun.mail.util.QEncoderStream;

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

public interface LalaMemberDao {

	//로그인
	public MemberDto loginaf(MemberDto dto);
	
	
	//회원가입 관련
	public List<QuestionDto> getQuestionList(); //비밀번호 질문리스트
	public int idSameCheck(String id); //아이디 중복체크
	public boolean addMember(MemberDto dto); //회원가입
	public String findId(MemberDto dto);//아이디찾기
	public String findPwd1(MemberDto dto);//비밀번호 찾기
	public boolean findPwd2(MemberDto dto);//비밀번호 이메일로찾기
	
	public List<CalendarDto> meetCalendar(String id); // 미팅예약 리스트가져오기
//	호텔 예약 갯수
	public int getReserveCont(String id);
	
	public List<CalendarDto> hotelCalendar(String id); // 호텔예약 리스트가져오기
//	호텔 예약리스트 (리스트형태 )RETURN TYPE RESERVEDTO
	public List<ReserveDto> myReserveList(pagingBean paging);
//	예약 취소 신청
	public boolean myCancelReserve(int seq);
	
//	자기 정보가져오기(회원수정창bf)
	public MemberDto getMyInfo(String id);
//	회원정보 수정
	public boolean setMyInfo(MemberDto member);
	
//  ☆★☆★☆★☆  회 ! 원 ! 탈 ! 퇴 ! ★☆★☆★☆★
	
//	회원탈퇴_쇼핑
//	상품평 delete
	public boolean dropMemGoods(String id);
//	장바구니 delete
	public boolean dropMemCart(String id);
//	주문내역 delete
	public boolean dropMemOrdered(String id);
	
//	내 모든 상품평들
	public List<GoodsDto> getDropMemGoods(String id);
//	상품평 별점 수정
	public boolean setDropMemGoods(GoodsDto goods);
	
	/*
	 *한거아까워서라도 일단남긴다
//	내가 관여한 상품들 목록
	public List<Integer> getDropMemShop(String id);
//	상품평 합계 점수
	public int getDropMemPoint(int gpseq);
//	상품평 다시셋팅
	public boolean setDropMemPoint(GoodsDto goods);
	*/
	
//	회원탈퇴_호텔
//	내가 관여한 호텔 목록
	public List<Integer> getDropMemHotel(String id);
//	내가관여한 호텔의 후기 갯수와 총점
	public MemberUtil getDropMemGrade(int pseq);
//	호텔 평점 최신화
	public boolean setDropMemGrade(HotelDto hotel);
	
//	 탈퇴회원의 자식댓글들 ref 목록
	public List<Integer> getDropMemRef(String id);
//	자기 후기 + 자식코멘트들 삭제
	public boolean dropMemRereply(int ref);
//	호텔 예약내역 삭제
	public boolean dropMemReserve(String id);
	
	
//	회원탈퇴_회원
	public boolean setDropMem(String id);
	//내가 쓴 댓글
	public List<ReplyDto> myWriteReply(pagingBean paging);
	//댓글 삭제전 TNAME==HOTEL인거 따로 빼기
	public ReplyDto seachTname(int seq);
	//내가 쓴 댓글 삭제
	public void MyWriteReplyDel(int seq);
	//내가 쓴 REVIEW
	public List<ReviewDto> myWriteReviewList(lala.com.a.hotel.pagingBean paging);
	//내가쓴 meeting
	public List<MeetingDto> MyWriteMeeting(pagingBean paging);
	//내가쓴 bbs
	public List<BbsDto> MyWriteBbs(pagingBean paging);
	//메인에서 띄울 thumbNail
	public List<FestivalDto> mainThumbNail();
	
	public List<LocationDto> locationThumb();
	
}












