package lala.com.a.location.food;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lala.com.a.location.food.pagingBean;
import lala.com.a.model.LocationDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;

@Service
public class FoodServiceImpl implements FoodService {
	
	@Autowired
	FoodDao fooddao;
	
	@Override
	public List<LocationDto> getAttlist(pagingBean bean) {
		System.out.println("getAttlist service 접근");
		return fooddao.getAttlist(bean);
	}

	@Override
	public boolean attwrite(LocationDto dto) {
		System.out.println("attwrite service 접근");
		return fooddao.attwrite(dto);
	}

	@Override
	public boolean uploadPds(PdsDto pds) {
		System.out.println("uploadPds service 접근");
		return fooddao.uploadPds(pds);
	}

	@Override
	public int selectseq(LocationDto dto) {
		System.out.println("selectseq service 접근");
		return fooddao.selectseq(dto);
	}

	@Override
	public LocationDto attdetail(LocationDto dto)  throws Exception {
		System.out.println("attdetail service 접근");
		return fooddao.attdetail(dto);
	}

	@Override
	public boolean attupdate(LocationDto dto) throws Exception {
		System.out.println("attupdate service 접근");
		return fooddao.attupdate(dto);
	}

	@Override
	public boolean attFileupdate(PdsDto pds) throws Exception {
		System.out.println("attFileupdate service 접근");
		return  fooddao.attFileupdate(pds);
	}

	@Override
	public boolean upinsertPds(PdsDto pds) {
		System.out.println("upinsertPds service 접근");
		return fooddao.upinsertPds(pds);
	}

	@Override
	public boolean UpdeletePds(int seq) {
		System.out.println("UpdeletePds service 접근");
		return fooddao.UpdeletePds(seq);
	}

	@Override
	public List<PdsDto> selectPds(PdsDto pds) {
		System.out.println("selectPds service 접근");
		return fooddao.selectPds(pds);
	}

	@Override
	public boolean Replyinsert(ReplyDto rep) {
		System.out.println("Replyinsert service 접근");
		return fooddao.Replyinsert(rep);
	}

	@Override
	public List<ReplyDto> Replylist(pagingBean bean) {
		System.out.println("Replylist service 접근");
		return fooddao.Replylist(bean);
	}

	@Override
	public ReplyDto Replyselect(ReplyDto rep) {
		System.out.println("Replyselect service 접근");
		return fooddao.Replyselect(rep);
	}

	@Override
	public boolean PReplyupdate(ReplyDto rep) {
		System.out.println("PReplyupdate service 접근");
		return fooddao.PReplyupdate(rep);
	}

	@Override
	public boolean Redelete(ReplyDto rep) {
		System.out.println("Redelete service 접근");
		return fooddao.Redelete(rep);
	}

	@Override
	public int getAttracCount(pagingBean bean) {
		System.out.println("getAttracCount service 접근");
		return fooddao.getAttracCount(bean);
	}
	
	@Override
	public boolean SubreplyAf(ReplyDto rep) {
		System.out.println("SubreplyAf service 접근");
		return fooddao.SubreplyAf(rep);
	}

	@Override
	public List<ReplyDto> Subreply(int pseq) {
		System.out.println("Subreply service 접근");
		return fooddao.Subreply(pseq);
	}

	@Override
	public boolean Subreplyup(ReplyDto rep) {
		System.out.println("Subreplyup dao 접근");
		return fooddao.Subreplyup(rep);
	}

	@Override
	public boolean Subredelete(ReplyDto rep) {
		System.out.println("Subredelete dao 접근");
		return fooddao.Subredelete(rep);
	}

	@Override
	public int getAttracReplyCount(int pseq) {
		System.out.println("getAttracReplyCount service 접근");
		return fooddao.getAttracReplyCount(pseq);
	}

	@Override
	public boolean listdelete(int seq) {
		System.out.println("listdelete service 접근");
		return fooddao.listdelete(seq);
	}

	@Override
	public boolean listdelete_replydelete(int pseq) {
		System.out.println("listdelete_replydelete service 접근");
		return fooddao.listdelete_replydelete(pseq);
	}

	@Override
	public boolean listdelete_UpdeletePds(int pseq) {
		System.out.println("listdelete_UpdeletePds service 접근");
		return fooddao.listdelete_UpdeletePds(pseq);
	}

	@Override
	public List<PdsDto> attdetailPds(PdsDto pds) throws Exception {
		System.out.println("attdetailPds service 접근");
		return fooddao.attdetailPds(pds);
	}

}
