package lala.com.a.hotel;

import java.util.List;

import lala.com.a.model.HotelDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.model.ReserveDto;

public interface HotelService {
	public List<HotelDto> getHotelList(pagingBean paging);
	public int writeHotel(HotelDto hotel);
	public boolean uploadHotelPds(PdsDto pds);
	public HotelDto getHotelDetail(int seq);
	public List<PdsDto> getHotelPds(int pseq);
	public boolean addHotelReserve(ReserveDto reserve);
	public List<ReserveDto> getReserveDate(int pseq);
	public List<ReplyDto> getReplyList(pagingBean paging);
	public boolean addReply(ReplyDto reply);
	public boolean addRereply(ReplyDto reply);
	public int getReplyCount(int pseq);
	public boolean delReply(ReplyDto reply);
	public int getHotelCount(pagingBean paging);
	public boolean delHotelPds(int seq);
	public boolean setHotelUpdate(HotelDto hotel);
	public boolean setHotelDelete(int seq);
	public double getReplyGrade(int pseq);
	public boolean setHotelGrade(HotelDto hotel);
	public ReserveDto getMyReserveOne(int seq);
	public boolean setReserveCancel(int seq);
	public ReplyDto getReplyCount2(int pseq);
}
