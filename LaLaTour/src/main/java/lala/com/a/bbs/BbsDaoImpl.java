package lala.com.a.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lala.com.a.model.BbsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.util.pagingBean;
import lala.com.a.util.pagingUtil;

@Repository
public class BbsDaoImpl implements BbsDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String ns = "Bbs.";
	
	@Override
	public List<BbsDto> bbslist(pagingBean paging) {
	
		int totalCount = sqlSession.selectOne(ns+"totalCount");
		paging.setTotalCount(totalCount);
		pagingUtil.setPagingInfo(paging);
		
		List<BbsDto> bbslist = sqlSession.selectList(ns+"bbsList", paging);
		
		
		return bbslist;
	}

	@Override
	public void bbsWrite(BbsDto dto) {
		
		sqlSession.insert(ns+"bbsWrite", dto);
		
	}

	@Override
	public BbsDto bbsDetail(int seq) {
		
		return sqlSession.selectOne(ns+"bbsDetail", seq);
	}

	@Override
	public void bbsReadcount(int seq) {

		sqlSession.update(ns+"bbsReadcount", seq);
	}

	@Override
	public void bbsDelete(int seq) {

		sqlSession.update(ns+"bbsDelete", seq);
	}

	@Override
	public void bbsUpdate(BbsDto dto) {

		sqlSession.update(ns+"bbsUpdate", dto);
	}

	@Override
	public void bbsReply(ReplyDto reply) {

		sqlSession.insert(ns+"bbsReply", reply);
	}

	@Override
	public List<ReplyDto> bbsReplyDetail(pagingBean paging) {

		int totalCnt = sqlSession.selectOne(ns+"replyCount",paging.getPseq());
		paging.setTotalCount(totalCnt);
		
		System.out.println("댓글갯수와 seq : " + paging.getPseq() + " " + paging.getTotalCount());
		pagingUtil.setPagingInfo(paging);
		
		
		return sqlSession.selectList(ns+"bbsReplyDetail", paging);
	}

	@Override
	public void updateReply(ReplyDto reply) {
		
		sqlSession.update(ns+"updateReply", reply);
	}

	@Override
	public void deleteReply(int seq) {

		sqlSession.update(ns+"deleteReply", seq);	
	}

	@Override
	public void bbsAnswer(ReplyDto reply) {

		System.out.println("다오 들어오나1");
		sqlSession.insert(ns+"bbsAnswer" , reply);
		System.out.println("다오 들어오나2");
	}

}
