package lala.com.a.hotel;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lala.com.a.model.HotelDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.model.ReserveDto;

@Repository
public class HotelDaoImpl implements HotelDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String ns = "Hotel.";

	@Override
	public List<HotelDto> getHotelList(pagingBean paging) {
		return sqlSession.selectList(ns+"getHotelList",paging);
	}

	@Override
	public int writeHotel(HotelDto hotel) {
		sqlSession.insert(ns+"writeHotel",hotel);
		int pseq = hotel.getSeq();
		System.out.println("다오 seq : " + pseq);
		return pseq;
	}

	@Override
	public boolean uploadHotelPds(PdsDto pds) {
		int n = sqlSession.insert(ns+"uploadHotelPds",pds);
		return n>0?true:false;
	}

	@Override
	public HotelDto getHotelDetail(int seq) {
		return sqlSession.selectOne(ns+"getHotelDetail",seq);
	}

	@Override
	public List<PdsDto> getHotelPds(int pseq) {
		return sqlSession.selectList(ns+"getHotelPds",pseq);
	}

	@Override
	public boolean addHotelReserve(ReserveDto reserve) {
		int n = sqlSession.insert(ns+"addHotelReserve",reserve);
		return n>0?true:false;
	}

	@Override
	public List<ReserveDto> getReserveDate(int pseq) {
		return sqlSession.selectList(ns+"getReserveDate",pseq);
	}

	@Override
	public List<ReplyDto> getReplyList(pagingBean paging) {
		System.out.println("paging : " + paging.toString());
		return sqlSession.selectList(ns+"getReplyList",paging);
	}

	@Override
	public boolean addReply(ReplyDto reply) {
		int n = sqlSession.insert(ns+"addReply",reply);
		return n > 0?true:false;
	}

	@Override
	public boolean addRereply(ReplyDto reply) {
		int n = sqlSession.insert(ns+"addRereply",reply);
		return n>0?true:false;
	}

	@Override
	public int getReplyCount(int pseq) {
		System.out.println("pseq : " + pseq);
		int count = sqlSession.selectOne(ns+"getReplyCount",pseq);
		return count;
	}

	@Override
	public boolean delReply(ReplyDto reply) {
		int n = sqlSession.update(ns+"delReply",reply);
		return n>0?true:false;
	}

	@Override
	public int getHotelCount(pagingBean paging) {
		int count = sqlSession.selectOne(ns+"getHotelCount",paging);
		return count;
	}

	@Override
	public boolean delHotelPds(int seq) {
		int n = sqlSession.delete(ns+"delHotelPds",seq);
		return n>0?true:false;
	}

	@Override
	public boolean setHotelUpdate(HotelDto hotel) {
		int n = sqlSession.update(ns+"setHotelUpdate",hotel);
		return n>0?true:false;
	}

	@Override
	public boolean setHotelDelete(int seq) {
		int n = sqlSession.update(ns+"setHotelDelete",seq);
		return n>0?true:false;
	}

	@Override
	public boolean setReplyDelete(int seq) {
		int n=  sqlSession.update(ns+"setReplyDelete",seq);
		return n>0?true:false;
	}

	@Override
	public double getReplyGrade(int pseq) {
		System.out.println("여기까진오고 : " + pseq);
		double count = sqlSession.selectOne(ns+"getReplyGrade",pseq);
		System.out.println("여기는 안오는거지?");
		return count;
	}

	@Override
	public boolean setHotelGrade(HotelDto hotel) {
		int n= sqlSession.update(ns+"setHotelGrade",hotel);
		return n>0?true:false;
	}

	@Override
	public ReserveDto getMyReserveOne(int seq) {
		return sqlSession.selectOne(ns+"getMyReserveOne",seq);
	}

	@Override
	public boolean setReserveCancel(int seq) {
		int n = sqlSession.update(ns+"setReserveCancel",seq);
		return n>0?true:false;
	}

	@Override
	public ReplyDto getReplyCount2(int pseq) {
		return sqlSession.selectOne(ns+"getReplyCount2",pseq);
	}
 
}
