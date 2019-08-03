package lala.com.a.bbs;

import java.util.List;

import lala.com.a.model.BbsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.util.pagingBean;

public interface BbsService {

	public List<BbsDto> bbslist(pagingBean paging); // 리스트가져오기
	
	public void bbsWrite(BbsDto dto);	// 글작성
	
	public BbsDto bbsDetail(int seq);	// 글 디테일
	public List<ReplyDto> bbsReplyDetail(pagingBean paging);		// 댓글 가져오기
	
	public void bbsDelete(int seq);		// 글삭제
	
	public void bbsUpdate(BbsDto dto);	// 글수정
	
	public void bbsReply(ReplyDto reply);	// 댓글달기
	public void updateReply(ReplyDto reply); // 댓글수정
	public void deleteReply(int seq);	//댓글삭제
	
	public void bbsAnswer(ReplyDto reply);	//대댓글달기
}
