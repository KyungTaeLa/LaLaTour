package lala.com.a.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lala.com.a.hotel.pagingBean;
import lala.com.a.hotel.pagingUtil;
import lala.com.a.member.LalaMemberDao;
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

@Repository
public class LalaMemberDaoImpl implements LalaMemberDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Member.";

	//로그인
	@Override
	public MemberDto loginaf(MemberDto dto) {
		return sqlSession.selectOne(ns+"loginaf", dto);
	}

	@Override
	public List<QuestionDto> getQuestionList() {
		// 비밀번호 질문리스트
		return sqlSession.selectList(ns+"getQuestionList");
	}

	@Override
	public int idSameCheck(String id) {
		// 아이디 중복체크
		return sqlSession.selectOne(ns+"idsamecheck", id);
	}

	@Override
	public boolean addMember(MemberDto dto) {
		// 회원가입
		int n = sqlSession.insert(ns+"addmember", dto);
		return n>0? true:false;
	}

	@Override
	public String findId(MemberDto dto) {
		System.out.println("들어옴");
		String id =  "아이디를 찾을 수 없습니다";
		String selid =	sqlSession.selectOne(ns+"findId", dto);	
		if( selid != null) {
			System.out.println("들어옴2");
			id = selid;
		}
		System.out.println("들어옴3");
		
		return id;
	}

	@Override
	public String findPwd1(MemberDto dto) {

		String pwd = "비밀번호를 찾을 수 없습니다.";
		
		String selPwd = sqlSession.selectOne(ns+"findPwd1", dto);	
		
		if( selPwd != null) {
			System.out.println("들어옴2");
			pwd = selPwd;
		}
		
		return pwd;
	}

	@Override
	public boolean findPwd2(MemberDto dto) {

		int n = sqlSession.update(ns+"findPwd2", dto);
		
		return n>0?true:false;
	}

	@Override
	public List<CalendarDto> meetCalendar(String id) {

		
		return sqlSession.selectList(ns+"meetingCalendar", id);
	}

	@Override
	public List<CalendarDto> hotelCalendar(String id) {

		return sqlSession.selectList(ns+"hotelCalendar", id);
	}

	@Override
	public List<ReserveDto> myReserveList(pagingBean paging) {
		return sqlSession.selectList(ns+"getReserveList",paging);
	}

	@Override
	public boolean myCancelReserve(int seq) {
		int n = sqlSession.update(ns+"reqCancelReserve",seq);
		return n>0?true:false;
	}

	@Override
	public int getReserveCont(String id) {
		return sqlSession.selectOne(ns+"getReserveCount",id);
	}

	@Override
	public MemberDto getMyInfo(String id) {
		return sqlSession.selectOne(ns+"getMyInfo",id);
	}

	@Override
	public boolean setMyInfo(MemberDto member) {
		int n = sqlSession.update(ns+"setMyInfo",member);
		
		return n>0?true:false;
	}

	@Override
	public boolean dropMemGoods(String id) {
		int n = sqlSession.delete(ns+"dropMemGoods",id);
		return n>0?true:false;
	}

	@Override
	public boolean dropMemCart(String id) {
		int n = sqlSession.delete(ns+"dropMemCart",id);
		return n>0?true:false;
	}

	@Override
	public boolean dropMemOrdered(String id) {
		int n = sqlSession.delete(ns+"dropMemOrdered",id);
		return n>0?true:false;
	}

	@Override
	public List<Integer> getDropMemRef(String id) {
		return sqlSession.selectList(ns+"getDropMemRef",id);
	}

	@Override
	public boolean dropMemRereply(int ref) {
		int n = sqlSession.delete(ns+"dropMemRereply",ref);
		return n>0?true:false;
	}

	@Override
	public boolean setDropMem(String id) {
		int n=  sqlSession.update(ns+"setDropMem",id);
		return n>0?true:false;
	}

	@Override
	public boolean dropMemReserve(String id) {
		int n = sqlSession.delete(ns+"dropMemReserve",id);
		return n>0?true:false;
	}

	@Override
	public List<Integer> getDropMemHotel(String id) {
		return sqlSession.selectList(ns+"getDropMemHotel",id);
	}

	@Override
	public MemberUtil getDropMemGrade(int pseq) {
		MemberUtil mem = sqlSession.selectOne(ns+"getDropMemGrade",pseq);
		System.out.println("dao impl pseq : " + pseq);
		System.out.println("카운트 : " +mem.getCount());
		System.out.println("그레이드 : " + mem.getGrade());
		return mem;
	}

	@Override
	public boolean setDropMemGrade(HotelDto hotel) {
		int n = sqlSession.update(ns+"setDropMemGrade",hotel);
		return n>0?true:false;
	}
/*
 * 잠깐만꺼져있어봐
	@Override
	public List<Integer> getDropMemShop(String id) {
		return sqlSession.selectList(ns+"getDropMemShop",id);
	}

	@Override
	public int getDropMemPoint(int gpseq) {
		return sqlSession.selectOne(ns+"getDropMemPoint",gpseq);
	}

	@Override
	public boolean setDropMemPoint(GoodsDto goods) {
		int n = sqlSession.update(ns+"setDropMemPoint",goods);
		return n>0?true:false;
	}
*/
	@Override
	public List<GoodsDto> getDropMemGoods(String id) {
		return sqlSession.selectList(ns+"getDropMemGoods",id);
	}

	@Override
	public boolean setDropMemGoods(GoodsDto goods) {
		int n  = sqlSession.update(ns+"setDropMemGoods",goods);
		
		return n>0?true:false;
	}

	// My page 내가쓴글댓글
		@Override
		public List<ReplyDto> myWriteReply(pagingBean paging) {
			int totalCnt = sqlSession.selectOne("Reply.MyReplyTotalCnt", paging);
			paging.setTotalCount(totalCnt);
			pagingUtil.setPagingInfo(paging, "MyWriteReply");
			
			return sqlSession.selectList("Reply.myWriteReply", paging);
		}
	//댓글 삭제전 TNAME==HOTEL인거 따로 빼기
	@Override
	public ReplyDto seachTname(int seq) {
		return sqlSession.selectOne("Reply.seachTname", seq);
		}
		
		
	//내가 작성한 댓글 삭제
	@Override
	public void MyWriteReplyDel(int seq) {
		System.out.println("MyWriteReplyDelDaoImpl seq="+seq);
		sqlSession.update("Reply.MyWriteReplyDel", seq);		
	}


		//내가쓴글 Reivew
		@Override
		public List<ReviewDto> myWriteReviewList(pagingBean paging) {
			System.out.println("myWriteReviewListDaoImpl");		
			System.out.println("myWriteReviewListDaoImpl paging 여기맞지? "+paging.toString());
			
			
			int cnt = sqlSession.selectOne("Review.reviewTotalCnt",paging);//error
			
			paging.setTotalCount(cnt);
			pagingUtil.setPagingInfo(paging, "review");
			
			List<ReviewDto> list = sqlSession.selectList("Review.myWriteReviewList",paging);
		
			System.out.println("myWriteReviewListPaging Success");
			return list;
		}
		//내가 쓴 meeting
		@Override
		public List<MeetingDto> MyWriteMeeting(pagingBean paging) {
			System.out.println("MyWriteMeetingDaoImpl");
			int cnt = 0;
			cnt = sqlSession.selectOne("meeting.meetingToTalcnt", paging);
			System.out.println("MyWriteMeetingDaoImpl Cnt"+cnt);
			paging.setTotalCount(cnt);
			pagingUtil.setPagingInfo(paging, "meeting");
			
			List<MeetingDto> list = sqlSession.selectList("meeting.MyWriteMeeting", paging);
			System.out.println("MyWriteMeetingDaoImplPagingSuccess");
			return list;
		}
		//내가 쓴 bbs

		@Override
		public List<BbsDto> MyWriteBbs(pagingBean paging) {
			System.out.println("MyWriteBbsDaoImpl");
			int cnt = 0;
			cnt = sqlSession.selectOne("Bbs.MyWriteBbsCnt", paging);
			System.out.println("MyWriteBbsDaoImpl Cnt:" + cnt);
			paging.setTotalCount(cnt);
			pagingUtil.setPagingInfo(paging, "BBS");
			
			List<BbsDto> list = sqlSession.selectList("Bbs.MyWriteBbs", paging);
			for (int i = 0; i < list.size(); i++) {
				System.out.println("MyWriteBbs@@"+list.get(i).toString());
			}
			
			System.out.println("MyWriteBbsDaoImplPaging Success");
			
			return list;
		}
		//메인에서 festival ThumbNail 띄우기

		@Override
		public List<FestivalDto> mainThumbNail() {
			System.out.println("mainThumbNailDaoImpl");
			return sqlSession.selectList("Festival.mainThumbNail") ;
		}

		@Override
		public List<LocationDto> locationThumb() {

			
			return sqlSession.selectList("Attrac.mainThumb") ;
		}
		
		
	
	
	
	
}
