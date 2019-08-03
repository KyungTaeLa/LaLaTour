package lala.com.a.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lala.com.a.hotel.pagingBean;
import lala.com.a.member.LalaMemberDao;
import lala.com.a.member.LalaMemberService;
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

@Service
public class LalaMemberServiceImpl implements LalaMemberService {

	@Autowired
	LalaMemberDao lalaMemberDao;

	@Override
	public MemberDto loginaf(MemberDto dto) {
		// 로그인
		return lalaMemberDao.loginaf(dto);
	}

	@Override
	public List<QuestionDto> getQuestionList() {
		// 비밀번호 질문리스트
		return lalaMemberDao.getQuestionList();
	}

	@Override
	public int idSameCheck(String id) {
		// 아이디 중복체크
		return lalaMemberDao.idSameCheck(id);
	}

	@Override
	public boolean addMember(MemberDto dto) {
		// 회원가입
		return lalaMemberDao.addMember(dto);
	}

	@Override
	public String findId(MemberDto dto) {

		
		String id = lalaMemberDao.findId(dto);
		
		System.out.println("service 리턴직전");
		return id;
	}

	@Override
	public String findPwd1(MemberDto dto) {

		return lalaMemberDao.findPwd1(dto);
	}

	@Override
	public boolean findPwd2(MemberDto dto) {

		return lalaMemberDao.findPwd2(dto);
	}

	@Override
	public List<CalendarDto> meetCalendar(String id) {
		return lalaMemberDao.meetCalendar(id);
	}

	@Override
	public List<CalendarDto> hotelCalendar(String id) {

		return lalaMemberDao.hotelCalendar(id);
	}

	@Override
	public List<ReserveDto> myReserveList(pagingBean paging) {
		return lalaMemberDao.myReserveList(paging);
	}

	@Override
	public boolean myCancelReserve(int seq) {
		return lalaMemberDao.myCancelReserve(seq);
	}

	@Override
	public int getReserveCont(String id) {
		return lalaMemberDao.getReserveCont(id);
	}

	@Override
	public MemberDto getMyInfo(String id) {
		return lalaMemberDao.getMyInfo(id);
	}

	@Override
	public boolean setMyInfo(MemberDto member) {
		return lalaMemberDao.setMyInfo(member);
	}

	@Override
	public boolean dropMemShop(String id) {
		boolean goods = lalaMemberDao.dropMemGoods(id);
		boolean cart = lalaMemberDao.dropMemCart(id);
		boolean ordered = lalaMemberDao.dropMemOrdered(id);
		
		
		return goods && cart && ordered;
	}

	@Override
	public List<Integer> getDropMemRef(String id) {
		return lalaMemberDao.getDropMemRef(id);
	}

	@Override
	public boolean dropMemRereply(int ref) {
		return lalaMemberDao.dropMemRereply(ref);
	}

	@Override
	public boolean setDropMem(String id) {
		return lalaMemberDao.setDropMem(id);
	}

	@Override
	public boolean dropMemReserve(String id) {
		return lalaMemberDao.dropMemReserve(id);
	}

	@Override
	public List<Integer> getDropMemHotel(String id) {
		return lalaMemberDao.getDropMemHotel(id);
	}
	
	@Override
	public MemberUtil getDropMemGrade(int pseq) {
		return lalaMemberDao.getDropMemGrade(pseq);
	}

	@Override
	public boolean setDropMemGrade(HotelDto hotel) {
		return lalaMemberDao.setDropMemGrade(hotel);
	}
/*
	@Override
	public List<Integer> getDropMemShop(String id) {
		return lalaMemberDao.getDropMemShop(id);
	}

	@Override
	public int getDropMemPoint(int gpseq) {
		return lalaMemberDao.getDropMemPoint(gpseq);
	}

	@Override
	public boolean setDropMemPoint(GoodsDto goods) {
		return lalaMemberDao.setDropMemPoint(goods);
	}
*/
	
	@Override
	public List<GoodsDto> getDropMemGoods(String id) {
		return lalaMemberDao.getDropMemGoods(id);
	}

	@Override
	public boolean setDropMemGoods(GoodsDto goods) {
		return lalaMemberDao.setDropMemGoods(goods);
	}
	//내가 쓴 댓글	
	@Override
	public List<ReplyDto> myWriteReply(pagingBean paging) {
		return lalaMemberDao.myWriteReply(paging);	
	}
	//댓글 삭제전 TNAME==HOTEL인거 따로 빼기
	@Override
	public ReplyDto seachTname(int seq) {
		return lalaMemberDao.seachTname(seq);
	}

	//내가쓴 댓글 삭제
	@Override
	public void MyWriteReplyDel(int seq) {
		lalaMemberDao.MyWriteReplyDel(seq);
		
	}
	
	//내가 작성한 review
	@Override
	public List<ReviewDto> myWriteReviewList(lala.com.a.hotel.pagingBean paging) {
		return lalaMemberDao.myWriteReviewList(paging);
	}
	//내가 작성한 meeting
	@Override
	public List<MeetingDto> MyWriteMeeting(pagingBean paging) {
		return lalaMemberDao.MyWriteMeeting(paging);
	}
	//내가 작성한 Bbs

	@Override
	public List<BbsDto> MyWriteBbs(pagingBean paging) {
		return lalaMemberDao.MyWriteBbs(paging);
	}
	//main에서 festivalthumbNail 사진 보기
	@Override
	public List<FestivalDto> mainThumbNail() {
		// TODO Auto-generated method stub
		return lalaMemberDao.mainThumbNail();
	}

	// 메인에서 지역명소 썸네일 
	@Override
	public List<LocationDto> locationThumb() {
		
		
		return lalaMemberDao.locationThumb();
	}
	
	
	
	
	
	
	
	
	
}
