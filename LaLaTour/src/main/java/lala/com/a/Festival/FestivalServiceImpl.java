package lala.com.a.Festival;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lala.com.a.model.FestivalDto;
import lala.com.a.model.HotelDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.util.pagingBean;

@Service
public class FestivalServiceImpl implements FestivalService {

	@Autowired
	FestivalDao festivaldao;
	
	
	@Override
	public List<FestivalDto> sfestival() {
		return festivaldao.sfestival();
	}

	@Override
	public boolean edateUpdate(int seq) {
		return festivaldao.edateUpdate(seq);
	}



	@Override
	public List<FestivalDto> endFtList(pagingBean paging) {
		return festivaldao.endFtList(paging);
	}

	@Override
	public List<FestivalDto> ftList(pagingBean paging) {
		return festivaldao.ftList(paging);
	}

	@Override
	public boolean ftUpload(FestivalDto dto) {
		return festivaldao.ftUpload(dto);
	}

	@Override
	public boolean pamFileUpload(PdsDto pdto) {
		return festivaldao.pamFileUpload(pdto);
	}

	@Override
	public boolean multiFileUpload(PdsDto pdto) {
		return festivaldao.multiFileUpload(pdto);
	}

	@Override
	public FestivalDto ftDetail(int seq) {
		return festivaldao.ftDetail(seq);
		
		
	}

	@Override
	public List<PdsDto> pdsDetail(int seq) {
		return festivaldao.pdsDetail(seq);
	}

	@Override
	public boolean festivalDelete(int seq) {
		return festivaldao.festivalDelete(seq);
	}

	@Override
	public FestivalDto festivalUpdate(int seq) {
		return festivaldao.festivalUpdate(seq);
	}

	@Override
	public List<PdsDto> pdsUpdate(int seq) {
		
		return festivaldao.pdsUpdate(seq);
	}

	@Override
	public boolean thumbnailUpdate(FestivalDto dto) {
		return festivaldao.thumbnailUpdate(dto);
	}

	@Override
	public boolean pampletUpdate(PdsDto dto) {
		return festivaldao.pampletUpdate(dto);
	}

	/*
	 * @Override public boolean multiFileUpdate(PdsDto dto) { return
	 * festivaldao.multiFileUpdate(dto); }
	 */

	@Override
	public boolean festivalUpdateAf(FestivalDto dto) {
		return festivaldao.festivalUpdateAf(dto);
	}

	@Override
	public boolean detailDel(int seq) {
		return festivaldao.detailDel(seq);
	}

	@Override
	public boolean multiFileUpdate(PdsDto dto) {
		return festivaldao.multiFileUpdate(dto);
	}

	@Override
	public List<ReplyDto> festivalReplyList(pagingBean paging) {
		return festivaldao.festivalReplyList(paging);
	}

	@Override
	public boolean festivalReplyInsert(ReplyDto dto) {
		return festivaldao.festivalReplyInsert(dto);
	}

	@Override
	public boolean festivalAnswer(ReplyDto dto) {
		return festivaldao.festivalAnswer(dto);
	}

	@Override
	public boolean replydel(ReplyDto dto) {
		return festivaldao.replydel(dto);
	}

	@Override
	public boolean replyUpdate(ReplyDto dto) {
		return festivaldao.replyUpdate(dto);
	}

	@Override
	public int scoreCnt(int pseq) {
		return festivaldao.scoreCnt(pseq);
	}

	@Override
	public List<HotelDto> HotelJoinFestival(String place) {
		return festivaldao.HotelJoinFestival(place);
	}
	
	
	
	
	
	
	
}













