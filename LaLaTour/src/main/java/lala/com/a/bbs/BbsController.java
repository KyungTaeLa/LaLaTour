package lala.com.a.bbs;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lala.com.a.model.BbsDto;
import lala.com.a.model.MemberDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.util.pagingBean;

@Controller
public class BbsController {

	@Autowired
	BbsService bbsService;
	
	@RequestMapping(value="bbsList.do", method=RequestMethod.GET)
	public String bbsList(pagingBean paging, Model model,HttpServletRequest req) {
		
		if(req.getParameter("nowPage") == null) {
			paging.setNowPage(1);
			
		}else {
			
			paging.setNowPage(Integer.parseInt(req.getParameter("nowPage")) );
			
		}
		
		List<BbsDto> bbslist = bbsService.bbslist(paging);
		
		
		int authSize = 0;
		for (int i = 0; i < bbslist.size(); i++) {
			if(bbslist.get(i).getAuth() == 1) {
				authSize+= 1;
			}
		}
	
		
		model.addAttribute("authSize", authSize);
		model.addAttribute("bbslist", bbslist);
		model.addAttribute("paging", paging);
		return "bbslist.tiles";
	}
	
	@RequestMapping(value="bbsWrite.do", method=RequestMethod.GET)
	public String bbsWrite(HttpServletRequest req) {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		String msg = "접근권한이 없는 페이지입니다";
		if(login == null ) {
			return "redirect:/mainpage.do?msg="+msg;
		}

		System.out.println("글쓰기로 넘길게여");
		return "bbsWrite.tiles";
	}
	
	@RequestMapping(value="bbsWriteAf.do", method=RequestMethod.POST)
	public String bbsWriteAf(BbsDto dto,HttpServletRequest req) {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		String msg = "접근권한이 없는 페이지입니다";
		if(login == null ) {
			return "redirect:/mainpage.do?msg="+msg;
		}
		bbsService.bbsWrite(dto);
		
		return "redirect:/bbsList.do";
	} 
	
	@RequestMapping(value="bbsDetail.do", method=RequestMethod.GET)
	public String bbsDetail(int seq, Model model, HttpServletRequest req, pagingBean paging) {
		
		System.out.println("detail1: " + seq);
		BbsDto bbs = bbsService.bbsDetail(seq);
		
		if(req.getParameter("nowPage") == null) {
			System.out.println("새로운페이지");
			paging.setNowPage(1);
		}else {
			System.out.println("기존페이지");
			paging.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
		}
		paging.setPseq(seq);
		// 글의 seq는 댓글의 pseq입니다.
		List<ReplyDto> reply = bbsService.bbsReplyDetail(paging);
		  
		
		System.out.println("reply 보내기 직전: " + reply.toString());
		 
		model.addAttribute("paging", paging);
		 model.addAttribute("reply", reply);
		model.addAttribute("bbs", bbs);
		return "bbsDetail.tiles";
	}
	
	@RequestMapping(value="bbsDelete.do", method=RequestMethod.GET)
	public String bbsDelete(int seq,HttpServletRequest req) {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		String msg = "접근권한이 없는 페이지입니다";
		if(login == null ) {
			return "redirect:/mainpage.do?msg="+msg;
		}
		System.out.println("삭제 컨트롤러 / " + seq);
		bbsService.bbsDelete(seq);
		
		return "redirect:/bbsList.do";
	}
	@RequestMapping(value="bbsUpdate.do", method=RequestMethod.GET)
	public String bbsUpdate(BbsDto bbs,Model model,HttpServletRequest req) {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		String msg = "접근권한이 없는 페이지입니다";
		if(login == null ) {
			return "redirect:/mainpage.do?msg="+msg;
		}
		model.addAttribute("bbs", bbs);
		return "bbsUpdate.tiles";
	}
	
	@RequestMapping(value="bbsUpdateAf.do", method=RequestMethod.GET)
	public String bbsUpdateAf(BbsDto dto,Model model,HttpServletRequest req) {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		String msg = "접근권한이 없는 페이지입니다";
		if(login == null ) {
			return "redirect:/mainpage.do?msg="+msg;
		}
		bbsService.bbsUpdate(dto);
		
		model.addAttribute("seq", dto.getSeq());
		return "redirect:/bbsDetail.do";
	}
	
	@RequestMapping(value="bbsReply.do", method=RequestMethod.GET)
	public String bbsReply(ReplyDto reply,Model model,HttpServletRequest req) {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		String msg = "접근권한이 없는 페이지입니다";
		if(login == null ) {
			return "redirect:/mainpage.do?msg="+msg;
		}
	System.out.println("reply : "+reply.toString());
		bbsService.bbsReply(reply);
		
		model.addAttribute("seq", reply.getPseq());
	 return  "redirect:/bbsDetail.do";
	}
	
	
	
	@RequestMapping(value="updateReply.do", method=RequestMethod.POST)
	public String updateReply(ReplyDto reply,Model model,HttpServletRequest req) {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		String msg = "접근권한이 없는 페이지입니다";
		if(login == null ) {
			return "redirect:/mainpage.do?msg="+msg;
		}
			System.out.println("수정들어옴 : " + reply.toString());
		
			bbsService.updateReply(reply);
			
			model.addAttribute("seq", reply.getPseq());
			return  "redirect:/bbsDetail.do";
		}
	
	
	
	@RequestMapping(value="deleteReply.do", method=RequestMethod.GET)
	public String deleteReply(int seq,int pseq, Model model,HttpServletRequest req) {
	
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		String msg = "접근권한이 없는 페이지입니다";
		if(login == null ) {
			return "redirect:/mainpage.do?msg="+msg;
		}

		
		bbsService.deleteReply(seq);
		
		
		model.addAttribute("seq",pseq);
		return  "redirect:/bbsDetail.do";
	}
	
	
	@RequestMapping(value="bbsAnswer.do", method=RequestMethod.POST)
	public String bbsAnswer(ReplyDto reply, Model model,HttpServletRequest req) {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		String msg = "접근권한이 없는 페이지입니다";
		if(login == null ) {
			return "redirect:/mainpage.do?msg="+msg;
		}
		System.out.println("댓글달기 투스트링 : " + reply.toString());
			bbsService.bbsAnswer(reply);
			
			
			model.addAttribute("seq",reply.getPseq());
			return  "redirect:/bbsDetail.do";
		}
}
