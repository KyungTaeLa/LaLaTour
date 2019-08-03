package lala.com.a.location.attrac;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lala.com.a.model.LocationDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;



@Service
public class AttracServiceImpl implements AttracService {
	
	@Autowired
	AttracDao attracdao;

	@Override
	public List<LocationDto> getAttlist(pagingBean bean) {
		System.out.println("getAttlist service 접근");
		return attracdao.getAttlist(bean);
	}

	@Override
	public boolean attwrite(LocationDto dto) {
		System.out.println("attwrite service 접근");
		return attracdao.attwrite(dto);
	}

	@Override
	public boolean uploadPds(PdsDto pds) {
		System.out.println("uploadPds service 접근");
		return attracdao.uploadPds(pds);
	}

	@Override
	public int selectseq(LocationDto dto) {
		System.out.println("selectseq service 접근");
		return attracdao.selectseq(dto);
	}

	@Override
	public LocationDto attdetail(LocationDto dto)  throws Exception {
		System.out.println("attdetail service 접근");
		return attracdao.attdetail(dto);
	}

	@Override
	public boolean attupdate(LocationDto dto) throws Exception {
		System.out.println("attupdate service 접근");
		return attracdao.attupdate(dto);
	}

	@Override
	public boolean attFileupdate(PdsDto pds) throws Exception {
		System.out.println("attFileupdate service 접근");
		return  attracdao.attFileupdate(pds);
	}

	@Override
	public boolean upinsertPds(PdsDto pds) {
		System.out.println("upinsertPds service 접근");
		return attracdao.upinsertPds(pds);
	}

	@Override
	public boolean UpdeletePds(int seq) {
		System.out.println("UpdeletePds service 접근");
		return attracdao.UpdeletePds(seq);
	}

	@Override
	public List<PdsDto> selectPds(PdsDto pds) {
		System.out.println("selectPds service 접근");
		return attracdao.selectPds(pds);
	}

	@Override
	public boolean Replyinsert(ReplyDto rep) {
		System.out.println("Replyinsert service 접근");
		return attracdao.Replyinsert(rep);
	}

	@Override
	public List<ReplyDto> Replylist(pagingBean bean) {
		System.out.println("Replylist service 접근");
		return attracdao.Replylist(bean);
	}

	@Override
	public ReplyDto Replyselect(ReplyDto rep) {
		System.out.println("Replyselect service 접근");
		return attracdao.Replyselect(rep);
	}

	@Override
	public boolean PReplyupdate(ReplyDto rep) {
		System.out.println("PReplyupdate service 접근");
		return attracdao.PReplyupdate(rep);
	}

	@Override
	public boolean Redelete(ReplyDto rep) {
		System.out.println("Redelete service 접근");
		return attracdao.Redelete(rep);
	}

	@Override
	public int getAttracCount(pagingBean bean) {
		System.out.println("getAttracCount service 접근");
		return attracdao.getAttracCount(bean);
	}
	
	@Override
	public boolean SubreplyAf(ReplyDto rep) {
		System.out.println("SubreplyAf service 접근");
		return attracdao.SubreplyAf(rep);
	}

	@Override
	public List<ReplyDto> Subreply(int pseq) {
		System.out.println("Subreply service 접근");
		return attracdao.Subreply(pseq);
	}

	@Override
	public boolean Subreplyup(ReplyDto rep) {
		System.out.println("Subreplyup dao 접근");
		return attracdao.Subreplyup(rep);
	}

	@Override
	public boolean Subredelete(ReplyDto rep) {
		System.out.println("Subredelete dao 접근");
		return attracdao.Subredelete(rep);
	}

	@Override
	public int getAttracReplyCount(int pseq) {
		System.out.println("getAttracReplyCount service 접근");
		return attracdao.getAttracReplyCount(pseq);
	}

	@Override
	public boolean listdelete(int seq) {
		System.out.println("listdelete service 접근");
		return attracdao.listdelete(seq);
	}

	@Override
	public boolean listdelete_replydelete(int pseq) {
		System.out.println("listdelete_replydelete service 접근");
		return attracdao.listdelete_replydelete(pseq);
	}

	@Override
	public boolean listdelete_UpdeletePds(int pseq) {
		System.out.println("listdelete_UpdeletePds service 접근");
		return attracdao.listdelete_UpdeletePds(pseq);
	}

	@Override
	public List<PdsDto> attdetailPds(PdsDto pds) throws Exception {
		System.out.println("attdetailPds service 접근");
		return attracdao.attdetailPds(pds);
	}
}
