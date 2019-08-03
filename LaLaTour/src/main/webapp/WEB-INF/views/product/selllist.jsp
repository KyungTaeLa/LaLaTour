<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/product.css">

<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 -->
<style>



.outer{
	margin:50px;
}

.inputtext {
	border: 1px solid #7a7676;
	border-radius: 8px;
	height: 20px;
}
th {
	font-size: 20px;
	color: #514c4c;
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

.bigbtnred {
	width: 180px;
	background-color: #f74242;
	padding: 15px 30px;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	font-size: 25px;
	display: inline-block;
	cursor: pointer;
}
/* 
.selllist_linknoline {
	font-size: 20px;
	text-decoration: none !important;
}
.selllist_linknoline:hover {
	text-decoration: none;
} */
#top_info{
    padding-left: 20px;
    font-weight: bold;
    font-size: 30px !important;
}
</style> 



    
<div id="totalDiv" style="width: 1250px; margin:50px">
<p id="top_info">주문내역</p>


<div id="hcount" style="display: none;">
</div>

<table class="basic colline padding10">
<colgroup>
	<col width="250px"><col width="150px"><col width="400px">
	<col width="100px"><col width="150px"><col width="200px">
</colgroup>

<thead>
<tr>
	<th>주문번호</th>
	<th>이미지</th>
	<th>상품명</th>
	<th>수량</th>
	<th>구매금액</th>
	<th>상품평</th>
</tr>
</thead>

<tbody>
<c:if test="${selllist.size() eq '0' or empty selllist}">
	<tr>
		<td colspan="6">주문내역이 없습니다.</td>
	</tr>
</c:if>

<c:if test="${selllist.size() > '0'}">
<c:forEach items="${selllist}" var="item">
<tr>
	<td>
		<a href="getOrderSList.do?omid=${item.omid}">
			<font style="font-size: 20px; color: #514c4c !important;">${item.omid}</font>
		</a>
	</td>
	<td>
		<div>
			<img src="<%=request.getContextPath()%>/upload/${item.thumbNail}" style="width: 130px; height: 130px;">
		</div>
	</td>
	<td>
		<a href="productdetail.do?product_seq=${item.pseq}">
			<%-- <span class="selllist_linknoline">${item.title}</span> --%>
			<font style="font-size: 20px; color: #514c4c !important;">${item.title}</font>
		</a>
	</td>
	<td><span class="selllist_rednumber">${item.myCount}</span>ea</td>
	<td>
		<span class="total">
			<c:set var="tprice" value="${item.myCount * item.price}"/>
			<span class="selllist_rednumber">${tprice}</span>원
		</span><br>
	</td>
	<td>
		<c:if test="${item.gseq > '0'}">
			<button type="button" class="selllist_goodsBtn" onclick="location.href='updateGoods.do?goods_seq=${item.gseq}'"> <font style="color: red;">수정</font></button>
		</c:if>
		<c:if test="${item.gseq eq '0'}">
			<button type="button" class="selllist_goodsBtn selllist_blue" onclick="location.href='insertGoods.do?product_seq=${item.product_seq}&cart_seq=${item.cart_seq}'"><font style="color: #2e85cc;">등록</font></button>
		</c:if>
	</td>
</tr>
</c:forEach>
</c:if>
</tbody>

</table><br>

	<!-- 페이징 ////////////////////// -->
	<div class="pgdiv" id="pgdiv">
	<span class="pgspan">
		<jsp:include page="paging.jsp">
			<jsp:param name="actionPath" value="sellList.do"/>
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



<!-- </form> -->
</div> <!-- end totalDiv -->

