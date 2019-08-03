package lala.com.a.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lala.com.a.model.BbsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.util.pagingBean;

@Service
public class BbsServiceImpl implements BbsService {

	@Autowired
	BbsDao bbsDao;

	@Override
	public List<BbsDto> bbslist(pagingBean paging) {

		return bbsDao.bbslist(paging);
	}

	@Override
	public void bbsWrite(BbsDto dto) {
		
		bbsDao.bbsWrite(dto);
	}

	@Override
	public BbsDto bbsDetail(int seq) {
		
		bbsDao.bbsReadcount(seq);
		
		return bbsDao.bbsDetail(seq);
	}

	@Override
	public void bbsDelete(int seq) {

		bbsDao.bbsDelete(seq);
	}

	@Override
	public void bbsUpdate(BbsDto dto) {

		bbsDao.bbsUpdate(dto);
	}

	@Override
	public void bbsReply(ReplyDto reply) {

		bbsDao.bbsReply(reply);
	}

	@Override
	public List<ReplyDto> bbsReplyDetail(pagingBean paging) {

		return bbsDao.bbsReplyDetail(paging);
	}

	@Override
	public void updateReply(ReplyDto reply) {

		bbsDao.updateReply(reply);
	}

	@Override
	public void deleteReply(int seq) {

		bbsDao.deleteReply(seq);
	}

	@Override
	public void bbsAnswer(ReplyDto reply) {

		bbsDao.bbsAnswer(reply);
	}
}
