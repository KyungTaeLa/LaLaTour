<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/product.css">

<%
String str = request.getSession().getServletContext().getRealPath("/upload");
%>

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



.divinup {
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transform: scale(1);

  -webkit-transition: all 0.1s ease-in-out; /* 부드러운 모션을 위해 추가 */
  -moz-transition: all 0.1s ease-in-out;
  transition: all 0.1s ease-in-out;
}

.divinup:hover {
  -webkit-transform: scale(1.05);
  -moz-transform: scale(1.05);
  -ms-transform: scale(1.05);
  -o-transform: scale(1.05);
  transform: scale(1.05);
}

/* .img {width:325px; height:280px; overflow:hidden } */ /* 이미지 사이즈 */



.inputtext {
	border: 1px solid #7a7676;/
	border-radius: 8px;
	height: 20px;
}
th {
	background-color: #e8e8e8;
}
.inputckbox {
	width: 20px;
	height: 20px;
}
table {
	border-collapse: collapse;
	border-left: none;
	border-right: none;
}
.padding10 td, .padding10 th {
	padding: 10px;
}
.padding5 td, th {
	padding: 5px;
}
.colline {
	border: none;
	border-top: 3px solid black;
}
.colline td, .colline th {
	border-bottom: 1px solid #bfc1bd;
}
.basic th, .basic td{
 	border: 1px solid #bfc1bd;
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
.productlist_btn {
	width: 120px;
	background-color: white;
	padding: 10px 10px;
	border: 1px solid black;
	/* border: none; */
	color: black;
	text-align: center;
	text-decoration: none;
	font-size: 20px;
	display: inline-block;
	cursor: pointer;
	/* border-radius: 10px; */
	/* box-shadow:1px 1px 1px; */
}
.productlist_btn:hover {
	color: red;
	font-weight: bolder;
	border: 2px solid red;
	
	/* color: white;
	background-color: red;
	font-weight: bolder; */
}
.bigbtnred {
	width: 180px;
	background-color: #f74242; /* #E55310; */
	padding: 15px 30px;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	font-size: 25px;
	display: inline-block;
	cursor: pointer;
}

/* ///////////////////////////////////////////////////////////////// */

img {
	display: block; 
	margin: 0px auto;
}

.productlisttitle {
	font-size: 14px;
}
.productlistprice {
	font-size: 28px;
}
.productlisttx {
	font-size: 12px;
}

.divouter {
	width: 312px; height: 390px; float: left;
}
.divfirstouter {
	width: 280px; height: 390px;
}
.divinup {
	width: 280px; height: 290px;
}
.divindown {
	width: 280px; height: 100px;
}
</style>

<!-- 상단이미지 -->
<%-- <div>
	<img alt="" src="<%=request.getContextPath() %>/resources/images/product/shopping_top.jpg" border="0" style="width: 100%; height: 230px;">
</div> --%>

<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
	<div class="middleImg">
		<h1 class="middleTitle">Shopping</h1>
	</div>
</div>

<div id="outer">
<div id="inner">

<!-- <span style="font-size: 40px; z-index: 1">제품목록</span> -->

<div id="totalDiv" style="width: 1250px;">

<div class="menus" style="width: 1250px; margin-bottom: 5px;">
	<div style="float: left;">
		<span style="font-size: 40px; float: left;">제품목록</span>
	</div>
	<div style="float: right;">
		<c:if test="${not empty login and login.id ne '' and login.auth eq '0'}">
			<button type="button" onclick="location.href='sellList.do'" class="productlist_btn">주문내역</button>
		</c:if>
		<c:if test="${not empty login and login.id ne '' and login.auth eq '0'}">
			<button type="button" onclick="location.href='cartlist.do?id=${login.id}'" class="productlist_btn">장바구니</button>
		</c:if>
		<c:if test="${not empty login and login.id ne '' and login.auth eq '1'}">
			<button type="button" id="_addBtn" class="bigbtnred" style="background-color: #434b51; border: 1px solid black;">제품 등록</button>
		</c:if>
	</div>
</div> <!-- end menus -->

<!-- 상단 검색창 영역 //////////////////////////////////////////////// -->
<div class="divsearch" style="display: table; text-align: center; width: 1250px; height: 80px; background-color: #ffdd32; text-align: center; margin-top: 10px; margin-bottom: 20px;">
	<!-- 검색창 ////////////////////// -->
	<div id="searchDiv" style="display: table-cell; vertical-align: middle; height: 35px; margin: auto;">
		<form action="productlist.do" method="get" id="_searchForm">
			<select name="choice" id="_choice" style="height: 30px;">
				<option value="title" selected="selected">상품명</option>
			</select>
			<input type="text" name="findWord" id="_findWord" value="${paging.findWord }" style="width: 300px;">
			<!-- <input type="button" value="검색" onclick="searchBtnClick()" > -->
			<!-- <button type="button" onclick="searchBtnClick()">검색</button> -->
			<img src="<%=request.getContextPath()%>/resources/images/product/searchBtn_black.png"
				style="width: 30px; height: 30px; display: inline-block; margin-top: 0px; margin-bottom: 4px;" onclick="searchBtnClick()">
		</form>
	</div> <!-- end searchDiv -->
</div> <!-- end divsearch -->

<!-- 제품 목록 영역 //////////////////////////////////////////////// -->
<div class="productlist_div" style="display: inline-block; width: 1250px; margin-bottom: 20px;">
<c:if test="${list.size() eq '0' }">
검색된 제품이 없습니다.
</c:if>

<c:if test="${list.size() > '0' }">
<c:forEach items="${list}" var="product">
<div class="divouter">
	<div class="divfirstouter">
		<div class="divinup">
			<img alt="이미지없음" src="<%=request.getContextPath()%>/upload/${product.thumbNail}" style="width: 280px; height: 280px; cursor: pointer;" onclick="moveDetail(${product.product_seq})">
		</div>
		<div class="divindown">
			<c:if test="${product.pcount eq '0'}"><font style="color: red;">[일시품절]</font></c:if>
			<span class="productlisttitle" onclick="moveDetail(${product.product_seq})">[${product.product_seq}] ${product.title}</span><br>
			<span class="productlistprice">${product.price}</span> <span class="productlisttx">원</span>
		</div>
	</div>
</div>
</c:forEach>
</c:if>
</div> <!-- end productlist_div -->


<%-- <c:if test="${not empty login and login.id ne '' and login.auth eq '0'}">
<button type="button" onclick="location.href='sellList.do'">주문내역</button>
</c:if>

<c:if test="${not empty login and login.id ne '' and login.auth eq '0'}">
	<button type="button" onclick="location.href='cartlist.do?id=${login.id}'">장바구니</button>
</c:if>
<c:if test="${not empty login and login.id ne '' and login.auth eq '1'}">
	<button type="button" id="_addBtn">제품등록</button>
</c:if> --%>

<%-- <table>
<colgroup>
	<col width="312.5px"><col width="312.5px"><col width="312.5px"><col width="312.5px">
</colgroup>

<c:set var="count" value="1"/>
<c:forEach items="${list}" var="product">

<c:if test="${count == '5'}"><c:set var="count" value="1"/></c:if>
<c:if test="${count == '1'}"><tr></c:if>
	<td>
		<div onclick="moveDetail(${product.product_seq})">
		<table>
		<tr>
			<td>
				<div style=text-align: center; width: 100%;">
				<img alt="이미지없음" src="<%=request.getContextPath()%>/upload/${product.thumbNail}" style="width: 290px; height: 290px;">
				</div>
			</td>
		</tr>	
		<tr>
			<td>
				<c:if test="${product.pcount eq '0'}"><font style="color: red;">[일시품절]</font></c:if>
				<span class="productlisttitle">[${product.product_seq}] ${product.title}</span><br>
				<span class="productlistprice">${product.price}</span class="productlisttx"><span>원</span>
			</td>
		</tr>
		</table>
		</div>
	</td>
<c:if test="${count == '4'}"></tr></c:if>
<c:set var="count" value="${count+1}"/>

</c:forEach>

</table><br> --%>
<br>
<!-- 페이징 ////////////////////// -->
<div class="divpaging" style="width: 100%;">
<span class="spanpaging">
	<jsp:include page="paging.jsp">
		<jsp:param name="actionPath" value="productlist.do"/>
		<jsp:param name="nowPage" value="${paging.nowPage}" />
		<jsp:param name="totalCount" value="${paging.totalCount}" />
		<jsp:param name="countPerPage" value="${paging.countPerPage}" />
		<jsp:param name="blockCount" value="${paging.blockCount}" />
		
		<jsp:param name="findWord" value="${paging.findWord}" />
		<jsp:param name="choice" value="${paging.choice}" />
	</jsp:include>
</span>
</div> <!-- end pgdiv -->

</div> <!-- end totalDiv -->

</div> <!-- end inner -->
</div> <!-- end outer -->

<script type="text/javascript">
$(document).ready(function() {
	$("#_addBtn").click(function() {
		location.href = "productwrite.do";
	});
});

function searchBtnClick() {
	//alert("검색버튼 누름");
	$("#_searchForm").submit();
}

function moveDetail( num ) {
	var product_seq = Number(num);
	location.href="productdetail.do?product_seq="+product_seq;
}

</script>

</body>
</html>