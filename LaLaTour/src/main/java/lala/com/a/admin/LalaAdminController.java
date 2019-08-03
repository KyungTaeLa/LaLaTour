package lala.com.a.admin;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lala.com.a.hotel.pagingBean;
import lala.com.a.hotel.pagingUtil;
import lala.com.a.model.MemberDto;
import lala.com.a.model.ProductDto;
import lala.com.a.model.QuestionDto;
import lala.com.a.model.ReserveDto;
import lala.com.a.product.LalaProductService;

@Controller
public class LalaAdminController {

	Logger logger = LoggerFactory.getLogger(LalaAdminController.class);
	
	@Autowired
	LalaAdminService lalaAdminService;
	
	@Autowired
	LalaProductService lalaproductService;
	
	@RequestMapping(value="cancelReserveList.do" , method = {RequestMethod.GET, RequestMethod.POST})
	public String cancelReserveList(Model model,pagingBean paging) {
		System.out.println("paging re 1: " + paging.toString());
		if(paging.getNowPage() == 0){
			paging.setNowPage(1);   
			System.out.println("new PagingBean() 1");
		}

		int totalCount = lalaAdminService.getCancelReserveCount();
		
		paging.setTotalCount(totalCount);
		
		paging = pagingUtil.setPagingInfo(paging,"other");
		System.out.println("paging re 2 : " + paging.toString());
		
		List<ReserveDto> reserve = lalaAdminService.getCancelReserveList(paging);
		
		model.addAttribute("reserve",reserve);
		
		return "cancelReserve.tiles";
	}
	@RequestMapping(value="respCancelReserve.do" , method = {RequestMethod.GET, RequestMethod.POST})
	public String cancelReserve(int seq) {
		System.out.println("관리자 예약취소 승인부분 : " + seq);
		
		boolean isS = lalaAdminService.setCancelReserve(seq);
		
		if(isS) {
			System.out.println("예약취소승인 됌");
		}else {
			System.out.println("예약취소승인 실패");
		}
		return "redirect:/cancelReserveList.do";
	}
	
	//관리자목록
	@RequestMapping(value="admin.do", method=RequestMethod.GET)
	public String adminMain(PagingBean pagingBean, Model model, HttpServletRequest req) {
		logger.info("LalaAdminController admin " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("") && login.getAuth()==1) {	
			System.out.println("dto: " + pagingBean.toString());
			//현재페이지가 노세팅이면 1로 세팅
			if(pagingBean.getNowPage()==0) {
				pagingBean.setNowPage(1);
			}
			
			//totalCount 세팅 (총갯수)
			pagingBean.setTotalCount( lalaAdminService.getAdminTotalCount(pagingBean) );
			pagingBean.setCountPerPage(2);
			pagingBean = PagingUtil.setPagingInfo(pagingBean);
			
			System.out.println("dto2: " + pagingBean.toString());
			
			List<MemberDto> adminList = lalaAdminService.getAdminList(pagingBean);
			model.addAttribute("adminList", adminList);
			model.addAttribute("paging", pagingBean);
			
			return "admin.tiles";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//관리자계정 등록화면 이동
	@RequestMapping(value="adminJoin.do", method=RequestMethod.GET)
	public String adminJoin(Model model, HttpServletRequest req) {
		logger.info("LalaAdminController adminJoin " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("") && login.getAuth()==1) {	
			List<QuestionDto> questionList = lalaAdminService.getQuestionList();
			model.addAttribute("questionList", questionList);
			
			return "adminJoin.tiles";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//관리자계정 생성
	@RequestMapping(value="adminJoinAf.do", method=RequestMethod.POST)
	public String adminJoinAf(MemberDto mdto, HttpServletRequest req) {
		logger.info("LalaAdminController adminJoinAf " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("") && login.getAuth()==1) {	
		
			//System.out.println(mdto.toString());
			mdto.setAuth(1);
			
			boolean isS = lalaAdminService.adminJoinAf(mdto);
			System.out.println("관리자계정 생성 시도: " + isS);
			
			if(isS) return "redirect:/admin.do";
			else return "redirect:/adminJoin.do";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//관리자 디테일
	@RequestMapping(value="adminDetail.do", method=RequestMethod.GET)
	public String adminDetail(String id, Model model, HttpServletRequest req) {
		logger.info("LalaAdminController adminDetail " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("") && login.getAuth()==1) {
			MemberDto dto = lalaAdminService.adminDetail(id);
			model.addAttribute("admin", dto);
			
			return "adminDetail.tiles";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//관리자 수정페이지 이동
	@RequestMapping(value="adminUpdate.do", method=RequestMethod.POST)
	public String adminUpdate(String id, Model model, HttpServletRequest req) {
		logger.info("LalaAdminController adminUpdate " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("") && login.getAuth()==1) {
			//질문목록
			List<QuestionDto> questionList = lalaAdminService.getQuestionList();
			model.addAttribute("questionList", questionList);
			
			//디테일정보
			MemberDto dto = lalaAdminService.adminDetail(id);
			model.addAttribute("admin", dto);
			
			return "adminUpdate.tiles";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//관리자 수정 작업
	@RequestMapping(value="adminUpdateAf.do", method=RequestMethod.POST)
	public String adminUpdateAf(MemberDto mdto, HttpServletRequest req) {
		logger.info("LalaAdminController adminUpdateAf " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("") && login.getAuth()==1) {
			//System.out.println(mdto.toString());
			boolean isS = lalaAdminService.adminUpdateAf(mdto);
			System.out.println("관리자 정보 수정: " + isS);
			
			if(isS) return "redirect:/admin.do";
			else return "redirect:/adminUpdate.do?id="+mdto.getId();
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	
	//////////////////////////////////////////////////////////////
	
	//회원계정
	
	//////////////////////////////////////////////////////////////
	
	//일반회원 목록
	@RequestMapping(value="member.do", method=RequestMethod.GET)
	public String member(PagingBean pagingBean, Model model, HttpServletRequest req) {
		logger.info("LalaAdminController member " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("") && login.getAuth()==1) {
			System.out.println("dto: " + pagingBean.toString());
			//현재페이지가 노세팅이면 1로 세팅
			if(pagingBean.getNowPage()==0) {
				pagingBean.setNowPage(1);
			}
			
			//totalCount 세팅 (총갯수)
			pagingBean.setTotalCount( lalaAdminService.getMemberTotalCount(pagingBean) );
			pagingBean.setCountPerPage(4);
			pagingBean = PagingUtil.setPagingInfo(pagingBean);
			
			System.out.println("dto2: " + pagingBean.toString());
			
			List<MemberDto> memberList = lalaAdminService.getMemberList(pagingBean);
			model.addAttribute("memberList", memberList);
			model.addAttribute("paging", pagingBean);
			
			return "member.tiles";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//탈퇴회원 목록
	@RequestMapping(value="memberNo.do", method=RequestMethod.GET)
	public String memberNo(PagingBean pagingBean, Model model, HttpServletRequest req) {
		logger.info("LalaAdminController memberNo " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("") && login.getAuth()==1) {
			System.out.println("dto: " + pagingBean.toString());
			//현재페이지가 노세팅이면 1로 세팅
			if(pagingBean.getNowPage()==0) {
				pagingBean.setNowPage(1);
			}
			
			//totalCount 세팅 (총갯수)
			pagingBean.setTotalCount( lalaAdminService.getMemberTotalCountNo(pagingBean) );
			pagingBean.setCountPerPage(4);
			pagingBean = PagingUtil.setPagingInfo(pagingBean);
			
			System.out.println("dto2: " + pagingBean.toString());
			
			List<MemberDto> memberList = lalaAdminService.getMemberListNo(pagingBean);
			model.addAttribute("memberList", memberList);
			model.addAttribute("paging", pagingBean);
			
			return "memberNo.tiles";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//////////////////////////////////////////////////////////////
		
	//쇼핑몰 재고관리
	
	//////////////////////////////////////////////////////////////
	
	//물품 리스트
	@RequestMapping(value="adminProductList.do", method=RequestMethod.GET)
	public String adminProductList(PagingBean pagingBean, Model model, HttpServletRequest req) {
		logger.info("LalaAdminController adminProductList " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("") && login.getAuth()==1) {
			System.out.println("dto: " + pagingBean.toString());
			//현재페이지가 노세팅이면 1로 세팅
			if(pagingBean.getNowPage()==0) {
				pagingBean.setNowPage(1);
			}
			
			//totalCount 세팅 (총갯수)
			pagingBean.setTotalCount( lalaAdminService.getProductTotalCountAdmin(pagingBean) );
			pagingBean.setCountPerPage(3);
			pagingBean = PagingUtil.setPagingInfo(pagingBean);
			
			System.out.println("dto2: " + pagingBean.toString());
			
			List<ProductDto> productList = lalaAdminService.getProductListAdmin(pagingBean);
			model.addAttribute("productList", productList);
			model.addAttribute("paging", pagingBean);
			
			return "adminProductList.tiles";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
}










































