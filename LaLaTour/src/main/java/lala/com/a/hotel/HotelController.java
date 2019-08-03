package lala.com.a.hotel;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.tools.ant.filters.TokenFilter.Trim;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lala.com.a.model.HotelDto;
import lala.com.a.model.MemberDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.model.ReserveDto;
import lala.com.a.util.FUpUtil;
import lala.com.a.util.HotelUtil;
import lala.com.a.util.Singleton;

@Controller
public class HotelController {
	
	@Autowired
	HotelService hotelService;
	
	private static final Logger logger = LoggerFactory.getLogger(HotelController.class);
	
	@RequestMapping(value="hotellist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String hotellist(Model model, pagingBean paging) {
		logger.info(" hotellist : " + new Date() );
		
		System.out.println("findWord : " + paging.getFindWord());
		System.out.println("paging : " + paging.toString() + " ?? : " + paging == null);
//		리스트 페이지 최초 로딩시 넘어온 NowPage가없기떄문에 1로셋팅
		if(paging.getNowPage() == 0){
	         paging.setNowPage(1);   
	         System.out.println("new PagingBean() 1");
	    }
//		리스트 페이지 최초 로딩시 넘어온 검색값이 없기때문에 초기화
		if(paging.getChoice() == null || paging.getChoice().equals("")) {
			paging.setChoice("title");
		}
		if(paging.getFindWord() == null) {
			paging.setFindWord("");
		}
		if(paging.getPlace() == null || paging.getPlace().equals("")) {
			paging.setPlace("all");
		}
		
//		리스트페이징
		int totalCount = hotelService.getHotelCount(paging);
		System.out.println("토탈카운트 : " + totalCount);
		paging.setTotalCount(totalCount);
		//현재 페이지가 정해져있지않으면 1로셋팅
		
//		countPerPage, startNum 을 초기화 해주는곳
		paging = pagingUtil.setPagingInfo(paging,"HotelList");
		System.out.println("List paging : " + paging.toString());
		List<HotelDto> hotelList = hotelService.getHotelList(paging);
		
		model.addAttribute("hotelList",hotelList);
		model.addAttribute("paging",paging);
		return "hotellist.tiles";
	}
	
	@RequestMapping(value="hotelwrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String hotelWrite(HttpServletRequest req) {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		
		if(login == null || login.getAuth() != 1) {
			return "redirect:/hotellist.do";
		}
		
		return "hotelwrite.tiles";
	}
	
	@RequestMapping(value="hotelwriteAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String hotelwriteAf(HotelDto hotel, 
			/*폼필드가 아닌애*/	@RequestParam(value="pFiles[]", required = false)MultipartFile pFiles[],
							@RequestParam(value="fileThumb", required = false)MultipartFile fileThumb,
							HttpServletRequest req) {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null || login.getAuth() == 0) {
			return "redirect:/hotellist.do";
		}
		logger.info("HotelController hotelwriteAf " + new Date());
		System.out.println("hotel : " + hotel.toString());
		for(int i = 0 ; i < pFiles.length; i++) {
			System.out.println("file : " + pFiles[i]);
		}
		System.out.println("썸네일 : " + fileThumb);
//		HotelDto 셋팅
		//톰캣 경로
		String fupload = req.getSession().getServletContext().getRealPath("/upload");
		System.out.println("경로 : " + fupload);
		String originalFileName = "";
		File file = null;
		
		originalFileName = fileThumb.getOriginalFilename();
		
		hotel.setThumbnail(originalFileName);
		file = new File(fupload +"/" + originalFileName);
		//pseq 초기화
		int pseq = 0;
		try {
//		썸네일 파일 업로드
			FileUtils.writeByteArrayToFile(file, fileThumb.getBytes());
			//db업데이트 // pds에들어갈 pseq 를 뽑아줌
			System.out.println("write : " + hotel.toString());
			pseq = hotelService.writeHotel(hotel);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("경로 : " + fupload);

		
		PdsDto pds = new PdsDto();
		for(MultipartFile mf : pFiles) {
//			원본 파일명
			originalFileName = mf.getOriginalFilename();
			pds.setFileName_Bf(originalFileName);
//			새 파일명
			String newFileName = FUpUtil.getNewFile(originalFileName);
			pds.setFileName_Af(newFileName);
			file = new File(fupload +"/" + newFileName);
			pds.setPseq(pseq);
			System.out.println("pdsToString" + pds.toString());
			try {
				//다중파일 올림
				FileUtils.writeByteArrayToFile(file, mf.getBytes());
				
				//db 업데이트
				hotelService.uploadHotelPds(pds);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/hotellist.do";
	}
	
	@RequestMapping(value="hoteldetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String hoteldetail(Model model, int seq, String year, String month, pagingBean paging) {
		Singleton s = Singleton.getInstance();
		s.rDate.clear();
		
		System.out.println("seq : " + seq);
		
//		호텔정보
		HotelDto hotel = hotelService.getHotelDetail(seq);
//		사진들
		List<PdsDto> pdsList = hotelService.getHotelPds(seq);
//		sdate,edate
		List<ReserveDto> reDate = hotelService.getReserveDate(seq);
		
		System.out.println("reDate : " + reDate.size());
		
		for(ReserveDto re : reDate) {
			HotelUtil.reserveDate(re.getSdate(), re.getEdate());
		}
		
//		댓글 페이징
		//현재 페이지가 정해져있지않으면 1로셋팅
		if(paging.getNowPage() == 0){
			paging.setNowPage(1);   
			System.out.println("new PagingBean() 1");
		}

		int totalCount = hotelService.getReplyCount(seq);;
		
		paging.setTotalCount(totalCount);
		
		paging.setPseq(seq);
		paging = pagingUtil.setPagingInfo(paging,"replyList");
		
//		댓글
		List<ReplyDto> reply = hotelService.getReplyList(paging);
		
		System.out.println("paging TotalCount : " + paging.getTotalCount());
		
		
		model.addAttribute("hotel",hotel);
		model.addAttribute("pdsList",pdsList);
		
		model.addAttribute("year",year);
		model.addAttribute("month",month);

		model.addAttribute("reply",reply);
		
		model.addAttribute("paging",paging);
		
		return "hoteldetail.tiles";
	}
	
	@RequestMapping(value="reserve.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String reserve(ReserveDto reserve,Model model,HttpServletRequest req) {
		System.out.println("reserve : " + reserve.toString());
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null) {
			return "redirect:/hotellist.do";
		}
		
		model.addAttribute("reserve",reserve);
		
		return "reserve.tiles";
	}
	@RequestMapping(value="reserveAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String reserveAf(ReserveDto reserve , Model model,HttpServletRequest req) {
		System.out.println("reserveAf.do");
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null) {
			return "redirect:/hotellist.do";
		}
		System.out.println("reserveAf : " + reserve.toString());
		
		boolean isS = hotelService.addHotelReserve(reserve);
		if(isS) {
			System.out.println("예약성공");
		}else {
			System.out.println("예약실패");
		}
		
		return "redirect:/hoteldetail.do?seq=" + reserve.getPseq();
	}
	@RequestMapping(value="addReply.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String addReply(ReplyDto reply,double grade,HttpServletRequest req) {
		
		System.out.println("reply : " + reply.toString());
		System.out.println("grade : " + grade);
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null ) {
			return "redirect:/hotellist.do";
		}
		
		MemberDto reCount2 = hotelService.getReplyCount2(reply.getPseq());
		int reCount = reCount2.getSeq();
		System.out.println("리플갯수  : " +reCount);
		
		double hGrade = hotelService.getReplyGrade(reply.getPseq());
		System.out.println("현제 grade 평균값 : " + hGrade);
//		grade 총 합은 grade의 평균 * 총 갯수
		double sumGrade = hGrade * reCount;
		System.out.println("현재 grade평균값 * 총갯수 : " + sumGrade);
//		총 합 + 추가될 grade / ( 총갯수 + 1)
		
		double sum = sumGrade + grade;
		System.out.println("sum(grade) + 넘어온 grade : " + sum);
		double avgGrade = sum / (reCount+1);
		System.out.println("평균 grade : " + avgGrade);
		
		HotelDto _hotel = new HotelDto();
		
		_hotel.setGrade(avgGrade);
		_hotel.setSeq(reply.getPseq());
		
		boolean s = hotelService.setHotelGrade(_hotel);
		
		boolean isS = hotelService.addReply(reply);
		if(s) {
			System.out.println("평점 완료");
		}else {
			System.out.println("평점 실패");
		}
		if(isS) {
			System.out.println("댓글 입력 성공");
		}else {
			System.out.println("댓글 입력 실패");
		}
		
		return "redirect:/hoteldetail.do?seq=" + reply.getPseq();
	}
	@RequestMapping(value="addRereply.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String addRereply(ReplyDto reply,HttpServletRequest req) {
		System.out.println("replydto : " + reply.toString());
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null) {
			return "redirect:/hotellist.do";
		}
		boolean isS = hotelService.addRereply(reply);
		
		if(isS) {
			System.out.println("댓글 입력 성공");
		}else {
			System.out.println("댓글 입력 실패");
		}
		
		return "redirect:/hoteldetail.do?seq=" + reply.getPseq();
	}
	@RequestMapping(value="delreply.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String delreply(ReplyDto reply,HttpServletRequest req) {
		System.out.println("reply : " + reply.toString());
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		System.out.println("login : " + login);
		System.out.println("reply.getid : " + reply.getId());
		if(login == null || !login.getId().equals(reply.getId())) {
			return "redirect:/hotellist.do";
		}
//		델삭제
		boolean isS = hotelService.delReply(reply);
		System.out.println("댓글이 삭제됌 ? : " + isS);
		ReplyDto re = hotelService.getReplyCount2(reply.getPseq());
		System.out.println("평점을 달아준 댓글이 몇개인가 ?  : " + re);
		
		System.out.println("reply : " + reply.toString());
		double avg = 0;
		if(re.getSeq()!=0 && re.getGrade() != 0 ) {
			avg = re.getGrade() / re.getSeq();
		}
		System.out.println("avg : " + avg);
		HotelDto _hotel = new HotelDto();
		_hotel.setGrade(avg);
		_hotel.setSeq(reply.getPseq());
		System.out.println("결과적으론 ? : " + _hotel.toString());
		boolean s = hotelService.setHotelGrade(_hotel);
		
		if(isS) {
			System.out.println("댓글 삭제 성공");
		}else {
			System.out.println("댓글 삭제 실패");
		}
		
		return "redirect:/hoteldetail.do?seq=" +reply.getPseq();
	}
	@RequestMapping(value="hotelupdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String hotelupdate(int seq, Model model,HttpServletRequest req) {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null || login.getAuth() ==0) {
			return "redirect:/hotellist.do";
		}
		HotelDto hotel = hotelService.getHotelDetail(seq);
		
		List<PdsDto> pds = hotelService.getHotelPds(seq);
		
		
		model.addAttribute("hotel",hotel);
		model.addAttribute("pds",pds);
		
		return "hotelupdate.tiles";
	}
	@RequestMapping(value="hotelupdateAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String hotelupdateAf(HotelDto hotel,String[] delPds,String thumb,
			@RequestParam(value="pFiles[]", required = false)MultipartFile pFiles[],
			@RequestParam(value="fileThumb", required = false)MultipartFile fileThumb,
			HttpServletRequest req) {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null || login.getAuth() == 0) {
			return "redirect:/hotellist.do";
		}
		System.out.println("hotel : "  +hotel.toString());
		
		
//		삭제할 이름이 넘어오면 다중파일 삭제
		if(delPds != null) {
			for(int i = 0 ; i < delPds.length; i++) {
				hotelService.delHotelPds(Integer.parseInt(delPds[i]) );
			}
		}
		
		System.out.println(" filethumb : " + fileThumb);
		System.out.println("delthumb : " + thumb);
		PdsDto pds = new PdsDto();
//		썸네일을 변경하였으면
		String fupload = req.getSession().getServletContext().getRealPath("/upload");
		System.out.println("폴더이름 : " + fupload);
		String originalFileName = "";
		File file = null;
		
		if(fileThumb.getOriginalFilename() != null && !fileThumb.getOriginalFilename().trim().equals("") ) {
			originalFileName = fileThumb.getOriginalFilename();
			System.out.println("여기론왜들어옴");
			System.out.println("ofname : " + originalFileName);
			hotel.setThumbnail(originalFileName);
			file = new File(fupload +"/" + originalFileName);
			
			try {
//			썸네일 파일 업로드
				FileUtils.writeByteArrayToFile(file, fileThumb.getBytes());
				//db업데이트 // pds에들어갈 pseq 를 뽑아줌
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
//			썸네일 파일이안나오면 기존껄로셋팅
			System.out.println("여길로왔음?");
			System.out.println("t : " + thumb);
			hotel.setThumbnail(thumb);
		}
		System.out.println("hotel : " + hotel.toString());
		hotelService.setHotelUpdate(hotel);

//		다중파일이 넘어온게 있으면
		if(pFiles.length>0 && !pFiles.equals("") && pFiles != null) {
			System.out.println("대체여기를 왜들어온거냐");
			System.out.println("p   : " + pFiles.toString());
			for(MultipartFile mf : pFiles) {
//				원본 파일명
				originalFileName = mf.getOriginalFilename();
				pds.setFileName_Bf(originalFileName);
				if(!pds.getFileName_Bf().equals("") && pds.getFileName_Bf() != null) {
//					새 파일명
					String newFileName = FUpUtil.getNewFile(originalFileName);
					pds.setFileName_Af(newFileName);
					file = new File(fupload +"/" + newFileName);
					pds.setPseq(hotel.getSeq());
					System.out.println("pdsToString" + pds.toString());
					try {
						//다중파일 올림
						FileUtils.writeByteArrayToFile(file, mf.getBytes());
						
						//db 업데이트
						hotelService.uploadHotelPds(pds);
						
					} catch (IOException e) {
						e.printStackTrace();
					}
					
				}
			}
		}
		
		System.out.println("t :   " + fileThumb);
		return "redirect:/hoteldetail.do?seq="+hotel.getSeq();
	}
	@RequestMapping(value="hoteldelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String hoteldelete(int seq, HttpServletRequest req) {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null || login.getAuth() != 1) {
			return "redirect:/hotellist.do";
		}
//		본문글 삭제 del =1 + 후기 del = 1
		boolean s = hotelService.setHotelDelete(seq);
		
		if(s) {
			System.out.println("삭제성공");
		}else {
			System.out.println("삭제실패");
		}
		
		return "redirect:/hotellist.do";
	}
	@RequestMapping(value="cancelReserve.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String cancelReserve(int seq,Model model,HttpServletRequest req) {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null ) {
			return "redirect:/hotellist.do";
		}
		System.out.println("예약취소 seq : " + seq);
		
		ReserveDto reserve = hotelService.getMyReserveOne(seq);
		
		model.addAttribute("reserve",reserve);
		return "cancelReserve.tiles";
	}
	@RequestMapping(value="calcelReserveAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String calcelReserveAf(int seq , HttpServletRequest req) {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login == null) {
			return "redirect:/hotellist.do";
		}
		System.out.println("예약정말취소 seq : " + seq);
		
		boolean s= hotelService.setReserveCancel(seq);
		if(s) {
			System.out.println("예약신청 취소 성공");
		}else {
			System.out.println("예약신청 취소 실패");
		}
		
		return "redirect:/hotellist.do";
	}
}
