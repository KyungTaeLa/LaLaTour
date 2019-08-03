package lala.com.a.Festival;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lala.com.a.model.FestivalDto;
import lala.com.a.model.HotelDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.util.pagingBean;
import lala.com.a.util.FUpUtil;
import lala.com.a.util.pagingUtil;

@Repository
public class FestivalDaoImpl implements FestivalDao {

	

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Festival.";
	String pns = "Pds.";
	String rns = "Reply.";

	
	
	
	@Override
	public List<FestivalDto> sfestival() {
		System.out.println("sfestivaldaoimpl도척");
		return sqlSession.selectList(ns+"sfestival");
	}

	@Override
	public boolean edateUpdate(int seq) {
		System.out.println("festivalEdateUpdateDaoImpl");
		int count =0;
		count = sqlSession.update(ns+"edateUpdate",seq);
		System.out.println("festivalEdateUpdateDaoImpl count : "+count);
		return count>0?true:false;
	}

	


	@Override
	public List<FestivalDto> endFtList(pagingBean paging) {
		int totalCnt =0;
		totalCnt = sqlSession.selectOne(ns+"endtotalCnt", paging);
		paging.setTotalCount(totalCnt);
		System.out.println("eendFtListDaoImpl totalCnt"+totalCnt);
		pagingUtil.setPagingInfo(paging);
		
		List<FestivalDto> list =sqlSession.selectList(ns+"endFtList", paging);
		return list;
	}

	@Override
	public List<FestivalDto> ftList(pagingBean paging) {
		/* System.out.println("Festival dao impl 도착"); */
		int totalCnt = 0;
		String choice = paging.getChoice().trim();
		paging.setChoice(choice);
		System.out.println("--@@--"+paging.toString());
		totalCnt = sqlSession.selectOne(ns+"totalCnt",paging);
		System.out.println("paing TotalCnt : "+totalCnt);
		System.out.println("왔음");
		paging.setTotalCount(totalCnt);
		pagingUtil.setPagingInfo(paging);
		System.out.println("왔음2");
	
		List<FestivalDto> list = sqlSession.selectList(ns+"ftList",paging);
		 System.out.println("Paging 나왔음"); 
		return list;
	}

	@Override
	public boolean ftUpload(FestivalDto dto) {		
		int count=0;
		System.out.println("페스티벌 업로드 도착 : " + dto.toString());
		
		count = sqlSession.insert(ns+"ftUpload",dto);
		System.out.println("FestivalDaoImpl ftUpload count : "+count);
		return count>0?true:false;
	}

	@Override
	public boolean pamFileUpload(PdsDto pdto) {
		int count = 0;
		System.out.println("팜플렛 업로드 도착 :" + pdto.toString());
		count = sqlSession.insert(pns+"pamFileUpload", pdto);
		System.out.println("팜플렛 카운트 : "+count);
		
		return count>0?true:false;
	}

	@Override
	public boolean multiFileUpload(PdsDto pdto) {
		int count = 0;
		System.out.println("멀티파일 업로드 도착"+pdto.toString());
		count = sqlSession.insert(pns+"multiFileUpload", pdto);
		System.out.println("멀티파일 카운트 : "+count);
		return count>0?true:false;
	}

	@Override
	public FestivalDto ftDetail(int seq) {
		//System.out.println("ftDetail Dao 도착");
		FestivalDto dto= sqlSession.selectOne(ns+"festivalDetailView", seq);
		//System.out.println("ftDetail Dao 에서 뽑아온 데이터" + dto.toString());
		return dto;
	}

	@Override
	public List<PdsDto> pdsDetail(int seq) {
		
		System.out.println("PdsDetail Dao 도착");
		List<PdsDto> list = sqlSession.selectList(pns+"PdsDetail", seq);
		
		for (int i = 0; i < list.size(); i++) {	
			PdsDto dto = list.get(i);
		System.out.println("PdsDetail Dao 에서 뽑아온 데이터 : "+dto.toString());
		}
		System.out.println("디테일 다오 나옴 파일");
		return list;
	}

	@Override
	public boolean festivalDelete(int seq) {
		int count=0;
		count = sqlSession.update(ns+"festivalDelete", seq);
		//System.out.println("festivalDelete 도착 Count확인 :"+count);
		return count>0?true:false;
	}

	@Override
	public FestivalDto festivalUpdate(int seq) {
		System.out.println("festivalUpdate DaoImpl = seq"+seq);
		FestivalDto dto = sqlSession.selectOne(ns+"festivalUpdate", seq);
		//System.out.println("festivalUpdate DaImpl sql Select = "+dto.toString());
		return dto;
	}

	@Override
	public List<PdsDto> pdsUpdate(int seq) {
		//System.out.println("festivalPdsUpdate seq="+seq);
		List<PdsDto> list = sqlSession.selectList(pns+"pdsUpdateList", seq);
		//System.out.println("festivalPdsUpdate list.size()"+list.size());
		return list;
	}

	@Override
	public boolean thumbnailUpdate(FestivalDto dto) {
		System.out.println("festival thumbnailUpdate seq,thumbnail : "+dto.getSeq()+dto.getThumbnail());
		int count = 0;
		count = sqlSession.update(ns+"thumbnailUpdate", dto);
		System.out.println("festival thumbnailUpdate count =" + count);
		return count>0?true:false;
	}

	@Override
	public boolean pampletUpdate(PdsDto dto) {
		System.out.println("pampletUpdate daoImpl :"+dto.toString());
		int count = 0;
		count = sqlSession.update(pns+"pampletUpdate", dto);
		System.out.println("pampletUpdate count : "+count);
		
		return count>0?true:false;
	}


	@Override
	public boolean festivalUpdateAf(FestivalDto dto) {
		System.out.println("festivalUpdateAf DaoImpl : "+ dto.toString());
		int count=0;
		count = sqlSession.update(ns+"festivalUpdateAf", dto);
		System.out.println("festivalUpdateAf count : "+count);
		return count>0?true:false;
	}

	
	  @Override public boolean detailDel(int seq) { int count =
	  sqlSession.delete(pns+"detailDel", seq);
	  System.out.println("fetivaldetailDel daoImpl count :" + count); return
	  count>0?true:false; }

	@Override
	public boolean multiFileUpdate(PdsDto dto) {
		System.out.println("multiFileUpdate daoImpl :"+dto.toString());
		int count = 0;
		count = sqlSession.insert(pns+"multiFileUpdate",dto);
		System.out.println("multiFileIpdate count : "+count);
		return count>0?true:false;
	}

	@Override
	public List<ReplyDto> festivalReplyList(pagingBean paging) {
		/* replypaging */
		System.out.println("festivalReplyList DaoImpl"); 
		int count =0;
		count = sqlSession.selectOne(rns+"TotalCnt", paging);
		System.out.println("festivalReplyList totalcount:"+count);
		paging.setTotalCount(count);
		System.out.println("댓글 토탈카운트 집어넣었음");
		pagingUtil.setPagingInfo(paging);
		System.out.println("totalcount setPagingInfo success");		
		
		
		List<ReplyDto> list = sqlSession.selectList(rns+"festivalReplyList",paging);
		 System.out.println("festivalReplyList list.size:"+list.size());
		 System.out.println("festivalreplyList daoimpl pagingInsert success");
		return list;
	}

	@Override
	public boolean festivalReplyInsert(ReplyDto dto) {
		System.out.println("festivalReplyInsert daoImpl");
		int count = 0;
		System.out.println("festivalReplyInsert daoImpl "+dto.toString());
		count = sqlSession.insert(rns+"festivalReplyInsert",dto);
		System.out.println("festivalReplyInsert count : "+count);
		return count>0?true:false;
	}

	@Override
	public boolean festivalAnswer(ReplyDto dto) {	
		System.out.println("festivalAnswer daoImpl "+dto.toString());
		int count=0; 
		count= sqlSession.insert(rns+"answer", dto); 
		System.out.println("festivalAnswer daImpl count:"+count);
		return count>0?true:false;
	}

	@Override
	public boolean replydel(ReplyDto dto) {
		int count=0;
		count = sqlSession.update(rns+"replydel", dto);
		return count>0?true:false;
	}

	@Override
	public boolean replyUpdate(ReplyDto dto) {
		int count=0;
		System.out.println("replyUpdate 도착");
		count = sqlSession.update(rns+"replyUpdate", dto);
		System.out.println("replyUpdate count:"+count);
		return count>0?true:false;
	}

	
	//score 나누기위해서 reivewTable에서 count(seq)가져옴	
	@Override
	public int scoreCnt(int pseq) {
		System.out.println("scoreCnt DaoImple");
		int scoreCnt = sqlSession.selectOne("Review.scoreCnt", pseq);
		System.out.println("scoreCnt DaoImple score : "+scoreCnt);
		return scoreCnt;
	}
	//호텔 리스트 가져옴
	@Override
	public List<HotelDto> HotelJoinFestival(String place) {
		System.out.println("HotelJoinFestival()DaoImpl place : "+place);
		List<HotelDto> list = sqlSession.selectList("Hotel.HotelJoinFestival", place);
		System.out.println("HotelJoinFestival()DaoImpl list.size() : "+list.size());
		
		return list;
	}

	
	
	
	
	
	
	
}






