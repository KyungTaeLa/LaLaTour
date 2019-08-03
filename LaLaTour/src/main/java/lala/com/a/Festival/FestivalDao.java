package lala.com.a.Festival;

import java.util.List;

import lala.com.a.model.FestivalDto;
import lala.com.a.model.HotelDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.util.pagingBean;

public interface FestivalDao {
	public List<FestivalDto> sfestival();
	public boolean edateUpdate(int seq);
	
	public List<FestivalDto> endFtList(pagingBean paging);
	public List<FestivalDto> ftList(pagingBean paging);
	
	public boolean ftUpload(FestivalDto dto);
	
	public boolean pamFileUpload(PdsDto pdto);
	
	public boolean multiFileUpload(PdsDto pdto);
	
	//디테일
	public FestivalDto ftDetail(int seq);	
	public List<PdsDto> pdsDetail(int seq);
	//디테일 들어갈때 호텔 리스트 가져오기 위해 한번 더
	public List<HotelDto> HotelJoinFestival(String place);
	
	public boolean festivalDelete(int seq);
	
	public FestivalDto festivalUpdate(int seq);
	public List<PdsDto> pdsUpdate(int seq);
	
	public boolean thumbnailUpdate(FestivalDto dto);
	public boolean pampletUpdate(PdsDto dto);

	public boolean festivalUpdateAf(FestivalDto dto);
	public boolean multiFileUpdate(PdsDto dto);	
	public boolean detailDel(int seq);
	
	//댓글
	public List<ReplyDto> festivalReplyList(pagingBean paging);
	public boolean festivalReplyInsert(ReplyDto dto);
	
	public boolean festivalAnswer(ReplyDto dto);
	public boolean replydel(ReplyDto dto);	
	public boolean replyUpdate(ReplyDto dto);
	
	//score 나누기위해서 reivewTable에서 count(seq)가져옴	
	public int scoreCnt(int pseq);
	

	
}












