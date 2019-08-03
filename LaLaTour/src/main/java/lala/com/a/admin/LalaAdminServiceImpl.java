package lala.com.a.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lala.com.a.hotel.pagingBean;
import lala.com.a.model.MemberDto;
import lala.com.a.model.ProductDto;
import lala.com.a.model.QuestionDto;
import lala.com.a.model.ReserveDto;

@Service
public class LalaAdminServiceImpl implements LalaAdminService {

	@Autowired
	LalaAdminDao lalaAdminDao;

	@Override
	public List<MemberDto> getAdminList(PagingBean pagingBean) {
		// TODO 관리자리스트
		return lalaAdminDao.getAdminList(pagingBean);
	}

	@Override
	public boolean adminJoinAf(MemberDto mdto) {
		// TODO 관리자등록
		return lalaAdminDao.adminJoinAf(mdto);
	}

	@Override
	public List<QuestionDto> getQuestionList() {
		// TODO 비밀번호 질문리스트
		return lalaAdminDao.getQuestionList();
	}

	@Override
	public int getAdminTotalCount(PagingBean pagingBean) {
		// TODO 관리자 카운트 (페이징 때문에 필요)
		return lalaAdminDao.getAdminTotalCount(pagingBean);
	}

	@Override
	public MemberDto adminDetail(String id) {
		// TODO 관리자 디테일
		return lalaAdminDao.adminDetail(id);
	}
	
	@Override
	public List<ReserveDto> getCancelReserveList(pagingBean paging) {
		return lalaAdminDao.getCancelReserveList(paging);
	}

	@Override
	public boolean setCancelReserve(int seq) {
		return lalaAdminDao.setCancelReserve(seq);
	}

	@Override
	public int getCancelReserveCount() {
		return lalaAdminDao.getCancelReserveCount();
	}

	@Override
	public boolean adminUpdateAf(MemberDto mdto) {
		// TODO 관리자 정보 수정
		return lalaAdminDao.adminUpdateAf(mdto);
	}

	@Override
	public int getMemberTotalCount(PagingBean pagingBean) {
		// TODO 회원 카운트 (페이징 때문에 필요)
		return lalaAdminDao.getMemberTotalCount(pagingBean);
	}

	@Override
	public List<MemberDto> getMemberList(PagingBean pagingBean) {
		// TODO 회원리스트
		return lalaAdminDao.getMemberList(pagingBean);
	}

	@Override
	public int getMemberTotalCountNo(PagingBean pagingBean) {
		// TODO 탈퇴회원 카운트 (페이징 때문에 필요)
		return lalaAdminDao.getMemberTotalCountNo(pagingBean);
	}

	@Override
	public List<MemberDto> getMemberListNo(PagingBean pagingBean) {
		// TODO 탈퇴회원 리스트
		return lalaAdminDao.getMemberListNo(pagingBean);
	}

	@Override
	public List<ProductDto> getProductListAdmin(PagingBean pagingBean) {
		// TODO 제품목록
		return lalaAdminDao.getProductListAdmin(pagingBean);
	}

	@Override
	public int getProductTotalCountAdmin(PagingBean pagingBean) {
		// TODO 제품전체목록 수 (페이징 때문에 필요)
		return lalaAdminDao.getProductTotalCountAdmin(pagingBean);
	}
}







































