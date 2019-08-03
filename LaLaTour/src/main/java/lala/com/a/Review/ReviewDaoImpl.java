package lala.com.a.Review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lala.com.a.model.FestivalDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.model.ReviewDto;
import lala.com.a.util.pagingBean;
import lala.com.a.util.pagingUtil;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	String fns = "Festival.";
	String ns = "Review.";
	String pns = "Pds.";
	String rns = "Reply.";

	@Autowired
	SqlSession sqlSession;
	

	@Override
	public List<ReviewDto> reviewList(pagingBean paging) {
		int totalCnt=0;
		System.out.println("reviewDaoImpl ReviewList 도착");
		
		totalCnt = sqlSession.selectOne(ns+"reviewList123", paging);
		paging.setTotalCount(totalCnt);
		
		System.out.println("reviewDaoImpl ReviewList TotalCnt : "+totalCnt);		
		pagingUtil.setPagingInfo(paging);
		
		List<ReviewDto> list = sqlSession.selectList(ns+"ReviewList",paging);
		
		return list;
	}	
	
	@Override
	public List<ReviewDto> SearchreviewList(pagingBean paging) {
		System.out.println("SearchreviewListDaoImpl");
		int totalCnt = 0;
		
		totalCnt = sqlSession.selectOne(ns+"SearchreviewListToTalCnt",paging);		
		paging.setTotalCount(totalCnt);
		
		System.out.println("reviewDaoImpl ReviewList TotalCnt : "+totalCnt);		
		pagingUtil.setPagingInfo(paging);
		
		List<ReviewDto> list = sqlSession.selectList(ns+"SearchreviewList",paging);
		
		
		return list;
	}






	@Override
	public List<FestivalDto> ftPlaceTitle() {
		return sqlSession.selectList(ns+"ftPlaceTitle");
	}


	@Override
	public FestivalDto seachFestival(int seq) {
		System.out.println("reivewDaoImpl SearchFestival");
		return sqlSession.selectOne(ns+"seachFestival",seq);
	}


	@Override
	public boolean reviewInsert(ReviewDto dto) {
		System.out.println("reviewInsertDaoImpl@@@"+dto.toString());
		int count=0;
		
		count = sqlSession.insert(ns+"reviewInsert", dto);
		System.out.println("reviewInsertDaoImpl count :"+count);
		return count>0?true:false;
	}


	@Override
	public boolean reviewFileInsert(PdsDto dto) {
		System.out.println("reviewFileInsertDaoImpl"+dto.toString());
		int count = 0;
		count = sqlSession.insert(pns+"reviewFileInsert", dto);
		System.out.println("reviewFileInsertDaoImpl count : "+count);
		return count>0?true:false;
	}


	@Override
	public List<PdsDto> reviewDetail(int pseq) {
		System.out.println("reviewDetailDaoImpl pseq="+pseq);
		List<PdsDto> list = sqlSession.selectList(pns+"reviewDetail", pseq);
		System.out.println("reviewDetailDaoImpl list.size() : "+list.size());
		return list;
	}
	public boolean reviewDel(int seq) {
		int count=0;
		System.out.println("reviewDelDaoImpl");
		count = sqlSession.update(ns+"reviewDel",seq);
		System.out.println("reviewDelDaoImpl count : "+count);
		return count>0?true:false;
	}

	//reviewanswerPaging
	@Override
	public List<ReplyDto> reivewReply(pagingBean paging) {
		//페이징 유틸 사용하기		
		
		System.out.println("reviewReplyDaoImpl");
		int totalCnt = 0;
		totalCnt = sqlSession.selectOne(rns+"reviewTotalCnt", paging);		
		
		
		paging.setTotalCount(totalCnt);
		pagingUtil.setPagingInfo(paging);		
		
		
		
		List<ReplyDto> rlist = sqlSession.selectList(rns+"reivewReply", paging);
		//System.out.println("토ㅗㅗㅗㅗㅗㅗㅗㅗ탈ㄹㄹㄹㄹㄹㄹ카ㅏㅏㅏㅏㅏㅏ운ㄴㄴㄴㄴㄴㄴㄴㄴㄴ트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ"+totalCnt);		
		System.out.println("reviewReplyDaoImpl list.size : "+rlist.size());

		
		
		return rlist;
	}


	@Override
	public boolean reviewReplyInsert(ReplyDto dto) {
		System.out.println("reviewReplyInsertDaoImpl"+dto.toString());
		int count =0;
		count = sqlSession.insert(rns+"reviewReplyInsert",dto);
		System.out.println("reviewReplyInsertDaoImpl count : "+count);
		return count>0?true:false;
	}


	@Override
	public boolean scoreUpdate(FestivalDto dto) {
		System.out.println("scoreUpdatedaoImple");
		int count = 0;
		count = sqlSession.update(fns+"scoreUpdate", dto);
		System.out.println("scoreUpdatedaoImple count : "+count);
		return count>0?true:false;
	}


	@Override
	public boolean ReivewreplyUpdate(ReplyDto dto) {
		System.out.println("ReivewreplyUpdateDaoImpl");
		int count = 0;
		count = sqlSession.update(rns+"ReivewreplyUpdate", dto);
		System.out.println("ReivewreplyUpdateDaoImpl count : "+count);
		return count>0?true:false;
	}

	@Override
	public boolean ReviewanswerDel(ReplyDto dto) {
		System.out.println("ReviewanswerDelDaoImpl");
		int count = 0;
		count = sqlSession.update(rns+"ReviewanswerDel", dto);
		System.out.println("ReviewanswerDelDaoImpl count : "+count);
		return count>0?true:false;
	}


	@Override
	public boolean reviewAnswerWrite(ReplyDto dto) {
		System.out.println("reviewAnswerWriteDaoImpl");
		int count =0;
		count = sqlSession.insert(rns+"reviewAnswerWrite", dto);
		System.out.println("reviewAnswerWrite Count: "+count);
		return count>0?true:false;
	}


	@Override
	public boolean reviewUpdateAf(PdsDto dto) {
		int count=0;
		System.out.println("reviewUpdateAf DaoImpl");
		System.out.println(dto.toString());
		count = sqlSession.update(pns+"reviewUpdateAf",dto);
		System.out.println("reviewUpdateAf DaoImpl count:"+count);
		return count>0?true:false;
	}


	@Override
	public boolean reviewUpdateAfcontent(PdsDto dto) {
		int count=0;
		System.out.println("reviewUpdateAfcontent DaoImpl");
		count = sqlSession.update(pns+"reviewUpdateAfcontent",dto);
		System.out.println("reviewUpdateAfcontent DaoImpl count:"+count);
		return count>0?true:false;
	}


	@Override
	public boolean reviewUpdateAfdelete(int seq) {
		int count=0;
		System.out.println("reviewUpdateAfdelete DaoImpl");
		count = sqlSession.delete(pns+"reviewUpdateAfdelete",seq);
		System.out.println("reviewUpdateAfdelete DaoImpl count:"+count);
		return false;
	}


	@Override
	public boolean reviewUpdateAfInsert(PdsDto dto) {
		int count=0;
		System.out.println("reviewUpdateAfInsert DaoImpl");
		count = sqlSession.insert(pns+"reviewUpdateAfInsert",dto);
		System.out.println("reviewUpdateAfInsert DaoImpl count:"+count);
		return count>0?true:false;
	}


	@Override
	public ReviewDto ReviewDetailList(int seq) {
		System.out.println("ReviewDetailListDaoImpl seq = "+seq);
		ReviewDto dto = sqlSession.selectOne(ns+"ReviewDetailList", seq);
		System.out.println("ReviewDetailListDaoImpl to String"+dto.toString());
		return dto;
	}


	@Override
	public boolean reviewUpdate(ReviewDto dto) {
		System.out.println("reviewUpdateDaoImple : "+dto.toString());
		int count=0;
		count =sqlSession.insert(ns+"reviewUpdate", dto);
		return false;
	}


	@Override
	public ReviewDto reviewUpList(int seq) {
	System.out.println("reviewUpListDaoImpl");
	ReviewDto dto = sqlSession.selectOne(ns+"reviewUpList", seq);
		return dto;
	}


	@Override
	public List<PdsDto> reviewListPds() {
		System.out.println("reviewListPdsDaoImpl");
		return sqlSession.selectList(pns+"reviewListPds");
	}


	@Override
	public FestivalDto festivalDetailView(int seq) {
		return sqlSession.selectOne(fns+"festivalDetailView", seq);
	}
	
	
	
	
}











