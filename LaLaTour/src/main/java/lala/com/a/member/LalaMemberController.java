package lala.com.a.member;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import lala.com.a.hotel.HotelService;
import lala.com.a.hotel.pagingBean;
import lala.com.a.hotel.pagingUtil;
import lala.com.a.model.BbsDto;
import lala.com.a.model.CalendarDto;
import lala.com.a.model.FestivalDto;
import lala.com.a.model.GoodsDto;
import lala.com.a.model.HotelDto;
import lala.com.a.model.LocationDto;
import lala.com.a.model.MeetingDto;
import lala.com.a.model.MemberDto;
import lala.com.a.model.QuestionDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.model.ReserveDto;
import lala.com.a.model.ReviewDto;
import lala.com.a.util.NewPwd;
import lala.com.a.util.SendEmail;
import lala.com.a.util.MemberUtil;

@Controller
public class LalaMemberController {

	private static final Logger logger = LoggerFactory.getLogger(LalaMemberController.class);
	
	@Autowired
	LalaMemberService lalaMemberService;
	@Autowired
	HotelService hotelService;
	
	@RequestMapping(value="mainpage.do", method={ RequestMethod.GET, RequestMethod.POST })
	public String mainpage(String msg,Model model) {
		logger.info("LalaMemberController mainpage " + new Date());
		//Main에서 festival 썸네일 사진을 띄움
		List<FestivalDto> list = lalaMemberService.mainThumbNail();
		
		//main에 지역명소 썸네일 가져감
		List<LocationDto> loclist = lalaMemberService.locationThumb();
		
		model.addAttribute("msg",msg);
		model.addAttribute("list", list);
		model.addAttribute("loclist", loclist);
		
		System.out.println("으아아아아아아");
		return "mainpage.tiles";
	}
	
	@RequestMapping(value="logout.do", method={ RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpServletRequest req) {
		logger.info("LalaMemberController logout " + new Date());
		
		//req.getSession().invalidate();
		HttpSession session = req.getSession(false);
		session.invalidate();
		
		return "redirect:/mainpage.do";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	   public String login(Model model, String alertMsg) {
	      logger.info("LalaMemberController login " + new Date());
	      
	      System.out.println("로그인페이지들어옴");
	      if(alertMsg != null && !alertMsg.equals("")) {
	      model.addAttribute("alertMsg", alertMsg);
	      System.out.println("-----1");
	      }else {
	         model.addAttribute("alertMsg", "");
	         System.out.println("-----2");
	      }
	      return "login.tiles";
	   }
	
	@RequestMapping(value="loginaf.do", method=RequestMethod.POST)
	   public String loginaf(MemberDto dto, HttpServletRequest req,Model model) {
	      logger.info("LalaMemberController loginaf " + new Date());
	      
	      MemberDto login = lalaMemberService.loginaf(dto);
	      System.out.println("login 쿼리실행후 컨트롤러");
	      
	      if(login!=null && !login.getId().equals("")) {
	         //if(login!=null) {
	         //session에 넣어주기
	         req.getSession().setAttribute("login", login);
	         //게시판으로 이동하기 위해 컨트롤러로 이동
	         return "redirect:/mainpage.do"; //sendRedirect
	         //return "forward:/bbslist.do"; //forward 데이터를 가져갈때
	      }
	      else {
	         //다시 login으로 돌리기
	         model.addAttribute("alertMsg", "아이디나 패스워드를 확인하여주십시오.");
	         return "redirect:/login.do";
	         /* return "error.tiles"; */
	      }
	   }
	
	@RequestMapping(value="join.do", method=RequestMethod.GET)
	public String join(Model model) {
		logger.info("LalaMemberController join " + new Date());
		
		List<QuestionDto> qlist = lalaMemberService.getQuestionList();
		model.addAttribute("qlist", qlist);
		
		return "join.tiles";
	}
	
	@RequestMapping(value="joinaf.do", method=RequestMethod.POST)
	public String joinaf(MemberDto dto) {
		logger.info("LalaMemberController joinaf " + new Date());
		System.out.println("dto :  " + dto.toString());
		//System.out.println(dto.toString());
		boolean isS = lalaMemberService.addMember(dto);
		if(isS) {
			return "redirect:/mainpage.do";
		}
		else {
			return "redirect:/join.do";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="idsamecheck.do", method=RequestMethod.POST)
	public String idsamecheck(String id) {
		logger.info("LalaMemberController idsamecheck " + new Date());
		
		int n = lalaMemberService.idSameCheck(id);
		String msg = n==1? "no":"yes";
		
		return msg;
	}
	
	@RequestMapping(value="findId.do", method=RequestMethod.GET)
	public String findId() {
		
		System.out.println("findId");
		
		return "findId.tiles";
	}
	
	
	@RequestMapping(value="findIdAf.do", method=RequestMethod.GET)
	public String findIdAf(MemberDto dto,Model model) {
		System.out.println("findIdAf");
		String id = lalaMemberService.findId(dto);
		
		model.addAttribute("id", id);
		
		System.out.println("id:"+id);
		return "findIdAf.tiles";
	}
	
	@RequestMapping(value="findPwd.do", method=RequestMethod.GET)
	public String findPwd(Model model) {
		
		List<QuestionDto> qlist = lalaMemberService.getQuestionList();
		model.addAttribute("qlist", qlist);
		
		return "findPwd.tiles";
	}
	
	@RequestMapping(value="findPwdAf1.do", method={RequestMethod.GET,RequestMethod.POST})
	public String findPwdAf1(MemberDto dto, Model model) {
		
		String pwd = lalaMemberService.findPwd1(dto);
		
		
		model.addAttribute("pwd", pwd);
		return "findPwdAf.tiles";
	}
	
	@RequestMapping(value="findPwdAf2.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String findPwdAf2(MemberDto dto, Model model) {
	
	System.out.println("findPwdAf2");
	
	String pwd = NewPwd.excuteGenerate();
	dto.setPwd(pwd);
	
	System.out.println(dto.toString());
	boolean suc = lalaMemberService.findPwd2(dto);
	if(suc) {
	System.out.println("성공");	
	SendEmail.SendId(dto.getEmail(), dto.getPwd());
	pwd="임시 비밀번호를 이메일로 전송했습니다.";
		
	}else {
		System.out.println("실패");
		pwd="비밀번호를 찾을 수 없습니다.";
	}
		
	model.addAttribute("pwd", pwd);
	return "findPwdAf.tiles";
	}
	
	@RequestMapping(value="myPage.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String myPage() {
		
		System.out.println("마이페이지로 이동할게여");
		
		return "myPage.tiles";
	}
	
	
	  @RequestMapping(value="myCalendar.do", method=RequestMethod.GET)
	  public String myCalendar(String id,Model model,String year, String month) {
	  
	  System.out.println("내일정으로 이동할게여");
	  
	  //위에껀 미팅캘린더
	  List<CalendarDto> calendar = lalaMemberService.meetCalendar(id);
	  List<CalendarDto> hCalendar = lalaMemberService.hotelCalendar(id);
	  //System.out.println("리스트 뽑아오는거까지 성공?");
	  for(int i =0; i<hCalendar.size(); i++) {
		  CalendarDto hotelCalendar = hCalendar.get(i);
		//  System.out.println(hotelCalendar.toString());
		  calendar.add(hotelCalendar);
	  }
	  System.out.println("보내기직전");
	  model.addAttribute("year", year);
	  model.addAttribute("month", month);
	  model.addAttribute("calendar", calendar);
	  return "myCalendar.tiles"; 
	  }
	  

	@RequestMapping(value="myReserveList.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String myReserveList(Model model, pagingBean paging) {
		System.out.println("paging re 1: " + paging.toString());
		if(paging.getNowPage() == 0){
			paging.setNowPage(1);   
			System.out.println("new PagingBean() 1");
		}

		int totalCount = lalaMemberService.getReserveCont(paging.getId());
		
		paging.setTotalCount(totalCount);
		
		paging = pagingUtil.setPagingInfo(paging,"other");
		System.out.println("paging re 2 : " + paging.toString());
		
		List<ReserveDto> reserve = lalaMemberService.myReserveList(paging);
		
		for(int i = 0 ; i < reserve.size(); i++) {
			System.out.println("reTumb : " + reserve.get(i).getThumbnail());
		}
		model.addAttribute("paging",paging);
		model.addAttribute("reserve",reserve);
		return "myReserveList.tiles";
	}
	@RequestMapping(value="myCancelReserve.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String myCancelReserve(int seq, String id) {
		
		boolean isS = lalaMemberService.myCancelReserve(seq);
		
		if(isS) {
			System.out.println("예약취소 신청 성공");
		}else {
			System.out.println("예약취소 신청 실패");
		}
		
		return "redirect:/myReserveList.do?id=" + id;
	}
	@RequestMapping(value="myInfoChange.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String myInfoChange(String id, Model model) {
		
		MemberDto member = lalaMemberService.getMyInfo(id);
		List<QuestionDto> question = lalaMemberService.getQuestionList();
		
		model.addAttribute("question",question);
		model.addAttribute("member",member);
		
		System.out.println("member : " + member.getAddress());
		return "myInfoChange.tiles";
	}
	@RequestMapping(value="myInfoChangeAf.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String myInfoChangeAf(MemberDto member) {
		System.out.println("member : " + member.toString());
		
		boolean isS = lalaMemberService.setMyInfo(member);
		
		if(isS) {
			System.out.println("회원정보 수정 성공");
		}else {
			System.out.println("회원정보 수정 실패");
		}
		return "redirect:/myPage.do";
	}
	@RequestMapping(value="myMemberDrop.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String myMemberDrop(String id, HttpServletRequest req,Model model) {
		System.out.println("drop bf : " + id);
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null || !login.getId().equals(id)) {
			return "redirect:/mainpage.do";
		}
		
		MemberDto member = lalaMemberService.getMyInfo(id);
		
		model.addAttribute("member",member);
		
		return "myMemberDrop.tiles";
	}
	
	@RequestMapping(value="myMemberDropAf.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String myMemberDropAf(String id,HttpServletRequest req) {
		System.out.println("하하하하하하ㅏ하하ㅏ ㅈ같다 : " + id);
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if ( login != null ) {
			if( !login.getId().equals(id) ) {
				if(login.getAuth() != 1) {
					return "redirect:/mainpage.do";
				}
			}
		}else {
			return "redirect:/mainpage.do";
		}
		
		
//		내가 올린 상품평들
		List<GoodsDto> gList = lalaMemberService.getDropMemGoods(id);
		for (int i = 0; i < gList.size(); i++) {
			System.out.println("gList : " + gList.get(i));
		}
//		상품평들 관여해서 전부 product 업데이트
		for (int i = 0; i < gList.size(); i++) {
			boolean isPoint = lalaMemberService.setDropMemGoods(gList.get(i));
			System.out.println("상품평 별점 초기화 : " + isPoint);
		}
		
//		쇼핑관련 delete
		
		boolean isShop = lalaMemberService.dropMemShop(id);
		/*
		한거 개아깝네 시발
		 
//		내가 관여한 상품들
		List<Integer> shops = lalaMemberService.getDropMemShop(id);
		
		for (int i = 0; i < shops.size(); i++) {
//			현재 내굿즈의 평점 총점을 가져옴
			int gPoint = lalaMemberService.getDropMemPoint(shops.get(i));
			
			GoodsDto goods = new GoodsDto();
			goods.setGpseq(shops.get(i));
			
			if(gPoint > 0.5) {
//				0.5 점이상이면 이점수로 셋팅함
				goods.setGpoint(gPoint);
			}else {
				goods.setGpoint(0);
			}
			
			lalaMemberService.setDropMemPoint(goods);
		}
		*/
		if(isShop) {
			System.out.println("쇼핑관련 삭제 성공");
		}else {
			System.out.println("쇼핑관련 삭제 실패");
		}
		
		
		
//		호텔관련 delete
		
//		내가 관여한 호텔들
		List<Integer> hotels = lalaMemberService.getDropMemHotel(id);
		
//		내 자식후기들 목록
		List<Integer> memRef = lalaMemberService.getDropMemRef(id);
//		자식후기들 삭제
		for(Integer ref: memRef) {
			lalaMemberService.dropMemRereply(ref);
		}
		
//		내가관여한 호텔들 평점 재설정
		for (int i = 0; i < hotels.size(); i++) {
			System.out.println("어디호텔인가 : " + hotels.get(i));
//			해당 호텔의 댓글 갯수와 평점 총점을 가져옴
			MemberUtil mUtil = lalaMemberService.getDropMemGrade(hotels.get(i));
			HotelDto hotel = new HotelDto();
			
			System.out.println("댓글갯수랑 평점총점  : " + mUtil.toString()); 
			if(mUtil.getCount() != 0) {
				double grade = MemberUtil.getAvgGrade(mUtil.getCount(), mUtil.getGrade());
				System.out.println("grade 계산결과 : " + grade);
				hotel.setSeq(hotels.get(i));
				hotel.setGrade(grade);
			}else {
				hotel.setSeq(hotels.get(i));
				hotel.setGrade(0.0);
			}
			
//			호텔에 셋팅한 grade 재설정
			boolean isHgrade = lalaMemberService.setDropMemGrade(hotel);
			
		}
		
		
		//		호텔 예약 내역 삭제
		boolean isReserve = lalaMemberService.dropMemReserve(id);
		
		if(isReserve) {
			System.out.println("호텔예약 삭제 성공");
		}else {
			System.out.println("호텔예약 삭제 실패");
		}
//		회원 del = 1 로만들고 나머지 set sysdate id는 유지
		
		boolean isMem = lalaMemberService.setDropMem(id);
		
		if(isMem) {
			System.out.println("회원탈퇴 성공");
		}else {
			System.out.println("회원탈퇴 실패");
		}
		
		HttpSession session = req.getSession(false);
		session.invalidate();
		
		System.out.println("시발해냈따!");
		
		return "redirect:/mainpage.do";
	}
	
	
////////////////////////////////내가 쓴 댓글    //////////////////////////////////
	@RequestMapping(value="MyWriteReply.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String MyWriteReply(Model model,pagingBean paging) {
		String id = paging.getId();
		System.out.println("MyWriteReplyController@@ id"+id);
			
		//댓글 가져오기
		System.out.println("111");
		List<ReplyDto> list = lalaMemberService.myWriteReply(paging);		
		System.out.println("222");
		System.out.println("MtWriteReplyController list.size()"+list.size());
		model.addAttribute("list", list);		
		model.addAttribute("paging", paging);
		return "MyWriteReply.tiles";
		
		
	}
	//내가 쓴 댓글 삭제
	@RequestMapping(value="MyWriteReplyDel.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String MyWriteReplyDel(int[] checkRow,String id) {
		System.out.println("MyWriteReplyDelController @@");
		System.out.println("@checkRow : "+checkRow);
		System.out.println("사이즈"+checkRow.length);
		
		for (int i = 0; i < checkRow.length; i++) {
			int seq = checkRow[i];
			//호텔이면 따로 호텔CONTROLLER에서 처리하려고 select 문을 한번 더씀
			ReplyDto rdto = new ReplyDto();
			rdto =lalaMemberService.seachTname(seq);
			if(rdto.getTname()=="HOTEL") {
			boolean isS =  hotelService.delReply(rdto);
			rdto = hotelService.getReplyCount2(rdto.getPseq());
			double avg = rdto.getGrade() / rdto.getSeq();
			HotelDto _hotel = new HotelDto();
			_hotel.setGrade(avg);
			_hotel.setSeq(rdto.getPseq());
			boolean s = hotelService.setHotelGrade(_hotel);
			continue;
			}
			
			lalaMemberService.MyWriteReplyDel(seq);
		}
		return "redirect:/MyWriteReply.do?id="+id;
	}
	
	//내가쓴글 review
	@RequestMapping(value="MyWriteReview.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String MyWriteReview(lala.com.a.hotel.pagingBean paging,Model model) {
		System.out.println("MyWriteReviewController@@");
		System.out.println("paging 컨트롤러 : " + paging.toString());
		List<ReviewDto> list = lalaMemberService.myWriteReviewList(paging);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		System.out.println("myWriteREvieWControllerAF@@");
		return "MyWriteReview.tiles";
	}
	//내가쓴글 meeting
	@RequestMapping(value="MyWriteMeeting.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String MyWriteMeeting(pagingBean paging , Model model) {
			
		System.out.println("MyWriteMeetingContrller@@");
		List<MeetingDto> list = lalaMemberService.MyWriteMeeting(paging);
		System.out.println("MyWriteMeetingContrller@@Af");			
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		return "MyWriteMeeting.tiles";
	}
	//내가쓴글 bbs
	@RequestMapping(value="MyWriteBbs.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String MyWriteBbs(pagingBean paging , Model model) {
		System.out.println("MyWriteBbsController@@");
		System.out.println("@@"+paging.toString());
		List<BbsDto> list = lalaMemberService.MyWriteBbs(paging);
		System.out.println("MyWriteBbsController list size :"+list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		return "MyWriteBbs.tiles";
	}
	
	
	
}






























