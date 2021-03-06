package lala.com.a.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lala.com.a.model.CartDto;
import lala.com.a.model.FestivalDto;
import lala.com.a.model.GoodsDto;
import lala.com.a.model.OrderedDto;
import lala.com.a.model.ProductDto;
import lala.com.a.model.ReplyDto;
import lala.com.a.product.LalaProductDao;

@Repository
public class LalaProductDaoImpl implements LalaProductDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Product.";

	//제품등록할때 축제검색
	@Override
	public List<FestivalDto> getFestivalList(String s_keyword) {
		return sqlSession.selectList(ns+"getFestivalList", s_keyword);
	}

	//제품등록
	@Override
	public int productWriteAf(ProductDto dto) {
		sqlSession.insert(ns+"productWriteAf", dto);
		return dto.getProduct_seq();
	}

	//파일업로드
	@Override
	public void uploadFile(FilePdsDto dto) {
		sqlSession.insert(ns+"uploadFile", dto);
	}

	//제품전체목록
	@Override
	public List<ProductDto> getProductList(PagingBean pagingBean) {
		System.out.println("impl dto: " + pagingBean.toString());
		return sqlSession.selectList(ns+"getProductList", pagingBean);
	}

	//디테일
	@Override
	public ProductDto productDetail(int product_seq) {
		return sqlSession.selectOne(ns+"productDetail", product_seq);
	}

	//파일리스트
	@Override
	public List<FilePdsDto> getFileList(int product_seq) {
		return sqlSession.selectList(ns+"getFileList", product_seq);
	}

	//장바구니에 넣기
	@Override
	public boolean cartinsert(CartDto dto) {
		int n = sqlSession.insert(ns+"cartinsert", dto);
		return n>0? true:false;
	}

	@Override
	public List<CartDto> getCartList(String id) {
		// 장바구니 목록
		return sqlSession.selectList(ns+"getCartList", id);
	}

	@Override
	public CartDto getProductSeq(CartDto dto) {
		// 물건담을때 장바구니에 이미있는건지 확인
		CartDto cdto = sqlSession.selectOne(ns+"getProductSeq", dto);
		System.out.println("daoimpl dto: " + dto.toString());
		//System.out.println("daoimpl cdto: " + cdto.toString());
		return cdto;
	}

	@Override
	public boolean updateMyCount(CartDto dto) {
		// 수량변경 (담는데 이미있을때)
		int n = sqlSession.update(ns+"updateMyCount", dto);
		
		return false;
	}

	@Override
	public CartDto getCart(int cart_seq) {
		// 주문의 제품dto 하나씩 가져오기
		return sqlSession.selectOne(ns+"getCart", cart_seq);
	}

	@Override
	public int orderedInsert(OrderedDto dto) {
		System.out.println("dao orderedInsert dto: " + dto.toString());
		// 주문결제시 주문자정보 저장
		
		//OrderedDto odto = new OrderedDto();
		
		//odto.setSeq(sqlSession.insert(ns+"orderedInsert", dto));
		//int seq = sqlSession.insert(ns+"orderedInsert", dto);
		sqlSession.insert(ns+"orderedInsert", dto);
		System.out.println("dao impl return seq: " + dto.getOrdered_seq());
		
		return dto.getOrdered_seq();
	}

	@Override
	public boolean updateCartOseq(CartDto dto) {
		//주문결제 후 장바구니의 oseq에 주문내역 seq를 저장
		int n = sqlSession.update(ns+"updateCartOseq", dto);
		return n>0? true:false;
	}

	@Override
	public void deleteFile(int seq) {
		// 파일삭제
		sqlSession.delete(ns+"deleteFile", seq);
	}

	@Override
	public FestivalDto getFestivalName(int seq) {
		// 축제seq로 축제dto가져오기 (수정에 씀)
		return sqlSession.selectOne(ns+"getFestivalName", seq);
	}

	@Override
	public boolean productUpdateAf(ProductDto dto) {
		// 제품수정
		int n = sqlSession.update(ns+"productUpdateAf", dto);
		return n>0? true:false;
	}

	@Override
	public boolean updateProductPCount(CartDto dto) {
		// 주문결제 후 주문된 물품수량만큼 원본물품의 재고를 수정
		int n = sqlSession.update(ns+"updateProductPCount", dto);
		return n>0? true:false;
	}

	@Override
	public boolean deleteCart(int cart_seq) {
		// 장바구니 선택물품 삭제
		int n = sqlSession.delete(ns+"deleteCart", cart_seq);
		return n>0? true:false;
	}

	@Override
	public int getProductTotalCount(PagingBean pagingBean) {
		// 제품전체목록 수 (페이징 때문에 필요)
		return sqlSession.selectOne(ns+"getProductTotalCount", pagingBean);
	}

	@Override
	public boolean insertReply(ReplyDto dto) {
		// 댓글입력
		int n = sqlSession.insert(ns+"insertReply", dto);
		return n>0? true:false;
	}

	@Override
	public List<ReplyDto> getReplyList() {
		// 댓글목록
		return sqlSession.selectList(ns+"getReplyList");
	}

	@Override
	public List<OrderedDto> getSellList(PagingBean pagingBean) {
		// 과거 주문내역
		return sqlSession.selectList(ns+"getSellList", pagingBean);
	}

	@Override
	public List<OrderedDto> getOrderSList(String omid) {
		// 내역리스트 - 특정주문번호
		return sqlSession.selectList(ns+"getOrderSList", omid);
	}

	@Override
	public int insertGoodsAf(GoodsDto dto) {
		// 상품평 입력
		sqlSession.insert(ns+"insertGoodsAf", dto);
		System.out.println("goods_seq: " + dto.toString());
		return dto.getGoods_seq();
	}

	@Override
	public List<GoodsDto> getGoodsList(int gpseq) {
		// 상품평목록
		return sqlSession.selectList(ns+"getGoodsList", gpseq);
	}

	@Override
	public boolean updateCartGseq(GoodsDto dto) {
		// T상품평 입력시 cart의 gseq변경
		int n = sqlSession.update(ns+"updateCartGseq", dto);
		return n>0? true:false;
	}

	@Override
	public void updateProductPH(ProductDto pdto) {
		// TODO 상품평 입력시 해당제품 총별점,사람수 변경
		int n = sqlSession.update(ns+"updateProductPH", pdto);
	}

	@Override
	public void uploadFileGoods(FilePdsDto dto) {
		// 파일업로드 상품평에..
		sqlSession.insert(ns+"uploadFileGoods", dto);
	}

	@Override
	public GoodsDto goodsDetail(GoodsDto dto) {
		// TODO 상품평 수정을 위해 상품평 디테일 가져가기
		return sqlSession.selectOne(ns+"goodsDetail", dto);
	}

	@Override
	public boolean updateGoodsAf(GoodsDto dto) {
		// TODO 상품평 수정
		int n = sqlSession.update(ns+"updateGoodsAf", dto);
		return n>0? true:false;
	}

	@Override
	public boolean productPointMinus(GoodsDto dto) {
		// TODO 상품평 수정시 총별점에서 원본별점 -
		int n = sqlSession.update(ns+"productPointMinus", dto);
		return n>0? true:false;
	}

	@Override
	public boolean productPointPlus(GoodsDto dto) {
		// TODO 상품평 수정시 총별점에 수정된별점 +
		int n = sqlSession.update(ns+"productPointPlus", dto);
		return n>0? true:false;
	}

	@Override
	public int getGoodsTotalCount(PagingBean pagingBean) {
		// TODO 상품평 갯수 얻기
		return sqlSession.selectOne(ns+"getGoodsTotalCount", pagingBean);
	}

	@Override
	public List<GoodsDto> getGoodsPagingList(PagingBean pagingBean) {
		// TODO 상품평 페이징목록
		return sqlSession.selectList(ns+"getGoodsPagingList", pagingBean);
	}

	@Override
	public int getSellListTotalCount(String id) {
		// TODO 페이징 위해 총 갯수 가져옴
		return sqlSession.selectOne(ns+"getSellListTotalCount", id);
	}
	
	
}

























