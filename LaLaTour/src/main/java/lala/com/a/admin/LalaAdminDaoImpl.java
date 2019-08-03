package lala.com.a.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lala.com.a.hotel.pagingBean;
import lala.com.a.model.MemberDto;
import lala.com.a.model.ProductDto;
import lala.com.a.model.QuestionDto;
import lala.com.a.model.ReserveDto;

@Repository
public class LalaAdminDaoImpl implements LalaAdminDao {

	String ns = "Admin.";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MemberDto> getAdminList(PagingBean pagingBean) {
		// TODO 관리자리스트
		List<MemberDto> adminList = sqlSession.selectList(ns+"getAdminList", pagingBean);
		return adminList;
	}

	@Override
	public boolean adminJoinAf(MemberDto mdto) {
		// TODO 관리자등록
		int n = sqlSession.insert(ns+"adminJoinAf", mdto);
		return n>0? true:false;
	}

	@Override
	public List<QuestionDto> getQuestionList() {
		// TODO 비밀번호 질문리스트
		return sqlSession.selectList(ns+"getQuestionList");
	}

	@Override
	public int getAdminTotalCount(PagingBean pagingBean) {
		// TODO 관리자 카운트 (페이징 때문에 필요)
		return sqlSession.selectOne(ns+"getAdminTotalCount", pagingBean);
	}

	@Override
	public MemberDto adminDetail(String id) {
		// TODO 관리자 디테일
		MemberDto mdto = sqlSession.selectOne(ns+"adminDetail", id);
		return mdto;
	}
	
	@Override
	public List<ReserveDto> getCancelReserveList(pagingBean paging) {
		System.out.println("다오나오는부분  : " +  paging.toString());
		List<ReserveDto> reserve = sqlSession.selectList(ns+"getCancelReserveList",paging);
		System.out.println("다오나오는부분  : " +  reserve.toString());
		return reserve;
	}
	@Override
	public boolean setCancelReserve(int seq) {
		int n = sqlSession.update(ns+"setCancelReserve",seq);
		return n>0?true:false;
	}
	@Override
	public int getCancelReserveCount() {
		return sqlSession.selectOne(ns+"getCancelReserveCount");
	}

	@Override
	public boolean adminUpdateAf(MemberDto mdto) {
		// TODO 관리자 정보 수정
		int n = sqlSession.update(ns+"adminUpdateAf", mdto);
		return n>0? true:false;
	}

	@Override
	public int getMemberTotalCount(PagingBean pagingBean) {
		// TODO 회원 카운트 (페이징 때문에 필요)
		return sqlSession.selectOne(ns+"getMemberTotalCount", pagingBean);
	}

	@Override
	public List<MemberDto> getMemberList(PagingBean pagingBean) {
		// TODO 회원리스트
		List<MemberDto> memberList = sqlSession.selectList(ns+"getMemberList", pagingBean);
		return memberList;
	}

	@Override
	public int getMemberTotalCountNo(PagingBean pagingBean) {
		// TODO 탈퇴회원 카운트 (페이징 때문에 필요)
		return sqlSession.selectOne(ns+"getMemberTotalCountNo", pagingBean);
	}

	@Override
	public List<MemberDto> getMemberListNo(PagingBean pagingBean) {
		// TODO 탈퇴회원 리스트
		List<MemberDto> memNoList = sqlSession.selectList(ns+"getMemberListNo", pagingBean);
		return memNoList;
	}

	@Override
	public List<ProductDto> getProductListAdmin(PagingBean pagingBean) {
		// TODO 제품목록
		List<ProductDto> productList = sqlSession.selectList(ns+"getProductListAdmin", pagingBean);
		return productList;
	}

	@Override
	public int getProductTotalCountAdmin(PagingBean pagingBean) {
		// TODO 제품전체목록 수 (페이징 때문에 필요)
		return sqlSession.selectOne(ns+"getProductTotalCountAdmin", pagingBean);
	}
}











































