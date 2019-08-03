package lala.com.a.Review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lala.com.a.model.FestivalDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.model.ReviewDto;
import lala.com.a.util.pagingBean;

@Service
public class ReviewServiceImpl implements ReviewService {

	
	@Autowired
	ReviewDao reviewDao;

	@Override
	public List<ReviewDto> reviewList(pagingBean paging) {
		return reviewDao.reviewList(paging);
	}
	//축제 후기 보러 가기'
	@Override
	public List<ReviewDto> SearchreviewList(pagingBean paging) {
		return reviewDao.SearchreviewList(paging);
	}
	
	
	
	@Override
	public List<FestivalDto> ftPlaceTitle() {
		return reviewDao.ftPlaceTitle();
	}




	@Override
	public FestivalDto seachFestival(int seq) {
		return reviewDao.seachFestival(seq);
	}

	@Override
	public boolean reviewInsert(int pseq , String id , String title , double score) {
		ReviewDto dto = new ReviewDto();
		dto.setPseq(pseq);
		dto.setId(id);
		dto.setTitle(title);
		dto.setScore(score);
		return reviewDao.reviewInsert(dto);
	}

	@Override
	public boolean reviewFileInsert(PdsDto dto) {
		return reviewDao.reviewFileInsert(dto);
	}

	@Override
	public List<PdsDto> reviewDetail(int pseq) {
		return reviewDao.reviewDetail(pseq);
	}

	@Override
	public boolean reviewDel(int seq) {
		return reviewDao.reviewDel(seq);
	}

	@Override
	public List<ReplyDto> reivewReply(pagingBean paging) {
		return reviewDao.reivewReply(paging);
	}

	@Override
	public boolean reviewReplyInsert(ReplyDto dto) {
		return reviewDao.reviewReplyInsert(dto);
	}

	@Override
	public boolean scoreUpdate(int seq, double score) {
		FestivalDto dto = new FestivalDto();
		
		dto.setSeq(seq);
		dto.setScore(score);		
		return reviewDao.scoreUpdate(dto);
	}

	@Override
	public boolean ReivewreplyUpdate(ReplyDto dto) {
		return reviewDao.ReivewreplyUpdate(dto);
	}

	@Override
	public boolean ReviewanswerDel(ReplyDto dto) {
		return reviewDao.ReviewanswerDel(dto);
	}

	@Override
	public boolean reviewAnswerWrite(ReplyDto dto) {
		return reviewDao.reviewAnswerWrite(dto);
	}

	@Override
	public boolean reviewUpdateAf(PdsDto dto) {
		return reviewDao.reviewUpdateAf(dto);
	}

	@Override
	public boolean reviewUpdateAfcontent(PdsDto dto) {
		return reviewDao.reviewUpdateAfcontent(dto);
	}

	@Override
	public boolean reviewUpdateAfdelete(int seq) {
		return reviewDao.reviewUpdateAfdelete(seq);
	}

	@Override
	public boolean reviewUpdateAfInsert(PdsDto dto) {
		return reviewDao.reviewUpdateAfInsert(dto);
	}

	@Override
	public ReviewDto ReviewDetailList(int seq) {
		return reviewDao.ReviewDetailList(seq);
	}

	@Override
	public boolean reviewUpdate(ReviewDto dto) {
		return reviewDao.reviewUpdate(dto);
	}

	@Override
	public ReviewDto reviewUpList(int seq) {
		return reviewDao.reviewUpList(seq);
	}

	@Override
	public List<PdsDto> reviewListPds() {
		return reviewDao.reviewListPds() ;
	}

	@Override
	public FestivalDto festivalDetailView(int seq) {
		return reviewDao.festivalDetailView(seq);
	}
	
	
	
	
	
	
	
	
}
