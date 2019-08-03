package lala.com.a.admin;

import java.util.List;

import lala.com.a.hotel.pagingBean;
import lala.com.a.model.MemberDto;
import lala.com.a.model.ProductDto;
import lala.com.a.model.QuestionDto;
import lala.com.a.model.ReserveDto;

public interface LalaAdminDao {
	
	public List<QuestionDto> getQuestionList(); //비밀번호 질문리스트

	//관리자계정
	public List<MemberDto> getAdminList(PagingBean pagingBean); //관리자리스트
	public boolean adminJoinAf(MemberDto mdto); //관리자등록
	public int getAdminTotalCount(PagingBean pagingBean); //관리자 카운트 (페이징 때문에 필요)
	public MemberDto adminDetail(String id); //관리자 디테일
	public boolean adminUpdateAf(MemberDto mdto); //관리자 정보 수정
	
	//회원계정
	public int getMemberTotalCount(PagingBean pagingBean); //회원 카운트 (페이징 때문에 필요)
	public List<MemberDto> getMemberList(PagingBean pagingBean); //회원리스트
	public int getMemberTotalCountNo(PagingBean pagingBean); //탈퇴회원 카운트 (페이징 때문에 필요)
	public List<MemberDto> getMemberListNo(PagingBean pagingBean); //탈퇴회원리스트
	
	//호텔
	public int getCancelReserveCount(); //	밑에꺼 카운트
	public List<ReserveDto> getCancelReserveList(pagingBean paging); //	호텔 예약취소 승인 대기중인 리스트
	public boolean setCancelReserve(int seq); //	관리자 호텔 예약취소 승인
	
	//쇼핑몰 재고관리
	public List<ProductDto> getProductListAdmin(PagingBean pagingBean); //제품전체목록
	public int getProductTotalCountAdmin(PagingBean pagingBean); //제품전체목록 수 (페이징 때문에 필요)
}
