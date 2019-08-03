package lala.com.a.Festival;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import lala.com.a.model.FestivalDto;
import lala.com.a.model.HotelDto;
import lala.com.a.model.MemberDto;
import lala.com.a.model.PdsDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.util.FUpUtil;
import lala.com.a.util.HotelUtil;
import lala.com.a.util.pagingBean;


@Controller
public class FestivalController {
   
   @Autowired
   FestivalService festivalService;
   
   
   @RequestMapping(value="festivalList.do", method={RequestMethod.GET, RequestMethod.POST})
   public String festivalList(Model model,pagingBean paging,HttpServletRequest req,
                        String findWord , String choice) {      
   System.out.println("festivalList Controller 도착@@");

   List<FestivalDto> slist = festivalService.sfestival();
   
   SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd");
    Date currentTime = new Date ();
    String mTime = mSimpleDateFormat.format ( currentTime );
    mTime = mTime.substring(0,10); //mTime은 현재날짜
    int nowDate = Integer.parseInt(mTime.replace("-",""));
   System.out.println("nowDate : "+nowDate);
   
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
   
   
   System.out.println("festival getFindWord : "+paging.getFindWord());
   System.out.println("festival getChoice : "+paging.getChoice());
      /* pagingseach */
   if(req.getParameter("nowPage")==null){
      paging.setNowPage(1);   
   }else {
      paging.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
   }
   //ㅈㅈㅈㅈ
   List<FestivalDto> list = festivalService.ftList(paging);
   
   for (int i = 0; i < list.size(); i++) {
      FestivalDto imgdto = list.get(i);
      int pseq = imgdto.getSeq();
      double score = imgdto.getScore();
      double scoreCnt = festivalService.scoreCnt(pseq);
      
      score = score/scoreCnt;

    score = HotelUtil.xxx(score);
      imgdto.setScore(score);

    		  

   }
   
   
   
   model.addAttribute("paging", paging);
   model.addAttribute("list", list);   
       System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"); 
   return "festivalList.tiles";
}
   
   
   @RequestMapping(value="FestivalWrite.do", method={RequestMethod.GET, RequestMethod.POST})
   public String FestivalWrite(HttpServletRequest req) {
      System.out.println("FestivalWrite.do 도착@@");
      MemberDto login = (MemberDto)req.getSession().getAttribute("login");
      String msg = "접근권한이 없는 페이지입니다";
      if(login == null ) {
         return "redirect:/mainpage.do?msg="+msg;
      }
      return "FestivalWrite.tiles";
   }
   
   
   
   
   
   
   @RequestMapping(value="FestivalWriteAf.do", method={RequestMethod.GET, RequestMethod.POST})
   public String FestivalWriteAf( FestivalDto fdto, 
                          @RequestParam(value="thumbfile", required=false)MultipartFile thumbfile,
                          @RequestParam(value="pamphlet", required=false)MultipartFile pamphlet,
                          @RequestParam(value="img_multi", required=false)MultipartFile img_multi[],
                                       HttpServletRequest req,MultipartHttpServletRequest mtfreq) {
      //System.out.println("Controller FestivalWriteAf@@@");
      MemberDto login = (MemberDto)req.getSession().getAttribute("login");
      String msg = "접근권한이 없는 페이지입니다";
      if(login == null ) {
         return "redirect:/mainpage.do?msg="+msg;
      }
      System.out.println("-----fileNameBF-----");
      System.out.println(thumbfile.getOriginalFilename());   
      System.out.println(pamphlet.getOriginalFilename());
      String fupload = req.getSession().getServletContext().getRealPath("/upload"); //파일 경로(tomcat)
      for (MultipartFile mt : img_multi) {
         System.out.println(mt.getOriginalFilename());
      }
      System.out.println("-------------------");      
      System.out.println("경로 확인" + fupload);
      PdsDto pdto = new PdsDto();
      
      //썸네일 name
      String thumbnail = thumbfile.getOriginalFilename();
      fdto.setThumbnail(thumbnail);
      
      //팜플랫(pdsdto) name
      String fileName_Bf = pamphlet.getOriginalFilename();
      pdto.setFileName_Bf(fileName_Bf);
      
      String f = pdto.getFileName_Bf();
      String fileName_Af = FUpUtil.getNewFile(f);
      pdto.setFileName_Af(fileName_Af);
      
      // 팜플렛 저장준비
      File file1 = new File(fupload+"/"+fileName_Af);
      //썸네일 저장준비 
      File file = new File(fupload+"/"+thumbnail);
      
      // 팜플렛 , 썸네일 업로드
      try {
         //업로드
         FileUtils.writeByteArrayToFile(file1, pamphlet.getBytes());
         FileUtils.writeByteArrayToFile(file, thumbfile.getBytes());
         
         // db저장
         //썸네일 AND 페스티벌 자료 insert
      //   System.out.println("Controller FestivalWriteAf에서 festival dto들어간 값 확인" + fdto.toString());
         boolean isS = festivalService.ftUpload(fdto); 
         //팜플렛
         System.out.println("팜플렛 들어가는거");
         boolean pisS = festivalService.pamFileUpload(pdto);
         System.out.println("팜플렛 나오는거");
         if(isS=true) {
            System.out.println("festival upload success!");
         }else {
            System.out.println("festival upload error!!");
         }
         
         if(pisS) {
            System.out.println("Pamplet upload success!");
         }else {
            System.out.println("Pamplet upload error!!");
         }
         
         
      } catch (IOException e) {
         e.printStackTrace();
      }
      
         //multifile Uplaod
      for (MultipartFile mt : img_multi) {
         int count = 0;
         count++;
         System.out.println(mt.getOriginalFilename());
         //FileNameBf
         fileName_Bf = mt.getOriginalFilename();
         pdto.setFileName_Bf(fileName_Bf);
         
         //FileNameAf
         f = pdto.getFileName_Bf();
         fileName_Af = FUpUtil.getNewFile(f);
         pdto.setFileName_Af(fileName_Af);      
         
         //저장준비         
         File file2 = new File(fupload+"/"+fileName_Af);
         //Pds 저장
         try {      
            //파일 업로드
            FileUtils.writeByteArrayToFile(file2, mt.getBytes());                     
            // MultiFile DB
            boolean misS = festivalService.multiFileUpload(pdto); 
            if(misS=true) {
               System.out.println(count + ":pds upload success!");
            }else {
               System.out.println(count +" :pds upload error!!");
            }
            
         } catch (IOException e) {
            e.printStackTrace();
         }
         
         
         
         
      }
      
      
      System.out.println("----fileUpload------");
      System.out.println(fupload + "/" + thumbnail);
      System.out.println(fupload + "/" + fileName_Af);
      for (MultipartFile mt : img_multi) {
      System.out.println(fupload+"/"+fileName_Bf);
      }
      System.out.println("------------------------");
      
      return "redirect:/festivalList.do";
   }
   
   
   
   @RequestMapping(value="festivalDetail.do", method={RequestMethod.GET, RequestMethod.POST})
   public String festivalDetail(int seq , Model model , pagingBean paging,
                           HttpServletRequest req) {
      System.out.println("festivalDetail Controller도착?seq="+seq);
      
      //festival List
      FestivalDto dto =  festivalService.ftDetail(seq);
      //pds List
      List<PdsDto> list = festivalService.pdsDetail(seq);
      System.out.println("리플후에 확인하는 피디에스 리스트");
      int scoreCnt = festivalService.scoreCnt(seq);
      double score = dto.getScore();
      score = score/scoreCnt;
      dto.setScore(score);
      
      model.addAttribute("dto", dto);
      model.addAttribute("list", list);
      //replyList
      
      List<ReplyDto> rList = festivalService.festivalReplyList(paging);
      System.out.println("리플후에 확인하는 리플 리스트1");
      if(req.getParameter("nowPage")==null){
         paging.setNowPage(1);   
      }else {
         paging.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
      }
      
      //호텔 정보 가져오기
      List<HotelDto> hList = festivalService.HotelJoinFestival(dto.getPlace());
      System.out.println("hotelList success hList : "+hList.size());
      /* System.out.println("@@@--@@"+hList.get(0).toString()+"@@@@--@@@@"); */
      
      model.addAttribute("hList", hList);
      model.addAttribute("rList", rList);
      model.addAttribute("paging",paging);
      for (int i = 0; i < hList.size(); i++) {         
         System.out.println("hotelJoinFestivalController thumbnail : "+hList.get(i).toString());   
      }
      System.out.println("#");
      return "festivalDetail.tiles";
   }
   @RequestMapping(value="PampletDown.do", method={RequestMethod.GET, RequestMethod.POST})
   public String PampletDown(String pampletBf,String pampletAf , int pampletSeq , Model model,
                       HttpServletRequest req) {
      System.out.println("pamplet downLoad Controller@@ :"+pampletBf+"다음"+pampletAf+"다음"+pampletSeq);
      
      //절대경로
      String fupload = req.getSession().getServletContext().getRealPath("/upload");
      File downloadFile = new File(fupload + "/" + pampletAf);
      
      model.addAttribute("downloadFile", downloadFile);
      model.addAttribute("pampletAf", pampletAf);
      model.addAttribute("pampletBf", pampletBf);
      model.addAttribute("pampletSeq", pampletSeq);      
      
      return "downloadView";
   }
   @RequestMapping(value="festivalDelete.do", method={RequestMethod.GET, RequestMethod.POST})   
   public String festivalDelete(int seq,HttpServletRequest req) {
      MemberDto login = (MemberDto)req.getSession().getAttribute("login");
      String msg = "접근권한이 없는 페이지입니다";
      if(login == null ) {
         return "redirect:/mainpage.do?msg="+msg;
      }
      System.out.println("fetivalDelete Controller @@ seq="+seq);
      boolean isS = festivalService.festivalDelete(seq);
      if(isS) {
      return "redirect:/festivalList.do";
      }else {
      System.out.println("파일 업로드 실패");
      return "redirect:/festivalList.do";
      }
   }
   @RequestMapping(value="festivalUpdate.do", method={RequestMethod.GET, RequestMethod.POST})
   public String festivalUpdate(int seq,Model model ,HttpServletRequest req) {
      System.out.println("festivalUpdate Contorller @@seq = "+seq);
      MemberDto login = (MemberDto)req.getSession().getAttribute("login");
      String msg = "접근권한이 없는 페이지입니다";
      if(login == null ) {
         return "redirect:/mainpage.do?msg="+msg;
      }
      FestivalDto dto = festivalService.festivalUpdate(seq);
      FestivalDto dto1 = festivalService.festivalUpdate(seq);
      List<PdsDto> list = festivalService.pdsUpdate(seq);
      List<PdsDto> list1= festivalService.pdsUpdate(seq);
      
      model.addAttribute("dto", dto);
      model.addAttribute("list", list);//찾아온 파일 네임
      model.addAttribute("dto1", dto1);//취소 누를때 다시 복구할 썸네일
      model.addAttribute("list1", list1);//취소 누를때 다시 복구할 파일네임
      return "festivalUpdate.tiles";
   }
   @RequestMapping(value="FestivalUpdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
   public String FestivalUpdateAf(FestivalDto fdto , int seq , int pampletSeq , int multi_seq [],   
                           String ThumbnailBf , String pampletBf , String img_multi_Bf[],
           @RequestParam(value="thumbfile", required=false)MultipartFile thumbfile,
           @RequestParam(value="pamplet", required=false)MultipartFile pamplet,
           @RequestParam(value="img_multi", required=false)MultipartFile img_multi[],
                        HttpServletRequest req,MultipartHttpServletRequest mtfreq) {
      MemberDto login = (MemberDto)req.getSession().getAttribute("login");
      String msg = "접근권한이 없는 페이지입니다";
      if(login == null ) {
         return "redirect:/mainpage.do?msg="+msg;
      }
      System.out.println("festivalUpdateAf Controller@@");
      System.out.println("festivalUpdateAf Controller seq : "+ seq);
      System.out.println("festivalUpdateAf Controller pampletSeq : "+ pampletSeq);
      //System.out.println("festivalUpdateAf Controller multi_seq [] : "+ multi_seq.length);
      System.out.println("festivalUpdateAf Controller ThumbnailBf : "+ ThumbnailBf);
      System.out.println("festivalUpdateAf Controller pampletBf : "+ pampletBf);
      System.out.println("festivalUpdateAf img_multi_Bf seq : "+ img_multi_Bf);
      System.out.println("0.1");
      pampletBf =  pampletBf.trim();
      System.out.println("00");
      PdsDto pdto = new PdsDto();
      //톰켓 서버 파일 경로 취득
      String fupload = req.getSession().getServletContext().getRealPath("/upload");
      System.out.println("11");
      //썸네일 OriginalFilename취득
      fdto.setThumbnail(thumbfile.getOriginalFilename());      
      System.out.println("22");
      //수정된 파일이 있을때
      System.out.println("33");
      if(fdto.getThumbnail() != null && !fdto.getThumbnail().equals("")) {
      String getThumbnail1 = fdto.getThumbnail();
      System.out.println("44");
      //썸네일 파일 업로드 준비
      File file = new File(fupload+"/"+getThumbnail1);
      System.out.println("55");
      try {
         FileUtils.writeByteArrayToFile(file, thumbfile.getBytes());         
         System.out.println("66");
         //썸네일 db갱신
         fdto.setSeq(seq); //sql에서 parameter type 하나밖에 안되기때문에 걍 dto로 보낼꺼임
         System.out.println("77");
         boolean isS = festivalService.thumbnailUpdate(fdto);
         System.out.println("88");
         if(isS) {
            System.out.println("thumbnailUpdate success");
         }else {
            System.out.println("thumbnailUpdate error");
         }
      } catch (IOException e) {
         System.out.println("thumbnail fileUpdate 실패");
         e.printStackTrace();
      }
   }else {
      //fdto.setThumbnail(ThumbnailBf);
   }      
      System.out.println("썸네일 안올리고 넘어가나 확인");
      
      
      
      //팜플랫 OriginalFilename취득
      pdto.setFileName_Bf(pamplet.getOriginalFilename().trim());
      //팜플렛 수정파일이 있을때
      if(pdto.getFileName_Bf() !=null && !pdto.getFileName_Bf().equals("")) {
         System.out.println("pdto.getFileName_Bf()@@@[="+pdto.getFileName_Bf());
         String f = pdto.getFileName_Bf();
         String newfile = FUpUtil.getNewFile(f);
         //fileNameAf dto에 넣기
         pdto.setFileName_Af(newfile);         
         //팜플렛 파일 업로드 준비
         File file1 = new File(fupload+"/"+newfile);
         try {
            FileUtils.writeByteArrayToFile(file1, pamplet.getBytes());
            
            //Db갱신
            pdto.setSeq(pampletSeq);
            boolean isS1 = festivalService.pampletUpdate(pdto);
            if(isS1) {
               System.out.println("pamplet FileUpdate success");
            }else {
               System.out.println("pamplet FileUpdate error!");
            }
            
         } catch (IOException e) {
            System.out.println("pamplet fileUpdate 실패");
            e.printStackTrace();
         }
      }
      
      //multifile
      
      for (MultipartFile mt: img_multi) {
         int count = 0;
         count++;
         System.out.println(mt.getOriginalFilename());
         //fileNameBf
         String fileName_Bf = mt.getOriginalFilename();
         pdto.setFileName_Bf(fileName_Bf);
         if(fileName_Bf==null||fileName_Bf=="") {
            continue;
         }
         //fileNameAf
         String f = pdto.getFileName_Bf();
         String fileName_Af = FUpUtil.getNewFile(f);
         pdto.setFileName_Af(fileName_Af);
         //set pseq
         pdto.setPseq(seq);
         
         //저장준비
         File file = new File(fupload+"/"+fileName_Af);
         try {
            FileUtils.writeByteArrayToFile(file, mt.getBytes());
            boolean isS = festivalService.multiFileUpdate(pdto);
            if(isS) {
               System.out.println("multiFileUpload success");
            }else {
               System.out.println("multiFileUpload error!!!");
            }
         } catch (IOException e) {
            e.printStackTrace();
         }                     
         
         
      }
      
       boolean isS4 = festivalService.festivalUpdateAf(fdto);
       if(isS4) {
          System.out.println("festivalUpdateAf Success"); 
      } else {
          System.out.println("festivalUpdateAf error!!"); 
      }

      return "redirect:/festivalDetail.do?seq="+seq;      
   }
   
   @ResponseBody
   @RequestMapping(value="detailDel.do", method={RequestMethod.GET, RequestMethod.POST})
   public String detailDel( int seq,HttpServletRequest req) {
      MemberDto login = (MemberDto)req.getSession().getAttribute("login");
      String msg = "접근권한이 없는 페이지입니다";
      if(login == null ) {
         return "redirect:/mainpage.do?msg="+msg;
      }
      System.out.println("festivaldetailDel Controller@@seq="+seq);
      boolean isS = festivalService.detailDel(seq);
      if(isS) {
         return "isS";
      }else {
         return "error";
      }
   }      
   @RequestMapping(value="endFetival.do", method={RequestMethod.GET, RequestMethod.POST})
   public String endFetival(Model model,pagingBean paging,HttpServletRequest req,
                     String findWord , String choice) {
      System.out.println("endFetival Controller 도착@@");
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
      
      
      System.out.println("festival getFindWord : "+paging.getFindWord());
      System.out.println("festival getChoice : "+paging.getChoice());

      if(req.getParameter("nowPage")==null){
         paging.setNowPage(1);   
      }else {
         paging.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
      }
      
      List<FestivalDto> list = festivalService.endFtList(paging);
      
      for (int i = 0; i < list.size(); i++) {
         FestivalDto imgdto = list.get(i);
         int pseq = imgdto.getSeq();
         double score = imgdto.getScore();
         int scoreCnt = festivalService.scoreCnt(pseq);
         
         score = score/scoreCnt;
         imgdto.setScore(score);
      }
      
      
      
      model.addAttribute("paging", paging);
      model.addAttribute("list", list);    
      return "endFestivalList.tiles";
   }
      
   //이제부터 댓글
   @RequestMapping(value="festivalReplyInsert.do", method={RequestMethod.GET, RequestMethod.POST})
   public String  festivalReplyInsert(ReplyDto dto,HttpServletRequest req) {
      MemberDto login = (MemberDto)req.getSession().getAttribute("login");
      String msg = "접근권한이 없는 페이지입니다";
      if(login == null ) {
         return "redirect:/mainpage.do?msg="+msg;
      }
      System.out.println("festivalReplyInsert countroller@@");
      int pseq = dto.getPseq();
      boolean isS = festivalService.festivalReplyInsert(dto);
      if(isS) {
         System.out.println("댓글 입력 성공");
      }else {
         System.out.println("댓글 입력 실패");
      }
      return "redirect:/festivalDetail.do?seq="+pseq;
   }
   
   @RequestMapping(value="replyUpdate.do", method={RequestMethod.GET, RequestMethod.POST})
   public String replyUpdate(ReplyDto dto,HttpServletRequest req){
      MemberDto login = (MemberDto)req.getSession().getAttribute("login");
      String msg = "접근권한이 없는 페이지입니다";
      if(login == null ) {
         return "redirect:/mainpage.do?msg="+msg;
      }
      System.out.println("replyUpdate controller :"+dto.toString());
      boolean isS = festivalService.replyUpdate(dto);
      if(isS) {
         System.out.println("댓글 수정 성공");
      }else {
         System.out.println("댓글 수정 실패");
      }
      return "redirect:/festivalDetail.do?seq="+dto.getPseq();      
   }
   
   @RequestMapping(value="answerWrite.do", method={RequestMethod.GET, RequestMethod.POST})
   public String answerWrite(ReplyDto dto,HttpServletRequest req){
      MemberDto login = (MemberDto)req.getSession().getAttribute("login");
      String msg = "접근권한이 없는 페이지입니다";
      if(login == null ) {
         return "redirect:/mainpage.do?msg="+msg;
      }
      System.out.println("fetival answerWrite :"+dto.toString());
      boolean isS = festivalService.festivalAnswer(dto);   
      if(isS) {
         System.out.println("답글 입력 성공");
      }else {
         System.out.println("답글 입력 실패");
      }
      return "redirect:/festivalDetail.do?seq="+dto.getPseq();   
   
   }
   
   @RequestMapping(value="answerDel.do", method={RequestMethod.GET, RequestMethod.POST})
   public String answerDel(ReplyDto dto,HttpServletRequest req) {
      MemberDto login = (MemberDto)req.getSession().getAttribute("login");
      String msg = "접근권한이 없는 페이지입니다";
      if(login == null ) {
         return "redirect:/mainpage.do?msg="+msg;
      }
       System.out.println("festivalAnswerdel controller :"+dto.toString()); 
      boolean isS = festivalService.replydel(dto);
      if(isS) {
         System.out.println("글삭제 성공");
      }else {
         System.out.println("글삭제 실패");
      }
      return "redirect:/festivalDetail.do?seq="+dto.getPseq();
   }
}





















