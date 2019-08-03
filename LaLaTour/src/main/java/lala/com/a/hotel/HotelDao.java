package lala.com.a.hotel;

import java.util.List;

import lala.com.a.model.HotelDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.model.ReserveDto;

public interface HotelDao {
//	호텔리스트
	public List<HotelDto> getHotelList(pagingBean paging);
//  호텔 카운트
	public int getHotelCount(pagingBean paging);
//	글쓰기
	public int writeHotel(HotelDto hotel);
//	글쓰기 시 다중파일 업로드
	public boolean uploadHotelPds(PdsDto pds);
//	호텔 디테일
	public HotelDto getHotelDetail(int seq);
//	호텔 디테일시 불러올 다중파일
	public List<PdsDto> getHotelPds(int pseq);
//	호텔 디테일 시작/끝 날짜
	public List<ReserveDto> getReserveDate(int pseq);
//	예약하기
	public boolean addHotelReserve(ReserveDto reserve);
//	댓글리스트
	public List<ReplyDto> getReplyList(pagingBean paging);
//	댓글 입력
	public boolean addReply(ReplyDto reply);
//	대댓글 입력
	public boolean addRereply(ReplyDto reply);
//  댓글 페이징 카운트
	public int getReplyCount(int pseq);
//	댓글 삭제
	public boolean delReply(ReplyDto reply);
//	다중 파일 삭제
	public boolean delHotelPds(int seq);
//	호텔 수정
	public boolean setHotelUpdate(HotelDto hotel);
//	호텔 삭제
	public boolean setHotelDelete(int seq);
//	호텔 삭제시 댓글삭제
	public boolean setReplyDelete(int seq);
//	댓글 전체의 평점의 합계
	public double getReplyGrade(int pseq);
//	호텔 평점 갱신
	public boolean setHotelGrade(HotelDto hotel);
//	예약 취소할때 보여줄곳
	public ReserveDto getMyReserveOne(int seq);
//	예약취소 신청 (대기중)
	public boolean setReserveCancel(int seq);
//	del = 0인 댓글수
	public ReplyDto getReplyCount2(int pseq);
}
