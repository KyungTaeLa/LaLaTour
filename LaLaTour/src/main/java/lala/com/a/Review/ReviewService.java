package lala.com.a.Review;

import java.util.List;

import lala.com.a.model.FestivalDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.model.ReviewDto;
import lala.com.a.util.pagingBean;

public interface ReviewService {

	public List<ReviewDto> reviewList(pagingBean paging);
	//축제 후기 보러각
	public List<ReviewDto> SearchreviewList(pagingBean paging);
	
	public List<FestivalDto> ftPlaceTitle();
	
	public FestivalDto seachFestival(int seq);
	
	public boolean reviewInsert(int pseq , String id , String title , double score);
	
	public boolean reviewFileInsert(PdsDto dto);
	
	public List<PdsDto> reviewDetail(int pseq);
	
	
	
	/* festivalScore Update */
	
	public boolean scoreUpdate(int seq , double score);

	/* reviewReply */
	public boolean reviewDel(int seq);
	public List<ReplyDto> reivewReply(pagingBean paging);	
	public boolean reviewReplyInsert(ReplyDto dto);	
	public boolean ReivewreplyUpdate(ReplyDto dto);
	public boolean ReviewanswerDel(ReplyDto dto);
	public boolean reviewAnswerWrite(ReplyDto dto);
	
	//reviewpdsUpdate
	public ReviewDto reviewUpList(int seq);
	public boolean reviewUpdateAf(PdsDto dto);
	public boolean reviewUpdateAfcontent(PdsDto dto);
	public boolean reviewUpdateAfdelete(int seq);
	public boolean reviewUpdateAfInsert(PdsDto dto);
	public ReviewDto ReviewDetailList(int seq);
	public boolean reviewUpdate(ReviewDto dto);
	
	public List<PdsDto> reviewListPds();
	
	public FestivalDto festivalDetailView(int seq);
	
}















