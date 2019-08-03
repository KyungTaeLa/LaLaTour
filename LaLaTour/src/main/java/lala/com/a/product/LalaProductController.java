package lala.com.a.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lala.com.a.model.CartDto;
import lala.com.a.model.FestivalDto;
import lala.com.a.model.GoodsDto;
import lala.com.a.model.MemberDto;
import lala.com.a.model.OrderedDto;
import lala.com.a.model.ProductDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.util.FUpUtil;
import lala.com.a.util.pagingBean;

@Controller
public class LalaProductController {

	Logger logger = LoggerFactory.getLogger(LalaProductController.class);
	
	@Autowired
	LalaProductService lalaProductService;
	
	/*@RequestMapping(value="productlist.do", method=RequestMethod.GET)
	public String productlist(Model model) {
		logger.info("LalaProductController productlist " + new Date());
		
		List<ProductDto> list = lalaProductService.getProductList();
		model.addAttribute("list", list);
		
		return "productlist.tiles";
	}*/
	
	//제품전체목록
	@RequestMapping(value="productlist.do", method=RequestMethod.GET)
	public String productlist(PagingBean pagingBean, Model model) {
		logger.info("LalaProductController productlist " + new Date());
		
		System.out.println("dto: " + pagingBean.toString());
		//현재페이지가 노세팅이면 1로 세팅
		if(pagingBean.getNowPage()==0) {
			pagingBean.setNowPage(1);
		}
		
		//totalCount 세팅 (총갯수)
		pagingBean.setTotalCount( lalaProductService.getProductTotalCount(pagingBean) );
		pagingBean.setCountPerPage(12);
		pagingBean = PagingUtil.setPagingInfo(pagingBean);
		
		List<ProductDto> list = lalaProductService.getProductList(pagingBean);
		model.addAttribute("list", list);
		model.addAttribute("paging", pagingBean);
		
		return "productlist.tiles";
	}
	
	//제품 입력창
	@RequestMapping(value="productwrite.do", method=RequestMethod.GET)
	public String productwrite(HttpServletRequest req) {
		logger.info("LalaProductController productwrite " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("")) {	
			return "productwrite.tiles";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//제품 수정창
	@RequestMapping(value="productUpdate.do", method=RequestMethod.GET)
	public String productUpdate(int product_seq, Model model, HttpServletRequest req) {
		logger.info("LalaProductController productUpdate " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("")) {	
			ProductDto dto = lalaProductService.productDetail(product_seq);
			model.addAttribute("product", dto);
			System.out.println("dto: " + dto.toString());
			
			model.addAttribute("fName", dto.getFseq()==0? new FestivalDto():lalaProductService.getFestivalName(dto.getFseq()));
	
			List<FilePdsDto> flist = lalaProductService.getFileList(product_seq);
			model.addAttribute("fileList", flist);
			
			return "productupdate.tiles";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//축제목록 가져오기
	@ResponseBody
	@RequestMapping(value="getFestivalList.do", method=RequestMethod.GET)
	public Map<String, Object> getFestivalList(String s_keyword) {
		logger.info("LalaProductController getFestivalList " + new Date());
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<FestivalDto> flist = lalaProductService.getFestivalList(s_keyword);
		
		map.put("list", flist);
		
		return map;
	}
	
	//제품등록 실행
	@RequestMapping(value="productwriteaf.do", method=RequestMethod.POST)
	public String productwriteaf(
			ProductDto pdto, 
			FilePdsDto fdto,
			@RequestParam(value="filethumbnail",required=false)MultipartFile filethumbnail,
			@RequestParam(value="fileload",required=false)MultipartFile[] fileload,
			HttpServletRequest req) {
		logger.info("LalaProductController productwriteaf " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("") && login.getAuth()==1) {
		
			System.out.println("product dto: " + pdto.toString());
			
			pdto.setThumbNail(filethumbnail.getOriginalFilename());
			int pseq = lalaProductService.productWriteAf(pdto);
			
			//upload 경로 (톰캣)
			String fupload = req.getSession().getServletContext().getRealPath("/upload");
			File file = new File(fupload + "/" + filethumbnail.getOriginalFilename());
					
			try {
				FileUtils.writeByteArrayToFile(file, filethumbnail.getBytes());
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//나머지 다중파일들 업로드
			int i=0;
			for (MultipartFile mf : fileload) {
				System.out.println((++i) + "번째 파일 업로드");
				if(mf==null || mf.isEmpty()) {
					continue;
				}
				
				String filename = mf.getOriginalFilename();
				String newfilename = FUpUtil.getNewFile(filename);
				
				file = new File(fupload+"/"+newfilename);
				System.out.println("upload 파일경로: " + fupload+"/"+newfilename);
				
				//org.apache.commons.io.FileUtils
				//실질적으로 파일을 기입해주는 부분(물리적으로?)
				//FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				try {
					FileUtils.writeByteArrayToFile(file, mf.getBytes());
					
					//db에 저장
					//khPdsService.uploadPds(pdsdto);
					FilePdsDto dto = new FilePdsDto();
					dto.setFileNameBf(filename);
					dto.setFileNameAf(newfilename);
					dto.setPseq(pseq);
					dto.setTname("PRODUCT");
					lalaProductService.uploadFile(dto);
					//khPdsService.uploadFileMulti(dto);
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			/*
			//파일시스템
			//String fupload = "d:\\tmp";
			
			//파일명.xxx -> 1223123.xxx
			//String f = pdsdto.getFilename();
			//String f = fileload[i].getOriginalFilename();
			String newfilename = FUpUtil.getNewFile(filename[i]);
			
			File file = new File(fupload + "/" + newfilename);
			System.out.println("upload 파일경로: " + fupload + "/" + newfilename);
		
			try {
				//org.apache.commons.io.FileUtils
				//실질적으로 파일을 기입해주는 부분(물리적으로?)
				//FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				FileUtils.writeByteArrayToFile(file, fileload[i].getBytes());
				
				//db에 저장
				FilePdsDto dto = new FilePdsDto();
				dto.setFilenamebf(filename[i]);
				dto.setFilenameaf(newfilename);
				lalaProductService.uploadFile(dto);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
			
			return "redirect:/productlist.do";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//이거 안쓰는거 같음. 에러안나면 안쓰는거겠지..
	@RequestMapping(value="thumbNailDownload.do", method=RequestMethod.GET)
	public String thumbNailDownload(ProductDto dto, HttpServletRequest req, Model model) {
		logger.info("LalaProductController thumnNailDownload " + new Date());
		
		//download 경로 1,2
		//1.톰캣
		//D:\springSample\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\190428_SampleAll_homecalnono/upload
		String fupload = req.getSession().getServletContext().getRealPath("/upload");
		
		File downloadFile = new File(fupload + "/" + dto.getThumbNail());
		model.addAttribute("downloadFile", downloadFile);
		model.addAttribute("thumbNail", dto.getThumbNail());
		model.addAttribute("seq", dto.getProduct_seq());
		
		return "downloadView";
	}
	
	@RequestMapping(value="productdetail.do", method=RequestMethod.GET)
	/*public String productdetail(int product_seq, Model model, PagingBean pagingBean) {*/
	public String productdetail(String product_seq, Model model, PagingBean pagingBean) {
		logger.info("LalaProductController productdetail " + new Date());
		
		System.out.println("con productdetail start: " + product_seq);
		
		//현재페이지가 노세팅이면 1로 세팅
		if(pagingBean.getNowPage()==0) {
			pagingBean.setNowPage(1);
			//pagingBean.setCountPerPage(2);
		}
		
		int product_seq_int = Integer.parseInt(product_seq);
		pagingBean.setSearch_seq(product_seq_int);
		//totalCount 세팅 (총갯수)
		pagingBean.setTotalCount( lalaProductService.getGoodsTotalCount(pagingBean) );
		pagingBean.setCountPerPage(5);
		pagingBean = PagingUtil.setPagingInfo(pagingBean);
		
		System.out.println("111111세팅값: " + pagingBean.toString());
		
		ProductDto product = lalaProductService.productDetail(product_seq_int);
		List<FilePdsDto> fileList = lalaProductService.getFileList(product_seq_int);
		//List<ReplyDto> replyList = lalaProductService.getReplyList();
		//List<GoodsDto> goodsList = lalaProductService.getGoodsList(product_seq);
		List<GoodsDto> goodsList = lalaProductService.getGoodsPagingList(pagingBean);
		
		model.addAttribute("product", product);
		model.addAttribute("fileList", fileList);
		//model.addAttribute("replyList", replyList);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("paging", pagingBean);
		
		return "productdetail.tiles";
	}
	
	//장바구니 담기
	@RequestMapping(value="cartinsert.do", method=RequestMethod.POST)
	public String cartinsert(CartDto dto, String gopage, HttpServletRequest req) {
		logger.info("LalaProductController cartinsert " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("") && dto.getId().equals(login.getId())) {
			//장바구니에 있는지 확인
			CartDto cdto = lalaProductService.getProductSeq(dto);
			if(cdto==null) {
				System.out.println("있냐?: 널임");
			}
			else {
				System.out.println("있냐?: " + cdto.toString());
			}
			
			//없으면,
			if(cdto==null) {
				//장바구니에 담기
				boolean isS = lalaProductService.cartinsert(dto);
			}
			//있으면,
			else {
				//수량만 변경을 해줘야 한다. cdto에 기존정보가 담겨있다.
				//cdto에 mycount에 값을 수정해서 담고 변경하자. 귀찮다.
				cdto.setMyCount( cdto.getMyCount()+dto.getMyCount() );
				lalaProductService.updateMyCount(cdto);
			}
			
			if(gopage.equals("cart")) return "redirect:/cartlist.do?id="+dto.getId();
			else return "redirect:/productlist.do";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//장바구니 리스트
	@RequestMapping(value="cartlist.do", method=RequestMethod.GET)
	public String cartlist(CartDto dto, Model model, HttpServletRequest req) {
		logger.info("LalaProductController cartlist " + new Date());
		
		HttpSession session = req.getSession(false);
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("") && dto.getId().equals(login.getId())) {
		
			//1. 일단 리스트들 받아온다.
			List<CartDto> clist = lalaProductService.getCartList(login.getId());
			
			//2. 하나씩 보면서 재고와 장바구니 수량을 보고 장바구니가 많으면 재고로 맞춰서 수정해준다.
			for (CartDto cart : clist) {
				//장바구니수량이 재고수량보다 많으면
				if(cart.getMyCount() > cart.getPcount()) {
					//장바구니수량을 재고수량으로 놓고 수정하기
					cart.setMyCount( cart.getPcount() );
					lalaProductService.updateMyCount(dto);
					//이러면 아마 디비에는 수정이 되고, 모델에는 여기서 바뀐대로 들어가지 않을까?
				}
			}
			
			model.addAttribute("clist", clist);
			
			return "cartlist.tiles";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//주문물품 리스트
	@RequestMapping(value="orderedlist.do", method=RequestMethod.POST)
	//public String orderlist(CartDto[] dto) {
	public String orderedlist(int[] chk_order, int[] hcount, Model model, HttpServletRequest req) {
		logger.info("LalaProductController orderedlist " + new Date());
		
		HttpSession session = req.getSession(false);
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("")) {
		
			System.out.println("length: " + chk_order.length);
			
			List<CartDto> olist = new ArrayList<>();
			
			for(int i=0; i<chk_order.length; i++) {
				System.out.println("seq: " + chk_order[i] + ", count: " + hcount[i]);
				CartDto dto = new CartDto();
				dto.setCart_seq(chk_order[i]);
				dto.setMyCount(hcount[i]);
				
				System.out.println(i + ": " + dto.toString());
				
				lalaProductService.updateMyCount(dto);
				CartDto newdto = lalaProductService.getCart(chk_order[i]);
				olist.add(newdto);
			}
			
			model.addAttribute("olist", olist);
			
			return "orderedlist.tiles";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//이거 뭐하는 부분일까? 막아야될거 같긴한데 일단 보류
	@ResponseBody
	@RequestMapping(value="orderedinsert.do", method=RequestMethod.POST)
	public int orderedinsert(OrderedDto dto) {
		logger.info("LalaProductController orderedinsert " + new Date());
		
		System.out.println("after dto: " + dto.toString());
		
		//주문내역 저장 후 해당 seq 받아옴
		int ordered_seq = lalaProductService.orderedInsert(dto);
		
		return ordered_seq;
	}
	
	//주문결제히면 물품을 장바구니에서 주문내역으로 변경 (oseq 변경) seq장바구니물품의 oseq를 inseq로 변경?? 맞나?
	@RequestMapping(value="changecart.do", method=RequestMethod.POST)
	public String changecart(int inseq , String merchant_uid, String[] seq) {
		logger.info("LalaProductController changecart " + new Date());
		
		System.out.println("inseq: " + inseq);
		System.out.println("merchant_uid: " + merchant_uid);
		for (String cc : seq) {
			CartDto dto = new CartDto();
			int sseq = Integer.parseInt(cc);
			dto.setCart_seq(sseq);
			dto.setOseq(inseq);
			lalaProductService.updateCartOseq(dto);
			
			//////////////////////////////////////
			lalaProductService.updateProductPCount(sseq);
		}
		
		return "redirect:/productlist.do";
	}
	
	//제품수정
	@RequestMapping(value="productUpdateAf.do", method=RequestMethod.POST)
	public String productUpdateAf(
			ProductDto dto, int[] delseq,
			@RequestParam(value="filethumbnail",required=false)MultipartFile filethumbnail,
			@RequestParam(value="fileload",required=false)MultipartFile[] fileload,
			HttpServletRequest req) {
		logger.info("LalaProductController productUpdateAf " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("") && login.getAuth()==1) {
			System.out.println("/////////controller: " + filethumbnail.getOriginalFilename());
			
			System.out.println("333333333con puaf: " + dto.toString());
			
			System.out.println(dto.toString());
			if(delseq!=null) {
				for(int i=0; i<delseq.length; i++) {
					//System.out.println(i + ": " + delseq[i]);
					
					//1. 삭제한 파일들 지우기
					lalaProductService.deleteFile(delseq[i]);			
				}
			}
			
			String fupload = req.getSession().getServletContext().getRealPath("/upload");
			//서버에 파일업로드
			//2. 썸네일(바꼈을때 재업로드), 디비에 파일명 변경은 다음부분에서...
			if(!filethumbnail.isEmpty() && !filethumbnail.getOriginalFilename().equals("")) {
				dto.setThumbNail(filethumbnail.getOriginalFilename());
				System.out.println("inininininininin");
				//upload 경로 (톰캣)
				//String fupload = req.getServletContext().getRealPath("/upload");
				File file = new File(fupload + "/" + filethumbnail.getOriginalFilename());
						
				try {
					FileUtils.writeByteArrayToFile(file, filethumbnail.getBytes());
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			//서버에 파일업로드
			//3. 다중파일(새로 추가된 파일들), fildpds 테이블에 입력하면서 같이업로드
			File file = null;
			for (MultipartFile mf : fileload) {
				
				if(mf==null || mf.isEmpty()) {
					continue;
				}
				
				String filename = mf.getOriginalFilename();
				String newfilename = FUpUtil.getNewFile(filename);
				
				file = new File(fupload+"/"+newfilename);
				System.out.println("upload 파일경로: " + fupload+"/"+newfilename);
				
				//org.apache.commons.io.FileUtils
				try {
					FileUtils.writeByteArrayToFile(file, mf.getBytes());
					
					//db에 저장
					FilePdsDto fpdto = new FilePdsDto();
					fpdto.setPseq(dto.getProduct_seq());
					fpdto.setFileNameBf(filename);
					fpdto.setFileNameAf(newfilename);
					lalaProductService.uploadFile(fpdto);
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			//4. 내용들 수정하기
			//dto.setThumbNail(filethumbnail.getOriginalFilename());
			lalaProductService.productUpdateAf(dto);
			
			return "redirect:/productdetail.do?product_seq="+dto.getProduct_seq();
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//장바구니에서 물품 삭제
	@RequestMapping(value="cartDelete.do", method=RequestMethod.GET)
	public String cartDelete(int cart_seq, String id, HttpServletRequest req) {
		logger.info("LalaProductController productUpdateAf " + new Date());
		
		//String id = ((MemberDto)req.getSession(false).getAttribute("login")).getId();
		
		//System.out.println("id: " + id);
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		// 아이디랑 로긴이랑 같은지 체크는 나중에. 일단 바쁘다
		if(login!=null && !login.getId().equals("")) {
			lalaProductService.deleteCart(cart_seq);
			
			return "redirect:/cartlist.do?id="+login.getId();
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	@RequestMapping(value="insertReply.do", method=RequestMethod.POST)
	public String insertReply(ReplyDto dto) {
		logger.info("LalaProductController replyInsert " + new Date());
		
		System.out.println("c rdto: " + dto.toString());
		boolean isS = lalaProductService.insertReply(dto);
		
		return "redirect:/productdetail.do?product_seq="+dto.getPseq();
	}
	
	//과거주문내역 (상품평도 있음)
	@RequestMapping(value="sellList.do", method=RequestMethod.GET)
	public String sellList(HttpServletRequest req, Model model, PagingBean pagingBean ) {
		logger.info("LalaProductController replyInsert " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("")) {
			System.out.println("///////////login id: " + login.getId());
			//System.out.println("con login: " + login.toString());
			
			System.out.println("dto: " + pagingBean.toString());
			//현재페이지가 노세팅이면 1로 세팅
			if(pagingBean.getNowPage()==0) {
				pagingBean.setNowPage(1);
			}
			
			//totalCount 세팅 (총갯수)
			pagingBean.setTotalCount( lalaProductService.getSellListTotalCount(login.getId()) );
			pagingBean.setCountPerPage(6);
			pagingBean = PagingUtil.setPagingInfo(pagingBean);
			pagingBean.setId(login.getId());
			
			List<OrderedDto> selllist = lalaProductService.getSellList(pagingBean);
			//System.out.println("selllist dto[0]: " + selllist.get(0).toString());
			model.addAttribute("selllist", selllist);
			model.addAttribute("paging", pagingBean);
			
			return "selllist.tiles";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//과거주문내역 - 특정주문번호
	@RequestMapping(value="getOrderSList.do", method=RequestMethod.GET)
	public String getOrderSList(String omid, Model model, HttpServletRequest req) {
		logger.info("LalaProductController getOrderSList " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("")) {
		
			List<OrderedDto> oslist = lalaProductService.getOrderSList(omid);
			model.addAttribute("oslist", oslist);
			
			return "oslist.tiles";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//장바구니에서 물건지울때 선택한 물품들을 지움
	@RequestMapping(value="deleteCart.do", method=RequestMethod.POST)
	public String deleteCart(int[] chk_order, HttpServletRequest req) {
		logger.info("LalaProductController deleteCart " + new Date());
		
		String id = ((MemberDto)req.getSession(false).getAttribute("login")).getId();
		
		for (int cart_seq : chk_order) {
			lalaProductService.deleteCart(cart_seq);
		}
		
		return "redirect:/cartlist.do?id="+id;
	}
	
	//상품평 입력창으로 이동
	@RequestMapping(value="insertGoods.do", method=RequestMethod.GET)
	public String insertGoods(int cart_seq, int product_seq, Model model, HttpServletRequest req) {
		logger.info("LalaProductController insertGoods " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("")) {
			ProductDto dto = lalaProductService.productDetail(product_seq);
			model.addAttribute("product", dto);
			model.addAttribute("cart_seq", cart_seq);
			System.out.println("con insertgoods cartseq: " + cart_seq);
			return "insertgoods.tiles";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//상품평 입력작업 후 해당 제품페이지로 이동
	@RequestMapping(value="insertGoodsAf.do", method=RequestMethod.POST)
	public String insertGoodsAf(
			GoodsDto dto,
			@RequestParam(value="fileload",required=false)MultipartFile fileload,
			HttpServletRequest req) {
		logger.info("LalaProductController insertGoodsAf " + new Date());
		
		System.out.println("con iga: " + dto.toString());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("") && dto.getGid().equals(login.getId())) {
			//System.out.println("con iga dto: " + dto.toString());
			//상품평 입력하고 dto에 해당 seq를 등록
			dto.setPictures(fileload.getOriginalFilename());
			int goods_seq = lalaProductService.insertGoodsAf(dto);
			dto.setGoods_seq(goods_seq);
			
			System.out.println("업데잍트cartgseq전: " + dto.toString());
			lalaProductService.updateCartGseq(dto);
			
			//해당 상품평의 제품디테일을 불러와서 총점과 사람수 반영해서 제품정보 수정
			ProductDto pdto = lalaProductService.productDetail(dto.getGpseq());
			pdto.setPpoint( pdto.getPpoint() + dto.getGpoint() );
			pdto.setHcount( pdto.getHcount()+1 );
			
			lalaProductService.updateProductPH(pdto);
			
			//파일 시작
			//upload 경로 (톰캣)
			String fupload = req.getSession().getServletContext().getRealPath("/upload");
			
			File file = new File(fupload+"/"+fileload.getOriginalFilename());
			
			try {
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "redirect:/productdetail.do?product_seq="+dto.getGpseq();
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//상품평 수정창으로 이동
	@RequestMapping(value="updateGoods.do", method=RequestMethod.GET)
	public String updateGoods(int goods_seq, Model model, HttpServletRequest req) {
		logger.info("LalaProductController updateGoods " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		if(login!=null && !login.getId().equals("") ) {
			GoodsDto dto = new GoodsDto();
			dto.setGoods_seq(goods_seq);
			System.out.println("dto: " + dto.toString());
			
			GoodsDto goods = lalaProductService.goodsDetail(dto);
			System.out.println("goods: " + goods.toString());
			model.addAttribute("goods", goods);
			
			return "goodsdetail.tiles";
		}
		else {
			return "redirect:/mainpage.do";
		}
	}
	
	//상품평 수정작업 실행
	@RequestMapping(value="updateGoodsAf.do", method=RequestMethod.POST)
	public String updateGoodsAf(
			int oripoint,
			GoodsDto dto,
			@RequestParam(value="fileload",required=false)MultipartFile fileload,
			HttpServletRequest req) {
		logger.info("LalaProductController updateGoodsAf " + new Date());
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		
		//if(login!=null && !login.getId().equals("") && dto.getGid().equals(login.getId())) {
		
			String newfilename = "";
			//1. 파일 재첨부가 됐을때
			if(!fileload.isEmpty()) {
				newfilename = FUpUtil.getNewFile(fileload.getOriginalFilename());
				dto.setPictures(newfilename);
			}
			//2. 파일 재첨부가 안됐을때
			else {
				//2-1. 재첨부도 안됐고, 원본파일명도 없을때 
				//있었다가 지웠던, 원래 없었던 그냥 없어지는건 같으니 없애준다.
				if(dto.getPictures()==null || dto.getPictures().equals("")) {
					dto.setPictures("");
				}
			}
			
			System.out.println("ori:"+oripoint+", new:"+dto.getGpoint());
			
			//원래별점과 바뀐별점이 다르면 총점에서 원래별점을 뺴주고 새로 더해줘야 한다.
			if(oripoint != dto.getPpoint()) {
				//빼줄 서비스
				GoodsDto newdto = new GoodsDto();
				newdto.setGpseq(dto.getGpseq());
				newdto.setGpoint(oripoint);
				boolean isS = lalaProductService.productPointMinus(newdto);
				System.out.println("뺀 상태 isS: " + isS + ", " + newdto.toString());
				//바뀐 별점을 더해줄 서비스
				isS = lalaProductService.productPointPlus(dto);
				System.out.println("더한 상태 isS: " + isS + ", " + dto.toString());
			}
			
			//수정 데이터로 수정을 작업
			lalaProductService.updateGoodsAf(dto);
			
			//다시 파일 실제 업로드
			if(!fileload.isEmpty()) {
				String fupload = req.getSession().getServletContext().getRealPath("/upload");
				File file = new File(fupload + "/" + newfilename);
				
				try {
					FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			//수정이 끝나면 어디로 가지?
			return "redirect:/productdetail.do?product_seq=" + dto.getGpseq();
		/*}
		else {
			return "redirect:/mainpage.do";
		}*/
	}
}























