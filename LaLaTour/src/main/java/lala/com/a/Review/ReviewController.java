package lala.com.a.Review;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import lala.com.a.Festival.FestivalService;

import lala.com.a.model.FestivalDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.model.ReviewDto;
import lala.com.a.util.FUpUtil;
import lala.com.a.util.HotelUtil;
import lala.com.a.util.pagingBean;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	@Autowired
	FestivalService festivalService;
	
	
	@RequestMapping(value="reviewList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String reviewList(Model model , pagingBean paging , HttpServletRequest req) {
		
		System.out.println("reviewListController@@");
		System.out.println("findWord123 : "+paging.getFindWord() + "choice 123 : "+paging.getChoice());
		
		if(paging.getFindWord()==null) {
			paging.setFindWord("");
		}
		
		if(paging.getChoice()==null) {
			paging.setChoice("");
		}
		
		if(req.getParameter("nowPage")==null){
			paging.setNowPage(1);	
		}else {
			paging.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
		}
		
		
		
		
		

		List<ReviewDto> list = reviewService.reviewList(paging);		
		List<PdsDto> plist = reviewService.reviewListPds();

		int seq = 0;
		System.out.println("11111");
//		System.out.println("lll:"+list.toString());
	//	System.out.println("ppp:"+plist.toString());
		ArrayList thumbnail=new ArrayList(); 
		int revseq =0;
		int pdseq =0;
		for(int i=0;i<list.size();i++) {
				revseq = list.get(i).getSeq();
			
			for(int j=0;j<plist.size();j++) {
				pdseq = plist.get(j).getPseq();
				if(revseq==pdseq) {
				thumbnail.add(plist.get(j).getFileName_Af());
					break;
				}
			
			}
		}
		
//		for(int i=0;i<thumbnail.size();i++) 
//		System.out.println("@@@@--@@@@"+thumbnail.get(i));
		System.out.println("2222");
		System.out.println("@@");
		System.out.println(thumbnail.toString());
		
		model.addAttribute("list", list);
		model.addAttribute("plist",plist);
		model.addAttribute("thumbnail", thumbnail);
		model.addAttribute("paging",paging);
		System.out.println("list.size()"+list.size());
		System.out.println("plist.size()"+plist.size());
		System.out.println("thumbnail.size()"+thumbnail);
		
		return "reviewList.tiles";
	}
	@RequestMapping(value="SearchreviewList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String SearchreviewList(Model model , pagingBean paging , HttpServletRequest req) {
		System.out.println("SearchReviewList.doController");
		
		
		List<ReviewDto> list = reviewService.SearchreviewList(paging);
		List<PdsDto> plist = reviewService.reviewListPds();

		int seq = 0;
		System.out.println("11111");
//		System.out.println("lll:"+list.toString());
	//	System.out.println("ppp:"+plist.toString());
		ArrayList thumbnail=new ArrayList(); 
		int revseq =0;
		int pdseq =0;
		for(int i=0;i<list.size();i++) {
				revseq = list.get(i).getSeq();
			
			for(int j=0;j<plist.size();j++) {
				pdseq = plist.get(j).getPseq();
				if(revseq==pdseq) {
				thumbnail.add(plist.get(j).getFileName_Af());
					break;
				}
			
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("plist",plist);
		model.addAttribute("thumbnail", thumbnail);
		model.addAttribute("paging",paging);
		
		return "reviewList.tiles";
	}
	
	@RequestMapping(value="reivewWrite.do", method={RequestMethod.GET, RequestMethod.POST})
	public String reivewWrite(FestivalDto dto , Model model) {
		System.out.println("reviewWriteController@@@@@@@");
		
		/*
		 * List<FestivalDto> ftlist = reviewService.ftPlaceTitle();
		 */
		model.addAttribute("dto", dto);
		return "reivewWriteAf.tiles";
	}
	
	
	
	@RequestMapping(value="reviewWriteAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String reviewWriteAf(String content[],String title, int pseq,String id, double score,
								@RequestParam(value="reviewFile", required=false)MultipartFile reviewFile[],
								HttpServletRequest req,MultipartHttpServletRequest mtfreq) {
		
		System.out.println("대체머하는거냐");
		PdsDto pdto = new PdsDto();
		System.out.println("ReviewWriteAfController" + title);
		System.out.println("ReviewWriteAfController" + pseq);
		System.out.println("ReviewWriteAfController" + id);
		System.out.println("ReviewWriteAfController score : "+score);
		
		boolean isS = reviewService.reviewInsert(pseq, id, title,score);	
		boolean isS1 = reviewService.scoreUpdate(pseq, score);
		System.out.println("ScoreUpdate 결과" + isS1);
		
		if(isS) {
			System.out.println("review는 넣었음");
		}else {
			System.out.println("review조차 못넣었ㅇ므 ㅆ삐라");
		}
		
		String fupload = req.getSession().getServletContext().getRealPath("/upload");
		//MultipartFile mt;
		
		  for (int i = 0; i<reviewFile.length;i++) {
		  if(content[i]==null||content[i].equals("")) {
		  continue;
		  }
		  //aaaa
		  MultipartFile mt = reviewFile[i];
		  System.out.println("----fileNameBf----");
		  //System.out.println(mt.getOriginalFilename()); 
		  
		  String fileName_Bf = mt.getOriginalFilename();
		  pdto.setFileName_Bf(fileName_Bf);
		  
		  String f = pdto.getFileName_Bf();
		  String fileName_Af = FUpUtil.getNewFile(f);
		  pdto.setFileName_Af(fileName_Af);
		  
		  pdto.setContent(content[i]);		  
		  File file = new File(fupload+"/"+fileName_Af);		  
		  try {
			FileUtils.writeByteArrayToFile(file, mt.getBytes());
			boolean isS2 = reviewService.reviewFileInsert(pdto);
			if(isS2) {
				System.out.println("이미지 DB 업로드까지 성공");
			}else {
				System.out.println("이미지 DB업로드 실패");
			}
			
			 
			
		} catch (IOException e) {
			e.printStackTrace();
		}		  
		  System.out.println(fupload+fileName_Af);
	}
		 
		System.out.println("reviewWriteAfController success");
		return "redirect:/reviewList.do";
	}
	
	
	
	@RequestMapping(value="festivalSeach.do", method={RequestMethod.GET, RequestMethod.POST})
	public String festivalSeach(Model model , pagingBean paging,HttpServletRequest req,
					String findWord , String choice) {		
		System.out.println("ReviewControllerFestivalSeach@@");
		
		List<FestivalDto> slist = festivalService.sfestival();
		
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd");
		 Date currentTime = new Date ();
		 String mTime = mSimpleDateFormat.format ( currentTime );
		 mTime = mTime.substring(0,10); //mTime은 현재날짜
		 int nowDate = Integer.parseInt(mTime.replace("-",""));
		 
		 for (int i = 0; i < slist.size(); i++) {
				FestivalDto sdto = slist.get(i);
				sdto.geteDate();
			    String edate = sdto.geteDate().substring(0, 10);
			    System.out.println("2번째 :"+edate);
			    int eDate = Integer.parseInt(edate.replace("-",""));
			    System.out.println("3번째 :"+eDate);
			    if(nowDate>eDate) {
			    	//업데이트 구문
			    	int eseq = sdto.getSeq();
			    	boolean isS = festivalService.edateUpdate(eseq);
			    }
			    
			}
		 
		 if(paging.getFindWord()==null) {
				paging.setFindWord("");
			}else {
				paging.setFindWord(findWord.trim());
			}
			
			if(paging.getChoice()==null) {
				paging.setChoice("");
			}else {
				paging.setChoice(choice.trim());
			}
			
			if(req.getParameter("nowPage")==null){
				paging.setNowPage(1);	
			}else {
				paging.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
			}
			
			List<FestivalDto> list = festivalService.ftList(paging);
			
			 for (int i = 0; i < list.size(); i++) {
			      FestivalDto imgdto = list.get(i);
			      int pseq = imgdto.getSeq();
			      double score = imgdto.getScore();
			      int scoreCnt = festivalService.scoreCnt(pseq);
			      
			      score = score/scoreCnt;
			      score = HotelUtil.xxx(score);
			      
			      imgdto.setScore(score);
			   }
			
			
			model.addAttribute("paging", paging);
			model.addAttribute("list", list);	
		 
		
		return "seachFestival.tiles";
	}
	
	
	
	@RequestMapping(value="festivalSeach1.do", method={RequestMethod.GET, RequestMethod.POST})
	public String festivalSeach1(Model model , pagingBean paging,HttpServletRequest req,
					String findWord , String choice , int pseq) {		
	System.out.println("ReviewControllerFestivalSeach@@");
		
		List<FestivalDto> slist = festivalService.sfestival();
		
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd");
		 Date currentTime = new Date ();
		 String mTime = mSimpleDateFormat.format ( currentTime );
		 mTime = mTime.substring(0,10); //mTime은 현재날짜
		 int nowDate = Integer.parseInt(mTime.replace("-",""));
		 System.out.println("제발좀 pseq = "+pseq);
		 for (int i = 0; i < slist.size(); i++) {
				FestivalDto sdto = slist.get(i);
				sdto.geteDate();
			    String edate = sdto.geteDate().substring(0, 10);
	
			    int eDate = Integer.parseInt(edate.replace("-",""));
			
			    if(nowDate>eDate) {
			    	//업데이트 구문
			    	int eseq = sdto.getSeq();
			    	boolean isS = festivalService.edateUpdate(eseq);
			    }
			    
			}
		 
		 if(paging.getFindWord()==null) {
				paging.setFindWord("");
			}else {
				paging.setFindWord(findWord.trim());
			}
			
			if(paging.getChoice()==null) {
				paging.setChoice("");
			}else {
				paging.setChoice(choice.trim());
			}
			
			if(req.getParameter("nowPage")==null){
				paging.setNowPage(1);	
			}else {
				paging.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
			}
		
			List<FestivalDto> list = festivalService.ftList(paging);
			
			   
			   for (int i = 0; i < list.size(); i++) {
			      FestivalDto imgdto = list.get(i);
			       pseq = imgdto.getSeq();
			      double score = imgdto.getScore();
			      int scoreCnt = festivalService.scoreCnt(pseq);
			      
			      score = score/scoreCnt;
			      score = HotelUtil.xxx(score);
			      imgdto.setScore(score);
			      
			   }
			   
			
			System.out.println("@@@??@@@+"+pseq);
			model.addAttribute("paging", paging);
			model.addAttribute("list", list);	
			model.addAttribute("pseq", pseq);
		 
		
		return "festivalSeach1.tiles";
	}
	  @RequestMapping(value="seachFestivalUp.do", method={RequestMethod.GET,RequestMethod.POST})	  
	  public String seachFestivalUp(int seq,Model
			  						model,HttpServletResponse resp,int pseq) {
	  System.out.println("seachFestivalUpController seq="+seq );
	  System.out.println("seachFestivalUpController pseq="+pseq );
	  FestivalDto dto = reviewService.seachFestival(seq);
	  List<PdsDto> list = reviewService.reviewDetail(pseq);
	  ReviewDto revdto = reviewService.reviewUpList(pseq);
	  
	  model.addAttribute("seq", seq);
	  model.addAttribute("revdto", revdto);
	  model.addAttribute("dto",dto);
	  model.addAttribute("list", list);
	  model.addAttribute("pseq", pseq);
	  System.out.println("--@@--@@--@@list.size"+list.size());
		/*
		 * resp.setContentType("text/html; charset=UTF-8"); PrintWriter out; try {
		 * out=resp.getWriter();
		 * out.println("<script>"+"window.opener.document.location.reload()"+"</script>"
		 * ); out.println("<script>"+"self.close()"+"</script>"); out.flush(); }catch
		 * (IOException e){ e.printStackTrace(); }
		 */
	  
	  return "reviewUpdate.tiles";
	  
	  
	  }
	
	
	  @RequestMapping(value="seachFestival.do", method={RequestMethod.GET,RequestMethod.POST})	  
	  public String seachFestival(int seq,Model
			  						model,HttpServletResponse resp,int pseq) {
	  
	  FestivalDto dto = reviewService.seachFestival(seq);
	//  List<PdsDto> list = reviewService.reviewDetail(pseq);
	  model.addAttribute("dto",dto);
	//  model.addAttribute("list", list);
	//  System.out.println("--@@--@@--@@list.size"+list.size());
	  
		/*
		 * resp.setContentType("text/html; charset=UTF-8"); PrintWriter out; try {
		 * out=resp.getWriter();
		 * out.println("<script>"+"window.opener.document.location.reload()"+"</script>"
		 * ); out.println("<script>"+"self.close()"+"</script>"); out.flush(); }catch
		 * (IOException e){ e.printStackTrace(); }
		 */
	  
	  return "reivewWriteAf.tiles";	  
	  }
	  @RequestMapping(value="seachFestival1.do", method={RequestMethod.GET,RequestMethod.POST})	  
	  public String seachFestival1(int seq,Model
			  						model,HttpServletResponse resp/*int pseq*/) {
	  
	  FestivalDto dto = reviewService.seachFestival(seq);
	  /*List<PdsDto> list = reviewService.reviewDetail(pseq);*/
	  model.addAttribute("dto",dto);
		/* model.addAttribute("list", list); */
		/* System.out.println("--@@--@@--@@list.size"+list.size()); */
	  
		/*
		 * resp.setContentType("text/html; charset=UTF-8"); PrintWriter out; try {
		 * out=resp.getWriter();
		 * out.println("<script>"+"window.opener.document.location.reload()"+"</script>"
		 * ); out.println("<script>"+"self.close()"+"</script>"); out.flush(); }catch
		 * (IOException e){ e.printStackTrace(); }
		 */
	  
	  return "reivewWriteAf.tiles";	  
	  }
	  
	  
	  
	  @RequestMapping(value="reviewDetail.do", method={RequestMethod.GET,RequestMethod.POST})	  
	  public String reviewDetail(int seq , Model model , HttpServletRequest req) {
		  System.out.println("reviewDetail Controller@@@ seq : "+seq);
		  int pseq = seq;
		/* System.out.println(dto.toString()); */
		  
		  //디테일 본문글
		  List<PdsDto> list = reviewService.reviewDetail(pseq);
		  //팜플렛 다운로드용 pdsdto
		  
		  System.out.println("reviewDetail Answer start");

		  
		  //업데이트 다녀오고 디테일 들어가면 null값떠서 다시 리스트를 불러옴
		ReviewDto dto = reviewService.ReviewDetailList(pseq); 
		
		  
		List<PdsDto> list1 = festivalService.pdsDetail(dto.getPseq());
		  //ㅂㅂㅂㅂ  여기부터 리플 시작
		  pagingBean paging = new pagingBean();
		  if(req.getParameter("nowPage")==null){
			  paging.setNowPage(1);	
		  }else {
			  paging.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
		  }
		  paging.setSeq(pseq);
		  List<ReplyDto> rlist = reviewService.reivewReply(paging);
		  
		  
		  model.addAttribute("pdslist", list);
		  model.addAttribute("revdto", dto);
		  model.addAttribute("rlist", rlist);
		  model.addAttribute("paging", paging);
		  model.addAttribute("list1", list1);
		  
		  System.out.println("reviewDetail Controller success");
		  return "reviewDetail.tiles";
	  }
	  
	  
	  
	  @RequestMapping(value="reviewDel.do", method={RequestMethod.GET,RequestMethod.POST})	  
	  public String reviewDel(int seq) {
		  System.out.println("reviewDelController@@ seq = "+seq);
		  
		  boolean isS = reviewService.reviewDel(seq);
		  if(isS) {
			  System.out.println("reviewDel success");
		  }else {
			  System.out.println("reviewdel error!!!!!!!!!!");
		  }
		  return "redirect:/reviewList.do";
	  }
	  @RequestMapping(value="reviewReplyInsert.do", method={RequestMethod.GET,RequestMethod.POST})
	  public String reviewReplyInsert(ReplyDto dto) {
		  System.out.println("reviewReplyInsertcontroller@@");
		  boolean isS = reviewService.reviewReplyInsert(dto);
		  if(isS) {
			  System.out.println("reviewReplyInsert success");
		  }else {
			  System.out.println("reviewReplyInsert error!!!!");
		  }
		  return "redirect:/reviewDetail.do?seq="+dto.getPseq();
	  }
    
	  
	  
	  @RequestMapping(value="ReivewreplyUpdate.do", method={RequestMethod.GET,RequestMethod.POST})
      public String ReivewreplyUpdate(ReplyDto dto) {
    	  	  
		  System.out.println("reivewReplyUpdateController@@ : "+dto.toString());
		  
		  boolean isS = reviewService.ReivewreplyUpdate(dto);
		  if(isS) {
			  System.out.println("ReivewreplyUpdatecontroller Success");
		  }else {
			  System.out.println("ReivewreplyUpdatecontroller error!!!!");
			  
		  }
    	  return "redirect:/reviewDetail.do?seq="+dto.getPseq();
    	  
      }
      @RequestMapping(value="ReviewanswerDel.do", method={RequestMethod.GET,RequestMethod.POST})  
      public String ReviewanswerDel(ReplyDto dto) {
    	    System.out.println("ReviewanswerDel Contrller@@");
    	  boolean isS=reviewService.ReviewanswerDel(dto);
		  if(isS) {
			  System.out.println("ReviewanswerDel Contrller Success");
		  }else {
			  System.out.println("ReviewanswerDel Contrller error!!!!");
			  
		  }
    	  
    	  return "redirect:/reviewDetail.do?seq="+dto.getPseq();
      }
      @RequestMapping(value="reviewAnswerWrite.do", method={RequestMethod.GET,RequestMethod.POST})
      public String reviewAnswerWrite(ReplyDto dto) {
    	  System.out.println("reviewAnswerWriteController@@");
    	  
    	  boolean isS = reviewService.reviewAnswerWrite(dto);
    	  if(isS) {
    		  System.out.println("reviewAnswerWriteContrller Success");
    	  }else {
    		  System.out.println("reviewAnswerWriteContrller error!!!!!!");
    	  }
    	  return "redirect:/reviewDetail.do?seq="+dto.getPseq();
      }
      @RequestMapping(value="reviewUpdate.do", method={RequestMethod.GET,RequestMethod.POST})
      public String reviewUpdate(int seq , Model model) {
    	  System.out.println("reviewUpdateController @@ seq = "+seq);
    	  int pseq = seq;
    	  
    	  List<PdsDto> list = reviewService.reviewDetail(pseq);
    	  ReviewDto revdto = reviewService.reviewUpList(pseq);
    	  pseq = revdto.getPseq();
    	  
    	  FestivalDto dto =reviewService.festivalDetailView(pseq);
    	  
    	  System.out.println("reviewUpdateController success");
    	  System.out.println("2");
    	  System.out.println("@@"+dto.toString());
    	  System.out.println("1");
    	  model.addAttribute("list", list);
    	  model.addAttribute("revdto", revdto);
    	  model.addAttribute("pseq", pseq);
    	  model.addAttribute("dto", dto);
    	  return "reviewUpdate.tiles";
      }
       @RequestMapping(value="reviewUpdateAf.do", method={RequestMethod.GET,RequestMethod.POST})
      public String reviewUpdateAf(String pcontent[] , String title, int seq[] , int pseq,String content[], double score,int fseq,
    		  						@RequestParam(value="file_", required=false)MultipartFile file_[],
    		  						@RequestParam(value="reviewFile", required=false)MultipartFile reviewFile[],
    		  						HttpServletRequest req,MultipartHttpServletRequest mtfreq) {
    	   
    	   
    	   System.out.println("reviewUpdateAfController");
    	   //PDS수정부터
    	   String fupload = req.getSession().getServletContext().getRealPath("/upload");
    	   PdsDto pdto = new PdsDto();
    	   System.out.println("파일경로 : "+fupload);
    	   
    	   //파일수정을 눌렀을 시 파일업로드랑 동시에 pds에 fileName을 Update한다
    	   for (int i = 0; i < pcontent.length; i++) {
    		   MultipartFile mt = file_[i];
    		   String nullcheck= mt.getOriginalFilename();
    		   System.out.println("pcontent"+pcontent[i]);
    		   System.out.println("nullcheck"+nullcheck);
    		   if((pcontent[i]!=null||!pcontent[i].equals(""))&&!nullcheck.equals("")) {
    			   
				  System.out.println("----fileNameBf----");
				  System.out.println(mt.getOriginalFilename()); 
				  
				  String fileName_Bf = mt.getOriginalFilename();
				  pdto.setFileName_Bf(fileName_Bf);
				  
				  String f = pdto.getFileName_Bf();
				  String fileName_Af = FUpUtil.getNewFile(f);
				  pdto.setFileName_Af(fileName_Af);
				  
				  pdto.setSeq(seq[i]);
				  pdto.setContent(pcontent[i]);
				  
				  File file = new File(fupload+"/"+fileName_Af);		  
				
					try {
						FileUtils.writeByteArrayToFile(file, mt.getBytes());
						boolean isS = reviewService.reviewUpdateAf(pdto);
						if(isS) {
							System.out.println("reviewUpdateAfController success");
						}else {
							System.out.println("reviewUpdateAfController error!!");
						}
					} catch (IOException e) {

						e.printStackTrace();
					}				
			}else if((pcontent[i]!=null||!pcontent[i].equals(""))&&nullcheck.equals("")) {
				pdto.setContent(pcontent[i]);
				pdto.setSeq(seq[i]);
				
				boolean isS = reviewService.reviewUpdateAfcontent(pdto);
				if(isS) {
					System.out.println("reviewUpdateAfcontentController success");
				}else {
					System.out.println("reviewUpdateAfcontentController error!!");
				}
				
			}
    		   
    		   if((pcontent[i]==null||pcontent[i].equals(""))&&nullcheck.equals("")) {
				boolean isS = reviewService.reviewUpdateAfdelete(seq[i]);
				
				if(isS) {
					System.out.println("reviewUpdateAfdeleteController success");
				}else {
					System.out.println("reviewUpdateAfdeleteController error!!");
				}
			}

    	 }
    	   
    	   //추가글임
    	   for (int j = 0; j < content.length; j++) {
			if(content[j]==null||content[j].equals("")) {
				continue;
			}
			System.out.println("@@@@@");
			  MultipartFile mt = reviewFile[j];
			  System.out.println("----@@fileNameBf@@----");
			  System.out.println(mt.getOriginalFilename()); 
			  
			  String fileName_Bf = mt.getOriginalFilename();
			  pdto.setFileName_Bf(fileName_Bf);
			  
			  String f = pdto.getFileName_Bf();
			  String fileName_Af = FUpUtil.getNewFile(f);
			  pdto.setFileName_Af(fileName_Af);
			  
			  pdto.setContent(content[j]);		  
			  File file = new File(fupload+"/"+fileName_Af);		
			
			  pdto.setPseq(pseq);
			
			  try {
				FileUtils.writeByteArrayToFile(file, mt.getBytes());
				boolean isS = reviewService.reviewUpdateAfInsert(pdto);
				System.out.println("다녀왔니 ? "+isS);
			} catch (IOException e) {
				e.printStackTrace();
			}
			   pseq = pseq;
		}
    	   
    	   ReviewDto dto = new ReviewDto();
    	   dto.setTitle(title);
    	   dto.setScore(score);
    	   dto.setSeq(pseq);
    	   dto.setPseq(fseq);
    	   System.out.println("^^^^^^^^^^"+fseq);
    	   boolean isS = reviewService.reviewUpdate(dto);
    	   
    	   return "redirect:/reviewDetail.do?seq="+pseq;
    }
       
  
}















