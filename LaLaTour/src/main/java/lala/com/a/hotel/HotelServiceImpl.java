package lala.com.a.hotel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lala.com.a.model.HotelDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.model.ReserveDto;

@Service
public class HotelServiceImpl implements HotelService {

	@Autowired
	HotelDao hotelDao;

	@Override
	public List<HotelDto> getHotelList(pagingBean paging) {
		return hotelDao.getHotelList(paging);
	}

	@Override
	public int writeHotel(HotelDto hotel) {
		return hotelDao.writeHotel(hotel);
	}

	@Override
	public boolean uploadHotelPds(PdsDto pds) {
		return hotelDao.uploadHotelPds(pds);
	}

	@Override
	public HotelDto getHotelDetail(int seq) {
		return hotelDao.getHotelDetail(seq);
	}

	@Override
	public List<PdsDto> getHotelPds(int pseq) {
		return hotelDao.getHotelPds(pseq);
	}

	@Override
	public boolean addHotelReserve(ReserveDto reserve) {
		return hotelDao.addHotelReserve(reserve);
	}

	@Override
	public List<ReserveDto> getReserveDate(int pseq) {
		return hotelDao.getReserveDate(pseq);
	}

	@Override
	public List<ReplyDto> getReplyList(pagingBean paging) {
		return hotelDao.getReplyList(paging);
	}

	@Override
	public boolean addReply(ReplyDto reply) {
		return hotelDao.addReply(reply);
	}

	@Override
	public boolean addRereply(ReplyDto reply) {
		return hotelDao.addRereply(reply);
	}

	@Override
	public int getReplyCount(int pseq) {
		return hotelDao.getReplyCount(pseq);
	}

	@Override
	public boolean delReply(ReplyDto reply) {
		return hotelDao.delReply(reply);
	}

	@Override
	public int getHotelCount(pagingBean paging) {
		return hotelDao.getHotelCount(paging);
	}

	@Override
	public boolean delHotelPds(int seq) {
		return hotelDao.delHotelPds(seq);
	}

	@Override
	public boolean setHotelUpdate(HotelDto hotel) {
		return hotelDao.setHotelUpdate(hotel);
	}

	@Override
	public boolean setHotelDelete(int seq) {
		
		boolean hoChk = hotelDao.setHotelDelete(seq);
		boolean reChk = hotelDao.setReplyDelete(seq);
		
		return (hoChk && reChk)?true:false;
	}

	@Override
	public double getReplyGrade(int pseq) {
		return hotelDao.getReplyGrade(pseq);
	}
	@Override
	public boolean setHotelGrade(HotelDto hotel) {
		return hotelDao.setHotelGrade(hotel);
	}

	@Override
	public ReserveDto getMyReserveOne(int seq) {
		return hotelDao.getMyReserveOne(seq);
	}

	@Override
	public boolean setReserveCancel(int seq) {
		return hotelDao.setReserveCancel(seq);
	}

	@Override
	public ReplyDto getReplyCount2(int pseq) {
		return hotelDao.getReplyCount2(pseq);
	}
	
}
