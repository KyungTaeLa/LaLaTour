<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/product.css">

<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->

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

.inputtext {
	border: 1px solid #7a7676;/
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
.padding5 td, .padding5 th {
	padding: 5px;
}
.colline {
	border: none;
	border-top: 3px solid black;
}
.colline td, .colline th {
	border-bottom: 1px solid #bfc1bd;
}
#outer {
	width: 100%;
	text-align: center;
	margin-top: 30px;
	padding-bottom: 20px;
}

#inner {
	display: inline-block;
	width: 1250px;
	text-align: left;
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
    
<h1>주문정보</h1>

<div id="oslist_topdiv" style="width: 1250px;">

<div id="detailDiv" style="width: 1250px;">
<table class="padding5 colline">
<colgroup>
	<col width="250px"><col width="1000px">
</colgroup>

<tbody>
<tr>
	<th>주문번호</th>
	<td>${oslist[0].omid}</td>
</tr>
<tr>
	<th>주문날짜</th>
	<td>${oslist[0].odate}</td>
</tr>
<tr>
	<th>주문자 정보</th>
	<td>${oslist[0].oid}</td>
</tr>
<tr>
	<th>받으시는 분</th>
	<td>${oslist[0].oname}</td>
</tr>
<tr>
	<th>전화번호</th>
	<td>${oslist[0].ophone}</td>
</tr>
<tr>
	<th>받으시는 주소</th>
	<td>${oslist[0].oaddress}</td>
</tr>
</tbody>

</table>
</div> <!-- end detailDiv -->

<div id="listDiv" style="width: 1250px;">
<table class="padding10 colline">
<colgroup>
	<col width="150px"><col width="800px"><col width="150px"><col width="150px">
</colgroup>

<tbody>
<c:if test="${oslist.size() > '0'}">
<c:forEach items="${oslist}" var="item">
<tr>
	<td><a href="productdetail.do?product_seq=${item.pseq}">
		<img src="<%=request.getContextPath()%>/upload/${item.thumbNail}" style="width: 130px; height: 130px;"></a></td>
	<td>
		<a href="productdetail.do?product_seq=${item.pseq}"><font class="font20">${item.title}</font></a>
	</td>
	<td>
		<span class="total">
			<c:set var="tprice" value="${item.myCount * item.price}"/>
			<span class="selllist_rednumber">${tprice}</span>&nbsp;원
		</span><br>
		수량 : <span class="selllist_rednumber">${item.myCount}</span>&nbsp;ea
	</td>
	<td>
		<c:if test="${item.gseq > '0'}">
			<button type="button" class="selllist_goodsBtn" onclick="location.href='updateGoods.do?goods_seq=${item.gseq}'"><font style="color: red;">수정</font></button>
		</c:if>
		<c:if test="${item.gseq eq '0'}">
			<button type="button" class="selllist_goodsBtn selllist_blue" onclick="location.href='insertGoods.do?product_seq=${item.product_seq}&cart_seq=${item.cart_seq}'"><font style="color: #2e85cc;">등록</font></button>
		</c:if>
	</td>
</tr>
</c:forEach>
</c:if>
</tbody>

</table>
</div> <!-- end listDiv -->
<!-- </form> -->
</div> <!-- end oslist_topdiv -->

</div> <!-- end inner -->
</div> <!-- end outer -->























