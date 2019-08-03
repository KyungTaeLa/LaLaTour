package lala.com.a.location.attrac;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lala.com.a.util.FUpUtil;
import lala.com.a.util.FileupUtil;
import lala.com.a.location.attrac.pagingUtil;
import lala.com.a.model.LocationDto;
import lala.com.a.model.MemberDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;



@Controller
public class AttracController {

	private static final Logger logger 
	= LoggerFactory.getLogger(AttracController.class);

	@Autowired
	AttracService attracservice;


	@RequestMapping(value = "location_attrac.do", method = {RequestMethod.GET, RequestMethod.POST})
	// util을 들려야하는데 못들리고 있음
	public String attrlist( Model model, pagingBean bean) {
		logger.info("AttracController attrlist" + new Date());
		System.out.println("findWord : " + bean.getFindWord());
		System.out.println("paging : " + bean.toString() + " ?? : " + bean == null);
		System.out.println("startNum : " + bean.getStartNum());
		System.out.println("countPerPage : " + bean.getCountPerPage());
		System.out.println("bean : " + bean.toString());

		if(bean.getNowPage() == 0){
			bean.setNowPage(1);   
			System.out.println("new PagingBean() 1");
		}

		if(bean.getChoice() == null || bean.getChoice().equals("")) {
			bean.setChoice("title");
		}
		if(bean.getFindWord() == null) {
			bean.setFindWord("");
		}
		if(bean.getPlace() == null || bean.getPlace().equals("")) {
			bean.setPlace("all");
		}
		//		리스트페이징
		int totalCount = attracservice.getAttracCount(bean);

		bean.setTotalCount(totalCount);
		//현재 페이지가 정해져있지않으면 1로셋팅

		System.out.println("bean : " + bean.toString());
		System.out.println("처음 페이징값 : " + bean.toString());
		bean = pagingUtil.setPagingInfo(bean,"location_attrac");
		//System.out.println("List paging : " + bean.toString());

		System.out.println("쿼리실행후 페이징값1 : " + bean.toString());
		List<LocationDto> list = attracservice.getAttlist(bean);
		System.out.println("쿼리실행후 페이징값2 : " + bean.toString());


		model.addAttribute("paging",bean);
		System.out.println("리스트 : " + list.toString());
		System.out.println("bean : " + bean.toString());
		model.addAttribute("attrlist", list);
		//		System.out.println("list size = " + list.get(0).toString());

		return "location_attrac.tiles";
	}

	@RequestMapping(value = "location_attrac_write.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String attwrite(Model model, HttpServletRequest req) {
		logger.info("AttracController attwrite()" + new Date());

		MemberDto login = (MemberDto)req.getSession().getAttribute("login");

		if(login == null || login.getAuth() != 1) {
			return "location_attrac.tiles";
		}

		return "location_attrac_write.tiles";
	}

	@RequestMapping(value = "location_attrac_writeAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String attwriteAf(LocationDto loc, 
			/*폼필드가 아닌애*/   @RequestParam(value="lFiles", required = false)MultipartFile lFiles[],
			@RequestParam(value="lThum", required = false)MultipartFile lThum,
			HttpServletRequest req){
		logger.info("AttracController attwriteAf()" + new Date());
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");

		if(login == null || login.getAuth() != 1) {
			return "location_attrac.tiles";
		}

		String filename1 = "";
		String newfilename1 = "";
		String fupload1 = "";

		int pseq = 0;

		System.out.println("lf = " + lFiles);

		loc.setSubname("attrac");
		System.out.println("lThum = " + lThum);


		// lThum 파일
		String lt = lThum.getOriginalFilename();
		loc.setThumbnail(lt);
		String fupload = req.getSession().getServletContext().getRealPath("/upload");
		File file = new File(fupload1 +"/" + lt);
		logger.info("upload1 파일경로 : " + fupload1 +"/" + lt);
		try {
			FileUtils.writeByteArrayToFile(file, lThum.getBytes());
		} catch (IOException e1) {

			e1.printStackTrace();
		}

		System.out.println("loc = " + loc.toString());

		attracservice.attwrite(loc);
		pseq = attracservice.selectseq(loc);
		System.out.println("pseq= " + pseq);
		System.out.println("locToString : " + loc.toString());

		PdsDto pds = new PdsDto();

		String filename2 = "";
		String newfilename2 = "";
		String fupload2 = "";

		// filename 취득
		for (MultipartFile lf : lFiles) {
			pds.setPseq(pseq);
			System.out.println("lFiles = " + lf);
			filename2 = lf.getOriginalFilename();
			System.out.println("filename = " + filename2);
			pds.setFileName_Bf(filename2);
			fupload2 = req.getSession().getServletContext().getRealPath("/upload");
			newfilename2 = FileupUtil.getNewFilename(filename2);
			pds.setFileName_Af(newfilename2);
			pds.setTname("attrac");
			System.out.println("upload2 파일경로 : " + fupload2 +"/" + newfilename2);

			File file2 = new File(fupload2 +"/" + newfilename2);
			logger.info("upload2 파일경로 : " + fupload2 +"/" + newfilename2);

			// 실제 파일 업로드부분
			try {
				FileUtils.writeByteArrayToFile(file2, lf.getBytes());

				// DB
				loc.setSubname("attrac");
				attracservice.uploadPds(pds);
			} catch (IOException e) {

				e.printStackTrace();
			}
		}




		return "redirect:location_attrac.do";


	}

	@RequestMapping(value = "location_attrac_detail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String attdetail(pagingBean bean , LocationDto loc, ReplyDto rep, Model model, int seq, PdsDto pds) throws Exception {
		logger.info("AttracController arrdetail()" + new Date());

		loc.setSubname("attrac");

		LocationDto dto = attracservice.attdetail(loc);

		model.addAttribute("attdetail", dto);
		System.out.println("dto = " + dto.toString());
		System.out.println("loc = " + loc.toString());
		
		pds.setPseq(seq);
		String str = "attrac";
		pds.setTname(str);
		System.out.println("seq나오나? " + seq);
		List<PdsDto> plist = attracservice.attdetailPds(pds);
		model.addAttribute("plist", plist);
		

		//seq 가지고 오자나? -> 댓글의pseq 
		// --------------------------------------------------------------------------------아래는 댓글

		System.out.println("Rpaging : " + bean.toString() + " ?? : " + bean == null);
		System.out.println("RstartNum : " + bean.getStartNum());
		System.out.println("RcountPerPage : " + bean.getCountPerPage());
		System.out.println("Rbean1 : " + bean.toString());

		if(bean.getNowPage() == 0){
			bean.setNowPage(1);   
			System.out.println("new PagingBean() 1");
		}
		if(bean.getChoice() == null || bean.getChoice().equals("")) {
			bean.setChoice("title");
		}
		if(bean.getFindWord() == null) {
			bean.setFindWord("");
		}
		if(bean.getPlace() == null || bean.getPlace().equals("")) {
			bean.setPlace("all");
		}

		int totalCount = attracservice.getAttracReplyCount(seq);

		bean.setTotalCount(totalCount);
		System.out.println("Rtotalcount : " + totalCount);
		bean.setPseq(seq);
		System.out.println("Rseq : " + seq);

		bean = pagingUtil.setPagingInfo(bean,"location_atrac_reply");

		System.out.println("Rbean2 : " + bean.toString());

		// 댓글 출력
		//rep.setTname("attrac");
		model.addAttribute("paging",bean);
		System.out.println("pbean : " + bean.toString());
		List<ReplyDto> list = attracservice.Replylist(bean);
		System.out.println("list크기 : " + list.size());
		model.addAttribute("rlist", list);
		System.out.println("list를 ㅉㅇㅂㄷ : " + list.toString());

		/*List<ReplyDto> slist = attracservice.Subreply(loc.getSeq());
		System.out.println("slist크기 : " + slist.size());
		model.addAttribute("slist", slist);
		 */

		return "location_attrac_detail.tiles";
	}

	@RequestMapping(value = "location_attrac_update.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String attupdate(LocationDto loc, PdsDto pds,  Model model, HttpServletRequest req) throws Exception {
		logger.info("AttracController arrdetail()" + new Date());

		MemberDto login = (MemberDto)req.getSession().getAttribute("login");

		if(login == null || login.getAuth() != 1) {
			return "location_attrac.tiles";
		}

		loc.setSubname("attrac");

		LocationDto dto = attracservice.attdetail(loc);
		pds.setPseq(loc.getSeq());
		pds.setTname("attrac");
		List<PdsDto> list = attracservice.selectPds(pds);

		model.addAttribute("attupdate", dto);
		model.addAttribute("pdslist", list);
		
		for(int i =0; i<list.size(); i++) {
			
			System.out.println("리스트확잉ㄴ:"+list.toString());
			
		}


		System.out.println("loc = " + loc.toString());

		return "location_attrac_update.tiles";
	}

	/*@ResponseBody
	@RequestMapping(value = "location_attrac_Filedelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String filedelete(int seq) {
		logger.info("AttracController filedelete()" + new Date());
		PdsDto pds = new PdsDto();
		System.out.println("오는거니?");

		pds.setSeq(seq);
		System.out.println("seq = " + seq);
		pds.setTname("attrac");

		attracservice.UpdeletePds(pds);

		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		return "ACCESS";

	}
	 */
	@RequestMapping(value = "location_attrac_updateAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String attupdateAf(LocationDto loc, String[] delPds, String OUlThum,
			/*폼필드가 아닌애*/   @RequestParam(value="lFiles", required = false)MultipartFile lFiles[],
			@RequestParam(value="lThum", required = false)MultipartFile lThum,
			HttpServletRequest req) throws Exception{
		System.out.println("LocationDto : "  +loc.toString());
		
		System.out.println("OUlThum : " + OUlThum);
		for (MultipartFile m : lFiles) {
			System.out.println("m : " + m);
		}
		System.out.println("lThum : " + lThum );

		//		삭제할 이름이 넘어오면 다중파일 삭제
		if(delPds != null) {
			for(int i = 0 ; i < delPds.length; i++) {
				attracservice.UpdeletePds(Integer.parseInt(delPds[i]));
			}
		}

		System.out.println(" lThum : " + OUlThum);
		System.out.println("delthumb : " + OUlThum);
		PdsDto pds = new PdsDto();
		//		썸네일을 변경하였으면
		String fupload = req.getSession().getServletContext().getRealPath("/upload");
		System.out.println("폴더이름 : " + fupload);
		String originalFileName = "";
		File file = null;

		if(lThum.getOriginalFilename() != null && !lThum.getOriginalFilename().trim().equals("") ) {
			originalFileName = lThum.getOriginalFilename();
			System.out.println("여기론왜들어옴");
			System.out.println("ofname : " + originalFileName);
			loc.setThumbnail(originalFileName);
			file = new File(fupload +"/" + originalFileName);

			try {
				//			썸네일 파일 업로드
				FileUtils.writeByteArrayToFile(file, lThum.getBytes());
				//db업데이트 // pds에들어갈 pseq 를 뽑아줌
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			//			썸네일 파일이안나오면 기존껄로셋팅
			System.out.println("여길로왔음?");
			System.out.println("t : " + OUlThum);
			loc.setThumbnail(OUlThum);
		}
		System.out.println("location : " + loc.toString());
		attracservice.attupdate(loc);

		//		다중파일이 넘어온게 있으면
		if(lFiles.length>0 && !lFiles.equals("") && lFiles != null) {
			System.out.println("대체여기를 왜들어온거냐");
			System.out.println("p   : " + lFiles.toString());
			System.out.println(lFiles.length);
			for(MultipartFile mf : lFiles) {
				//				원본 파일명
				originalFileName = mf.getOriginalFilename();
				pds.setFileName_Bf(originalFileName);
				System.out.println("original :  " + originalFileName);
				if(!pds.getFileName_Bf().equals("") && pds.getFileName_Bf() != null) {
					//		새 파일명
					String newFileName = FUpUtil.getNewFile(originalFileName);
					System.out.println("newname : " + newFileName);
					pds.setFileName_Af(newFileName);
					file = new File(fupload +"/" + newFileName);
					pds.setPseq(loc.getSeq());
					System.out.println("pdsToString" + pds.toString());
					try {
						//다중파일 올림
						FileUtils.writeByteArrayToFile(file, mf.getBytes());
						
						//db 업데이트
						attracservice.attFileupdate(pds);

					} catch (IOException e) {
						e.printStackTrace();
					}

				}
			}
		}

		System.out.println("t :   " + lThum);

		return "redirect:/location_attrac_detail.do?seq=" + loc.getSeq();
	}
	
	@RequestMapping(value = "location_attrac_listdelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String listdelete(int seq, HttpServletRequest req, LocationDto loc) {
		logger.info("AttracController listdelete()" + new Date());
		
		
		int pseq = seq;
		System.out.println("seq = " + seq);
		attracservice.listdelete(seq);
		attracservice.listdelete_replydelete(pseq);
		attracservice.listdelete_UpdeletePds(pseq);
		
		return "redirect:/location_attrac.do";
		
		
	}


	@RequestMapping(value = "location_attrac_Reply.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String reply(ReplyDto rep, Model model) {
		logger.info("AttracController reply()" + new Date());

		// 댓글 입력
		rep.setTname("attrac");

		attracservice.Replyinsert(rep);
		System.out.println("rep = " + rep.toString());
		/*	
		// 댓글 출력
		rep.setTname("attrac");
		List<ReplyDto> list = attracservice.Replylist(rep);
		System.out.println("list크기 : " + list.size());
		model.addAttribute("rlist", list);
		 */
		return "redirect:/location_attrac_detail.do?seq=" + rep.getPseq();
	}

	@RequestMapping(value = "location_attrac_upreply.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String upreply(ReplyDto rep, Model model, HttpServletRequest req) {

		MemberDto login = (MemberDto)req.getSession().getAttribute("login");

		if(login == null || !login.getId().equals(rep.getId())) {
			return "location_attrac.tiles";
		}
		logger.info("AttracController upreply()" + new Date());
		System.out.println("안들어오너");
		rep = attracservice.Replyselect(rep);

		model.addAttribute("rep", rep);
		System.out.println("rep? : " + rep.toString());

		return "location_attrac_upreply.tiles";
	}

	@RequestMapping(value = "location_attrac_Replyupdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String Replyupdate(ReplyDto rep) {
		logger.info("AttracController Replyupdate()" + new Date());
		System.out.println("repppppppppppppppppppppppp=" + rep.toString());
		attracservice.PReplyupdate(rep);

		return "redirect:/location_attrac_detail.do?seq=" + rep.getPseq();

	}

	@RequestMapping(value = "location_attrac_Redelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String Redelete(ReplyDto rep) {
		logger.info("AttracController Redelete()" + new Date());

		attracservice.Redelete(rep);
		System.out.println("삭제성공");
		return "redirect:/location_attrac_detail.do?seq=" + rep.getPseq();
	}

	@RequestMapping(value = "location_attrac_SubreplyAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String SubreplyAf(ReplyDto rep) {
		logger.info("AttracController SubreplyAf()" + new Date());

		System.out.println("댓댓스기 : " + rep.toString());
		attracservice.SubreplyAf(rep);
		System.out.println("location_attrac_SubreplyAf 들어옹?");

		return "redirect:/location_attrac_detail.do?seq=" + rep.getPseq();
	}

	@RequestMapping(value = "location_attrac_Subreply.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String Subreply(ReplyDto rep, Model model) {
		logger.info("AttracController Subreply()" + new Date());

		String pseq = String.valueOf(rep.getPseq());

		System.out.println("rep의pseq확인 : " + rep.getPseq());
		model.addAttribute("sub", pseq);
		return "location_attrac_subreply.tiles";

	}

	@RequestMapping(value = "location_attrac_Subreplyup.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String Subreplyup(ReplyDto rep) {
		logger.info("AttracController Subreplyup()" + new Date());

		System.out.println("subrep수정 확인 : " + rep.toString());

		attracservice.Subreplyup(rep);

		return "redirect:/location_attrac_detail.do?seq=" + rep.getPseq();
	}

	@RequestMapping(value = "location_attrac_Subredelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String Subredelete(ReplyDto rep) {
		logger.info("AttracController Subredelete()" + new Date());

		System.out.println("subrep삭제 확인 : " + rep.toString());

		attracservice.Subredelete(rep);

		return "redirect:/location_attrac_detail.do?seq=" + rep.getPseq();
	}



}