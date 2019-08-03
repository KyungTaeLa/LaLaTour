package lala.com.a.location.food;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lala.com.a.location.food.pagingBean;
import lala.com.a.model.LocationDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;

@Repository
public class FoodDaoImpl implements FoodDao {
	
	@Autowired // 의존성
	SqlSession sqlsession;
	
	String l = "Food.";
	
	@Override
	public List<LocationDto> getAttlist(pagingBean bean) {
		System.out.println("getAttlist dao 접근");
		
		System.out.println("dao쿼리들어가기직전 페이징: " + bean.toString());
		List<LocationDto> list = sqlsession.selectList(l + "getAttlist", bean);
		for(int i =0; i<list.size(); i++) {
			
			System.out.println("다오에서 확인: "+list.toString());
		}
		
		return list;
	}

	@Override
	public boolean attwrite(LocationDto dto) {
		System.out.println("attwrite dao 접근");
		System.out.println("dto = " + dto.toString());
		int n = sqlsession.insert(l + "attwrite", dto);
		System.out.println("seq=" + n);
		return n>0?true:false;
	}

	@Override
	public boolean uploadPds(PdsDto pds) {
		System.out.println("uploadPds dao 접근");
		int n = sqlsession.insert(l + "uploadPds", pds);
		return n>0?true:false;
	}

	@Override
	public int selectseq(LocationDto dto) {
		System.out.println("selectseq dao 접근");
		int n = sqlsession.selectOne(l + "selectseq", dto);
		return n;
	}

	@Override
	public LocationDto attdetail(LocationDto dto) {
		System.out.println("attdetail dao 접근");
		return sqlsession.selectOne(l  + "attdetail", dto);
	}

	@Override
	public boolean attupdate(LocationDto dto) throws Exception {
		System.out.println("attupdate dao 접근");
		int n = sqlsession.update(l  + "attupdate", dto);
		return n>0?true:false;
	}

	@Override
	public boolean attFileupdate(PdsDto pds) throws Exception {
		System.out.println("attFileupdate dao 접근");
		int n = sqlsession.update(l + "attFileupdate", pds);
		return n>0?true:false;
	}

	@Override
	public boolean upinsertPds(PdsDto pds) {
		System.out.println("upinsertPds dao 접근");
		int n = sqlsession.insert(l + "upinsertPds", pds);
		return n>0?true:false;
	}

	@Override
	public boolean UpdeletePds(int seq) {
		System.out.println("UpdeletePds dao 접근");
		int n = sqlsession.delete(l + "UpdeletePds", seq);
		System.out.println("daoimpl 들어와쒀");
		return  n>0?true:false;
	}

	@Override
	public List<PdsDto> selectPds(PdsDto pds) {
		System.out.println("selectPds dao 접근");
		return sqlsession.selectList(l + "selectPds", pds);
	}

	@Override
	public boolean Replyinsert(ReplyDto rep) {
		System.out.println("Replyinsert dao 접근");
		System.out.println("reppppp:" + rep.toString());
		int n = sqlsession.insert(l + "Replyinsert", rep);
		return n>0?true:false;
	}

	@Override
	public List<ReplyDto> Replylist(pagingBean bean) {
		System.out.println("Replyinsert dao 접근");
		List<ReplyDto> list = sqlsession.selectList(l + "Replylist", bean);
		for (int i = 0; i < list.size(); i++) {
			System.out.println("list : " + list.toString());
		}
		return list;
	}

	@Override
	public ReplyDto Replyselect(ReplyDto rep) {
		System.out.println("Replyselect dao 접근");
		return sqlsession.selectOne(l + "Replyselect", rep);
	}

	@Override
	public boolean PReplyupdate(ReplyDto rep) {
		System.out.println("PReplyupdate dao 접근");
		int n = sqlsession.update(l + "PReplyupdate", rep);
		return n>0?true:false;
	}

	@Override
	public boolean Redelete(ReplyDto rep) {
		System.out.println("Redelete dao 접근");
		int n = sqlsession.update(l + "Redelete", rep);
		return n>0?true:false;
	}

	@Override
	public int getAttracCount(pagingBean bean) {
		System.out.println("getAttracCount dao 접근");
		System.out.println("페이지 갯수세기");
		return sqlsession.selectOne(l + "getAttracCount", bean);
	}
	
	@Override
	public boolean SubreplyAf(ReplyDto rep) {
		System.out.println("SubreplyAf dao 접근");
		int n = sqlsession.insert(l + "SubreplyAf", rep);
		return n>0?true:false;
	}

	@Override
	public List<ReplyDto> Subreply(int pseq) {
		System.out.println("Subreply dao 접근");
		return sqlsession.selectList(l + "Subreply", pseq);
	}

	@Override
	public boolean Subreplyup(ReplyDto rep) {
		System.out.println("Subreplyup dao 접근");
		int n = sqlsession.update(l + "Subreplyup", rep);
		return n>0?true:false;
	}

	@Override
	public boolean Subredelete(ReplyDto rep) {
		System.out.println("Subredelete dao 접근");
		int n = sqlsession.update(l + "Subredelete", rep);
		return  n>0?true:false ;
	}

	@Override
	public int getAttracReplyCount(int pseq) {
		System.out.println("getAttracReplyCount dao 접근");
		System.out.println("댓글 갯수세기");
		return sqlsession.selectOne(l + "getAttracReplyCount", pseq);
	}

	@Override
	public boolean listdelete(int seq) {
		System.out.println("listdelete dao 접근");
		int n = sqlsession.update(l + "listdelete", seq);
		return n>0?true:false;
	}

	@Override
	public boolean listdelete_replydelete(int pseq) {
		System.out.println("listdelete_replydelete dao 접근");
		int n = sqlsession.update(l + "listdelete_replydelete", pseq);
		return n>0?true:false;
	}

	@Override
	public boolean listdelete_UpdeletePds(int pseq) {
		System.out.println("listdelete_UpdeletePds dao 접근");
		int n = sqlsession.update(l + "listdelete_UpdeletePds", pseq);
		return n>0?true:false;
	}

	@Override
	public List<PdsDto> attdetailPds(PdsDto pds) throws Exception {
		System.out.println("attdetailPds dao 접근");
		return sqlsession.selectList(l + "attdetailPds", pds);
	}

}
