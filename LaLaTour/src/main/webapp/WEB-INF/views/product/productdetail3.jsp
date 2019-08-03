<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/product.css">
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />

<style>

.middleImg{ 
margin-top:60px;
	background-image: url("<%=request.getContextPath() %>/resources/images/product/productshop_top.jpg");
	background-repeat: no-repeat;
 	background-size: 100% 230px; 
	height: 230px;
}
.middleTitle{
	color: black;
	text-align: center;
	padding-top: 85px;
	font-size: 60px;
}
.middleAll{
	margin-top: 100px;
}

.menuThree {
   width: 1250px; 
   float: left; 
   height: 100px;
   background-color: #434b51;
   /* color: white; */
   display: table;
}
.menuThree a {
   width: 25%;
   display: table-cell;
   vertical-align: middle;
   color: #e8e8e8 !important;
   font-weight: bolder;
   font-size: 30px;
   text-decoration: none;
}
.menuThree a:hover, .menuThree a.active{
   text-decoration: none;
   background-color: #f4f4f4;
   color: #434b51 !important;
   border: 2px solid #434b51;
}
.padding10 td, th {
   padding: 10px;
}
.padding5 td, th {
   padding: 5px;
}
.colline {
   border: none;
   border-top: 3px solid black;
}
.colline td, th {
   border-bottom: 1px solid #bfc1bd !important;
}

.jbMenu {
   text-align: center;
   width: 1250px;
   font-size: 25px;
}
.jbFixed {
   position: fixed;
   top: 60px;
}


.star-rating {
   width: 205px;
}
.star-rating, .star-rating span {
   display: inline-block;
   height: 39px;
   overflow: hidden;
   background: url("<%=request.getContextPath()%>/resources/images/product/star2.png") no-repeat;
}
.star-rating span {
   background-position: left bottom;
   line-height: 0;
   vertical-align: top;
}



.basic th, .basic td{
    border: 1px solid #bfc1bd;
}
.bluebtn {
   width: 30px;
   background-color: white;
   padding: 20px 30px;
   margin: 2px;
   border: none;
   color: black;
   text-align: center;
   text-decoration: none;
   font-size: 30px;
   display: inline-block;
   cursor: pointer;
}
.bigbtnblack {
   width: 250px;
   background-color: #434b51;
   padding: 15px 30px;
   border: none;
   color: white;
   text-align: center;
   text-decoration: none;
   font-size: 30px;
   display: inline-block;
   cursor: pointer;
}
.bigbtnred {
   width: 250px;
   background-color: #E55310;
   padding: 15px 30px;
   border: none;
   color: white;
   text-align: center;
   text-decoration: none;
   font-size: 30px;
   display: inline-block;
   cursor: pointer;
}
.goodswritebtn {
   width: 150px;
   background-color: #2b9cf2;
   padding: 10px 20px;
   border: none;
   color: white;
   text-align: center;
   text-decoration: none;
   font-size: 20px;
   display: inline-block;
   cursor: pointer;
}
.smallbtn {
   width: 40px;
   height: 40px;
   background-color: white;
   border: 1px solid gray;
   color: black;
   text-align: center;
   font-size: 25px;
   text-decoration: none;
   display: inline-block;
   cursor: pointer;
}
</style> 

<!-- 상단이미지 -->
<%-- <div>
   <img alt="" src="<%=request.getContextPath() %>/resources/images/productlisttop.jpg" border="0" style="width: 100%; height: 230px;">
</div> --%>
<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
	<div class="middleImg">
		<h1 class="middleTitle">Shopping</h1>
	</div>
</div>

<div id="outer">
<div id="inner">

<div id="div_detail_top" style="width: 1250px; height: 700px; display: inline-block;">
<!-- 왼쪽 div /////////////////////////-->
<div id="div_pic_wrap" style="width: 500px; height: 600px; float:left;">
   <div id="div_pic" style="padding-bottom: 20px;">
      <%-- <img alt="" src="<%=request.getContextPath()%>/upload/${fileList[0].fileNameAf}"
         style="width: 500px; height: 450px;"> --%>
         <ul class="bxslider">
            <c:forEach items="${fileList}" var="files">
               <li id="image${files.seq}"><img src="<%=request.getContextPath()%>/upload/${files.fileNameAf}" style="width: 500px; height: 450px;"/></li>
            </c:forEach>
         </ul>
   </div>
   <div id="div_tn" style="text-align: center; width: 500px; height: 150px;">
      <input type="hidden" id="slide_index" value="0">
      <div id="div_tn1" style="width: 80px; height: 150px; float: left;">
         <button type="button" id="_leftBtn" class="bluebtn" style="float: right;"><</button>
      </div>
      <div id="div_tn2"  style="width: 340px; float: left;">
         
            <c:forEach items="${fileList}" var="flist" varStatus="counter">
               <li class="als-item" style="display: none;">
                  <img value="${counter.index}" alt="" src="<%=request.getContextPath()%>/upload/${flist.fileNameAf}" 
                     style="width: 90px; height: 90px;">
               </li>
            </c:forEach>
      </div>
      <div id="div_tn3" style="width: 80px; float: left;">
          <button type="button" id="_rightBtn" class="bluebtn" style="float: left;">></button>
      </div>
   </div>
</div> <!-- end div_pic_wrap -->

<!-- 오른쪽 div /////////////////////////-->
<div id="div_detail_wrap" style="width: 650px; height: 600px; float:right;">
   <div id="div_detail_top" style="width: 650px; height: 350px;">
      <div>
         <div class="subtitle">
            <font style="font-size: 40px; font-weight: 1000;">${product.title}</font>
         </div> <!-- end subtitle -->
         <span class="star-rating">
            <span id="_percent"></span>
         </span>
      </div>
      <table class="padding5 colline">
      <colgroup>
         <col width="180px"><col width="470px">
      </colgroup>
      
      <tr>
         <th>단위수량</th>
         <td>${product.subtitle}</td>
      </tr>
      <tr>
         <th>판매가</th>
         <td>${product.price}원</td>
      </tr>
      <tr>
         <th>원산지</th>
         <td>${product.place}</td>
      </tr>
      <tr>
         <th>관련축제</th>
         <td>
            <span>
               <c:if test="${not empty product.ftitle }">
                  <span>${product.ftitle}</span>
                  <label onclick="goFestival(${product.fseq})" style="cursor: pointer; font-size: 13px;">&nbsp;&nbsp;[축제페이지 이동]</label>
               </c:if>
               <c:if test="${empty product.ftitle }">등록된 축제가 없습니다</c:if>
            </span>
         </td>
      </tr>
      <tr>
         <th>판매수량</th>
         <td>${product.pcount}</td>
      </tr>
      <tr>
         <th>등록일</th>
         <td>${product.wdate}</td>
      </tr>
      <tr>
         <th>배송정보</th>
         <td>택배배송 - 평균 2일 이내 배송 (토,일,공휴일 제외)</td>
      </tr>
      </table>
   </div> <!-- end div_detail_top -->
   <div id="div_detail_cart" style="width: 650px; height: 200px;">
      <div id="div_detail_cart_count">
         <div style="display: inline-block; width: 100%; margin-top: 20px; background-color: #e8e8e8; padding: 10px;">
            <p>${product.title} (${product.subtitle})</p>
            <div style="width: 300px; margin-left: 20px;">
               <span>
                  <button type="button" class="smallbtn" id="mBtn" style="float: left;">-</button>
                  <input type="text" id="_myCount" name="myCount" value="1" readonly="readonly" style="width:50px; height:40px; float:left; text-align: center;">
                  <button type="button" class="smallbtn" id="pBtn" style="float: left;">+</button>
               </span>
            </div>
            <div style="float: right; margin-right: 20px;">
               <span class="total" style="font-size: 30px; font-weight: 500;"></span>원
            </div>
         </div>
         <div style="display: inline-block; width: 650px; height: 100px; padding: 0px 20px;">
            <div style="float: right;">
            <font style="font-size: 30px; font-variant: 400;">합계</font><span class="total" style="font-size: 50px; color: #E55310; font-weight: 600;">&nbsp;</span><font style="font-size: 30px; font-variant: 400;">원</font>
            </div>
         </div>
         <div style="width: 650px;">
            <c:if test="${login.auth eq '1'}">
               <button type="button" class="bigbtnblack" id="_productUpdateBtn" onclick="location.href='productUpdate.do?product_seq=${product.product_seq}'">수정하기</button>
               <button type="button" class="bigbtnred" id="_productListBtn" onclick="location.href='productlist.do'">목록으로</button>
            </c:if>
            <c:if test="${login.id ne '' and not empty login and login.auth eq '0'}">
               <c:if test="${product.pcount eq '0'}">
                  <button type="button" class="bigbtnblack" id="_cartinsertBtn" disabled="disabled">일시품절</button>
               </c:if>
               <c:if test="${product.pcount > '0'}">
                  <button type="button" class="bigbtnblack" id="_cartinsertBtn">장바구니 담기</button>
               </c:if>
               <button type="button" class="bigbtnred" id="_cartlistBtn">장바구니 이동</button>
            </c:if>
            <c:if test="${login.id eq '' or empty login}">
               <span>구입 하시려면 로그인을 해야 합니다.</span>
            </c:if>
         </div>         
      </div>
   </div>
</div> <!-- end div_detail_wrap -->
</div> <!-- end div_detail_top -->

<!-- 고정메뉴 바 /////////////////////////////////////////////// -->
<div id="div_middleMenu_wrap" class="jbMenu" style="width: 1250px; display:block; z-index: 1;">
   <div id="menuThreeDiv" class="menuThree">
      <a value="detail" class="active">상품상세정보</a>
      <a value="goods" >고객상품평</a>
      <a value="answer">Q&A</a>
      <a value="refund" >교환 및 반품 안내</a>
      <!-- <a href="#detail" value="detail" class="active">상품상세정보</a>
      <a href="#goods" value="goods" >고객상품평</a>
      <a href="#answer" value="answer">Q&A</a>
      <a href="#refund" value="refund" >교환 및 반품 안내</a> -->
   </div> <!-- end div_menuThree1 -->
</div> <!-- end div_middleMenu_wrap -->

<!-- 상품상세정보 /////////////////////////////////////////////// -->
<!-- <div class="div_content_wrap target" id="detail" style="width: 1250px; display: inline-block; margin-top: 50px;"> -->
<div class="target" id="detail" style="width: 1250px; display: inline-block; margin-top: 100px;">
   <div class="subtitle">
      <font style="font-size: 40px;">상품상세정보</font>&nbsp;&nbsp;&nbsp;
   </div> <!-- end subtitle -->
   <br>
   <pre style="width: 1250px; height: auto; white-space: pre-wrap;">${product.content}</pre>
</div> <!-- end div_content_wrap -->

<!-- 고객상품평 /////////////////////////////////////////////// -->
<!-- <div class="div_goods_wrap target" id="goods" style="width: 1250px; display: inline-block; margin-top: 50px;"> -->
<div class="target" id="goods" style="width: 1250px; display: inline-block; margin-top: 100px;">
<div class="subtitle">
   <font style="font-size: 40px;">고객상품평
      <c:if test="${product.hcount eq '0'}">0</c:if>
      <c:if test="${product.hcount > '0'}">
         <fmt:formatNumber value="${product.ppoint/product.hcount}" pattern=".00"/>
      </c:if>
      (${product.hcount})
   </font>&nbsp;&nbsp;&nbsp;
   <c:if test="${login.auth eq '0'}">
      <button type="button" class="goodswritebtn" onclick="goodsWriteClick()">상품평쓰기</button>
   </c:if>
</div> <!-- end subtitle -->
<br>
<c:if test="${goodsList.size() eq '0'}">
   등록된 상품평이 없습니다
</c:if>
<c:if test="${goodsList.size() > '0' }">
   <table class="padding10 colline">
   <colgroup>
      <col width="200px"><col width="650px"><col width="200px"><col width="200px">
   </colgroup>
   <c:forEach items="${goodsList}" var="goods">
   <tr>
      <td>
         <c:forEach var="i" begin="1" end="${goods.gpoint}" step="1">
            ★
         </c:forEach>
         <c:forEach var="i" begin="${goods.gpoint+1}" end="5" step="1">
            ☆
         </c:forEach>
         (${goods.gpoint})
      </td>
      <td>
         <font onclick="clickGoods(${goods.goods_seq}, '${goods.pictures}')">
            ${goods.gcontent}
            <c:if test="${not empty goods.pictures}"><font style="color: red;">[사진]</font></c:if>
         </font>
         <div id="pic${goods.goods_seq}"></div>
      </td>
      <td>${goods.gid}</td>
      <td>${fn:substring(goods.gdate,0,10)}</td>
   </tr>
   </c:forEach>
   </table><br>
   
   <!-- 페이징 ////////////////////// -->
   <div class="pgdiv" id="pgdiv" style="z-index: 0; position: relative;">
   <span class="pgspan">
      <jsp:include page="paging.jsp">
         <jsp:param name="actionPath" value="productdetail.do?product_seq=${goods.gpseq}"/>
         <jsp:param name="search_seq" value="${product.product_seq}" /> 
         <jsp:param name="nowPage" value="${paging.nowPage}" />
         <jsp:param name="totalCount" value="${paging.totalCount}" />
         <jsp:param name="countPerPage" value="${paging.countPerPage}" />
         <jsp:param name="blockCount" value="${paging.blockCount}" />
         
         <jsp:param name="findWord" value="${paging.findWord}" />
         <jsp:param name="choice" value="${paging.choice}" />
      </jsp:include>
   </span>
   </div><!-- end pgdiv -->
   
</c:if>
</div> <!-- end div_goods_wrap -->

<!-- Q&A /////////////////////////////////////////////// -->
<!-- <div class="div_answer_wrap target" id="answer" style="width: 1250px; display: inline-block; margin-top: 50px;"> -->
<div class="target" id="answer" style="width: 1250px; display: inline-block; margin-top: 100px;">
   <div class="subtitle">
      <font style="font-size: 40px;">Q&A</font>&nbsp;&nbsp;&nbsp;
   </div> <!-- end subtitle -->
   <br>
   <div>
      <form>
         <table>
         <colgroup>
            <col width="15%"><col width="70%"><col width="15%">
         </colgroup>
         <tr>
         </tr>
         </table>
      </form>
   </div>
   <!-- 댓글 목록이 나올 div//////////////////////////////////////////////////////////////////////////// -->
   <div id="rep_list_div">
      <c:if test="${replyList.size() eq '0' or empty replyList }">
      등록된 글이 없습니다
      </c:if>
      <c:if test="${replyList.size() > '0' }">
      <c:forEach items="${replyList }"  var="reply">
         <div id="reply${reply.seq}">
         <form id="reply${reply.seq}" method="post">
            <table border="1">
            <colgroup>
               <col width="200px"><col width="1000px"><col width="200px"><col width="200px">
            </colgroup>
            <tr>
               <td>${reply.id}</td>
               <td>
                  <input type="text" id="content${reply.seq}" style="border: none; width: 100%;" value="${reply.content}" readonly="readonly">
                  ${reply.content}
               </td>
               <td>${reply.wdate}</td>
               <td>
                  <div id="before${reply.seq}">
                     <button type="button" onclick="updateView(${reply.seq})">수정</button>
                     <button type="button" onclick="deleteReply(${reply.seq})">삭제</button>
                  </div>
                  <div id="after${reply.seq}" style="display: none;">
                     <button type="button" onclick="updateReply(${reply.seq})">완료</button>
                     <button type="button" onclick="cancelReply(${reply.seq})">취소</button>
                  </div>
               </td>
            </tr>
            </table>
         </form>
         </div>
      </c:forEach>
      </c:if>
   </div> <!-- end rep_list_div -->
</div> <!-- end div_answer_wrap -->

<!-- 교환 및 반품안내 /////////////////////////////////////////////// -->
<!-- <div class="div_refund_wrap target" id="refund" style="width: 1250px; display: inline-block; margin-top: 50px;"> -->
<div class="target" id="refund" style="width: 1250px; display: inline-block; margin-top: 100px;">
   <div class="subtitle">
      <font style="font-size: 40px;">교환 및 반품 안내</font>
   </div> <!-- end subtitle -->
   <br>
   <div>
      <table class="padding10 basic">
      <colgroup>
         <col width="300px"><col width="950px">
      </colgroup>
      
      <tbody>
      <tr>
         <th>교환/반품/신청기간</th>
         <td>
<pre style="width: 100%; white-space: pre-wrap;">
교환/취소/반품/교환/환불은 배송 완료 후 7일 이내에 가능합니다.
고객님이 받으신 상품의 내용이 표시 광고 및 계약 내용과 다른 경우 상품을 수령하신 날로부터 3개월 이내, 그 사실을 안 날(알 수 있었던 날)부터 30일 이내에 신청이 가능합니다.
</pre>
         </td>
      </tr>
      <tr>
         <th>교환/반품 회수(배송) 비용</th>
         <td>
<pre style="width: 100%; white-space: pre-wrap;">         
상품의 불량/하자 및 표시광고 및 계약 내용과 다른 경우 해당 상품 회수(배송)비용은 무료이나,
고객님의 단순변심 및 색상/사이즈 불만에 관련된 교환/반품의 경우 택배비는 고객님 부담입니다.
</pre>
         </td>
      </tr>
      <tr>
         <th>교환/반품 불가안내</th>
         <td>
<pre style="width: 100%; white-space: pre-wrap;">         
고객님이 상품 포장을 개봉하여 사용 또는 설치 완료되어 상품의 가치가 훼손된 경우 (단, 내용 확인을 위한 포장 개봉의 경우는 예외)
고객님의 단순변심으로 인한 교환/반품 신청이 상품 수령한 날로부터 7일이 경과한 경우
고객님의 사용 또는 일부 소비에 의해 상품의 가치가 훼손된 경우
시간 경과에 따라 상품 등의 가치가 현저히 감소하여 재판매가 불가능한 경우
복제가 가능한 재화 등의 포장을 훼손한 경우(DVD, CD, 도서 등 복제 가능한 상품)
설치상품으로 고객님이 이상 여부를 확인한 후 설치가 완료된 상품의 경우(가전, 가구, 헬스기구 등)
고객님의 요청에 따라 개별적으로 주문제작되는 상품으로 재판매가 불가능한 경우(이니셜 표시상품, 사이즈 맞춤상품 등)
구매한 상품의 구성품이 누락된 경우(화장품 세트, 의류부착 악세서리, 가전제품 부속품, 사은품 등)
기타, 상품의 교환, 환불 및 상품 결함 등의 보상은 소비자분쟁해결기준(공정거래위원회 고시)에 의함
A/S 문의는 제조사로 먼저 문의 시 빠르게 처리 가능하며, 이마트/트레이더스 매장 상품에 한해 점포의 고객만족센터를 방문하시면 A/S 접수 가능
(영수증, 고객주문서 등 증빙서류 지참) / 자세한 문의는 하단 고객센터 번호로 문의
</pre>
         </td>
      </tr>
      </tbody>
      </table>
   </div>
   <br>
</div> <!-- end div_refund_wrap -->


<!-- 댓글 입력창 div -->
<%-- 
<div id="div_reply_wrap" style="width: 1500px; display: inline-block; padding: 50px;">
<h2>댓글</h2>
<div id="rep_insert_div">
<form id="_repForm" method="post">
   <input type="hidden" name="pseq" value="${product.seq}">
   <input type="hidden" name="id" value="${login.id}">
   댓글쓰기 창 [${login.id}] <br> 
   <textarea rows="5" cols="20" name="content" id="_content"></textarea>
   <button type="button" onclick="insertReply()">입력</button>
</form>
</div> --%> <!-- end rep_insert_div --><br>



<!-- </div> --> <!-- end div_reply_wrap -->

<form id="cartForm" action="cartinsert.do" method="post">
   <input type="hidden" name="pseq" value="${product.product_seq}">
   <input type="hidden" id="myCount" name="myCount">
   <input type="hidden" name="id" value="${login.id}">
   <input type="hidden" name="gopage" id="gopage">
</form>

</div> <!-- end inner -->
</div> <!-- end outer -->

<div style="display: none;">
<!-- 페이징 ////////////////////// -->
<div class="pgdiv" id="pgdiv">
<span class="pgspan">
   <jsp:include page="paging.jsp">
      <jsp:param name="actionPath" value="productdetail.do?product_seq=${goods.gpseq}"/>
      <jsp:param name="search_seq" value="${product.product_seq}" /> 
      <jsp:param name="nowPage" value="${paging.nowPage}" />
      <jsp:param name="totalCount" value="${paging.totalCount}" />
      <jsp:param name="countPerPage" value="${paging.countPerPage}" />
      <jsp:param name="blockCount" value="${paging.blockCount}" />
      
      <jsp:param name="findWord" value="${paging.findWord}" />
      <jsp:param name="choice" value="${paging.choice}" />
   </jsp:include>
</span>
</div><!-- end pgdiv -->
</div>

<script>
var images = $("li.als-item").length;

var total = '${product.price}' * Number( $("#_myCount").val() );
//$(".total").append( (total+"원") );
$(".total").append( (total) );

$(document).ready(function() {
   var num = $("#slide_index").val();
   
   //$('.bxslider').bxSlider();
   
   var oobbjj = $('.bxslider').bxSlider({ 
      auto: false, 
      /* speed: 500,  */
      /* pause: 4000,  */
      /* mode:'fade',  */
      autoControls: true, 
      pager:true,
      captions: true
   });
   
   //이미지 클릭하면 해당이미지로 선택되어 확대
   $(document).on("click", "li.als-item", function() {
      var count = $(this).children("img").attr("value");

      oobbjj.goToSlide(count);
   });

   $("li.als-item").slice(num,num+3).attr("style","display: inline;");
   
   // 메뉴고정 시작///////////////// 근데 잘 안되는것 같기도 함
/*    var jbOffset = $(".jbMenu").offset();
   $(window).on("scroll", function() {
      if( $(window).scrollTop() >= jbOffset.top ) {
         $(".jbMenu").addClass("jbFixed");
         if( $(window).scrollTop() >= $(this).offset().top-110 ) {
            $(".target").each(function() {
               var id = $(this).attr('id');
               //$(".jbMenu").addClass("jbFixed");
               $(".jbMenu .menuThree a").removeClass("active");
               $(".jbMenu .menuThree a[href=#"+id+"]").addClass("active");
            });
         }
      }
   }); */
   
   var jbOffset = $(".jbMenu").offset();
   $(document).on("scroll", function() {
      if( $(document).scrollTop()+60 >= jbOffset.top ) {
         $(".jbMenu").addClass("jbFixed");
      }
      else {
         $(".jbMenu").removeClass("jbFixed");
      }
      
      $(".target").each(function() {
         if( $(window).scrollTop() >= $(this).offset().top-200 ) {
            var id = $(this).attr('id');
            //$(".jbMenu").addClass("jbFixed");
            $(".jbMenu .menuThree a").removeClass("active");
            $(".jbMenu .menuThree a[value="+id+"]").addClass("active");
         }
      });
   });
   
   
   
   /* 
   //여기는 최종보루  절대 건들지 말것 ////////////////////////////////////////
   //var jbOffset = $(".jbMenu").offset();
   $(window).on("scroll", function() {
      $(".target").each(function() {
         if( $(window).scrollTop() >= $(this).offset().top-110 ) {
            $(".jbMenu").addClass("jbFixed");
            var id = $(this).attr('id');
            //$(".jbMenu").addClass("jbFixed");
            $(".jbMenu .menuThree a").removeClass("active");
            $(".jbMenu .menuThree a[href=#"+id+"]").addClass("active");
         }
      });
   });
    */
   
   /* var jbOffset = $(".jbMenu").offset();
   $(document).on("scroll", function() {
      if( $(document).scrollTop() >= jbOffset.top ) {
         $(".jbMenu").addClass("jbFixed");
         $(".target").each(function() {
            if( $(document).scrollTop() >= jbOffset.top ) {
               var id = $(this).attr('id');
               //$(".jbMenu").addClass("jbFixed");
               $(".jbMenu a").removeClass("active");
               $(".jbMenu a[href=#"+id+"]").addClass("active");
            }
         });
      }
      else {
         $(".jbMenu").removeClass("jbFixed");
         $(".target").each(function() {
            if( $(document).scrollTop() >= jbOffset.top ) {
               var id = $(this).attr('id');
               //$(".jbMenu").addClass("jbFixed");
               $(".jbMenu a").removeClass("active");
               $(".jbMenu a[href=#"+id+"]").addClass("active");
            }
            else {
               //$(".jbMenu").removeClass("jbFixed");
               $(".jbMenu a").removeClass("active");
               $(".jbMenu a[href=#"+id+"]").addClass("active");
            }
         });
      }
   }); */
   
   //클릭이동 손보고 있는 중...
   $(document).on('click', '.menuThree a', function(event) {
      $(this).parent().find('a').removeClass('active');
       $(this).addClass('active');
       
       var id = $(this).attr("value");
       
       var offsetMove = $("#"+id).offset(); //선택한 태그의 위치를 반환

      //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
        //$("html, body").animate({scrollTop : offset.top-500}, 400);
       $(document).scrollTop(offsetMove.top-150);
   });

   
   /* $(window).on('scroll', function() {
       $('.target').each(function() {
           if($(window).scrollTop() >= $(this).offset().top) {
               var id = $(this).attr('id');
               $('#nav nav a').removeClass('active');
               $('#nav nav a[href=#'+ id +']').addClass('active');
           }
       });
   }); */
   
   var percent = 0;
   if( ${product.hcount}!=0 ) {
      var percent = ('${product.ppoint}'/'${product.hcount}')*100/5;
   }
   $("#_percent").css("width", percent+"%");
});

$(document).on("click", "#mBtn", function() {
   var val = Number( $("#_myCount").val() );
   
   if(val>1) {
      val = val-1;
   }
   
   $("#_myCount").val( val );
   showTotal();
});

//제품 총 판매수량(남은수량임)
var pcount = ${product.pcount};
$(document).on("click", "#pBtn", function() {
   var val = Number( $("#_myCount").val() );
   
   if( val==pcount ) {
      alert("현재 재고를 초과할 수 없습니다");
      return;
   }
   else if(val==10) {
      alert("최대 주문수량은 10입니다");
      return;
   }
   else {
      val = val+1;
   }
   
   $("#_myCount").val( val );
   showTotal();
});

$(document).on("change", "#_myCount", function() {
   
});

function showTotal() {
   var total = '${product.price}' * Number( $("#_myCount").val() );
   $(".total").empty();
   $(".total").append( (total) );
}

$(document).on("click", "#_cartinsertBtn", function() {
   $("#myCount").val( $("#_myCount").val() );
   
   var gopage = "";
   if( confirm("장바구니로 이동하시겠습니까?") ) {
      gopage = "cart";
   }
   else {
      gopage = "list";
   }
   $("#gopage").val(gopage);
   
   $("#cartForm").submit();
});

$(document).on("click", "#_cartlistBtn", function() {   
   location.href="cartlist.do?id=${login.id}";
});

$(document).on("click", "#_rightBtn", function() {
   //이전 시작값 가져오기
   var num = Number($("#slide_index").val());
   //alert(num);
   
   if( (num+3)>=images ) {
      return;
   }   
   
   var start = num;
   var end = num+3;

   //이전 시작값, 끝값 안보여주기
   $("li.als-item").slice(start,end).attr("style","display: none;");
   
   //이전 시작값에 현재시작값 세팅
   $("#slide_index").val( end );

   //현재 시작값, 끝값 보여주기
   $("li.als-item").slice(end,end+3).attr("style","display: inline;");
});

$(document).on("click", "#_leftBtn", function() {
   //조금전 시작숫자
   var num = Number($("#slide_index").val());
   
   if( num==0 ) {
      return;
   }   
   
   var start = num-3;
   var end = num;

   $("li.als-item").slice(num,num+3).attr("style","display: none;");
   
   $("#slide_index").val( start );

   $("li.als-item").slice(start,end).attr("style","display: inline;");
});

// 여기 있었음...............................

//상품평쓰기 버튼 클릭시
function goodsWriteClick() {
   <%
   if(session.getAttribute("login")==null) {
      %>
      alert("로그인을 해야 합니다");
      return;
      <%
   }
   %>
   
   location.href="sellList.do";
}

function clickGoods(goods_seq, pictures) {
   //alert($("#goods"+${goods.goods_seq}).attr("values"));
   //$("#pic"+goods_seq).append("123123");
   $("#pic"+goods_seq).empty();
   if(pictures!='') {
      var tags = "<img alt='' src='<%=request.getContextPath()%>/upload/" + pictures + "' style='width:250px; height:auto;'> <button type='button' class='closeBtn' onclick='clears("+goods_seq+")'>닫기</button>";
      $("#pic"+goods_seq).append(tags);
   }
}

function clears(goods_seq) {
   $("#pic"+goods_seq).empty();
}

function goFestival(fseq) {
   location.href="festivalDetail.do?seq="+fseq;
}

</script>


































