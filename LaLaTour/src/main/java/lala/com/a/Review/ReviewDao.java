package lala.com.a.Review;

import java.util.List;

import lala.com.a.model.FestivalDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.model.ReviewDto;
import lala.com.a.util.pagingBean;

public interface ReviewDao {

	public List<ReviewDto> reviewList(pagingBean paging);
	public List<ReviewDto> SearchreviewList(pagingBean paging);
	
	public List<FestivalDto> ftPlaceTitle();
	
	public FestivalDto seachFestival(int seq);
	
	public boolean reviewInsert(ReviewDto dto);
	
	public boolean reviewFileInsert(PdsDto dto);
	
	public List<PdsDto> reviewDetail(int pseq);
	
	/* festival Score Update */
	
	public boolean scoreUpdate(FestivalDto dto);
	
	//review Reply
	public boolean reviewDel(int seq);	
	public List<ReplyDto> reivewReply(pagingBean paging);	
	public boolean reviewReplyInsert(ReplyDto dto);	
	public boolean ReivewreplyUpdate(ReplyDto dto);
	public boolean ReviewanswerDel(ReplyDto dto);
	public boolean reviewAnswerWrite(ReplyDto dto);
	
	//UPDATE
	public ReviewDto reviewUpList(int seq);
	public boolean reviewUpdateAf(PdsDto dto);
	public boolean reviewUpdateAfcontent(PdsDto dto);
	public boolean reviewUpdateAfdelete(int seq);
	public boolean reviewUpdateAfInsert(PdsDto dto);
	public ReviewDto ReviewDetailList(int seq);
	public boolean reviewUpdate(ReviewDto dto);
	
	//review List 
	public List<PdsDto> reviewListPds();
	
	public FestivalDto festivalDetailView(int seq);
	
	
	
}










