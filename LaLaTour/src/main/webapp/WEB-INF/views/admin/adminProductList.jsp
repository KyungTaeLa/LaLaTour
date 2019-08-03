<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!-- local CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/product.css">



<div id="finalWrap" style="width: 1250px; margin: 50px 0px 0px 50px;">
<div id="finalWrapIn" style="width: 1250px;">

<div class="divTop" style="margin-bottom: 20px;">
	<span class="adminTitle">쇼핑몰 재고 현황</span>
	<button type="button" id="_pinsertBtn" class="blue_btn2">제품 등록</button>
</div>
<hr>

<!-- 상단 검색창 영역 //////////////////////////////////////////////// -->
<div class="divsearch">
	<!-- 검색창 ////////////////////// -->
	<div class="searchDiv">
		<form action="adminProductList.do" method="get" id="_searchForm">
			<select name="choice" id="_choice" style="width:80px; height: 35px;">
				<option value="id" <c:if test="${paging.choice eq 'id'}">selected='selected'</c:if> >ID</option>
				<option value="name" <c:if test="${paging.choice eq 'name'}">selected='selected'</c:if> >Name</option>
			</select>
			<input type="text" name="findWord" id="_findWord" style="width: 300px; height: 35px;" value="<c:if test="${not empty paging.findWord}">${paging.findWord}</c:if>">
			<img src="<%=request.getContextPath()%>/resources/images/product/searchBtn_black.png"
				style="width: 35px; height: 35px; display: inline-block; margin-top: 0px; margin-bottom: 4px;" onclick="searchBtnClick()">
		</form>
	</div> <!-- end searchDiv -->
</div> <!-- end divsearch -->

<table class="padding5 colline" id="blueTable">
<colgroup>
	<col width="100px;"><col width="450px;"><col width="150px;">
	<col width="150px;"><col width="150px;"><col width="250px;">
</colgroup>

<thead>
	<th>상품</th>
	<th>상품명</th>
	<th>재고</th>
	<th>가격</th>
	<th>작성자</th>
	<th>등록일</th>
</thead>

<tbody>
<c:forEach items="${productList}" var="product">
<tr>
	<td>
		<img src="<%=request.getContextPath()%>/upload/${product.thumbNail}" style="width: 90px; height: 90px;">
	</td>
	<td>
		<a href="productUpdate.do?product_seq=${product.product_seq}" class="left_menu">${product.title}</a>
	</td>
	<td>${product.pcount}</td>
	<td>${product.price}</td>
	<td>${product.id}</td>
	<td>${product.wdate}</td>
</tr>		
</c:forEach>
</tbody>

</table><br>

<!-- 페이징 ////////////////////// -->
<div class="divpaging" style="width: 100%;">
<span class="spanpaging">
	<jsp:include page="paging.jsp">
		<jsp:param name="actionPath" value="adminProductList.do"/>
		<jsp:param name="nowPage" value="${paging.nowPage}" />
		<jsp:param name="totalCount" value="${paging.totalCount}" />
		<jsp:param name="countPerPage" value="${paging.countPerPage}" />
		<jsp:param name="blockCount" value="${paging.blockCount}" />
		
		<jsp:param name="findWord" value="${paging.findWord}" />
		<jsp:param name="choice" value="${paging.choice}" />
	</jsp:include>
</span>
</div> <!-- end pgdiv -->

</div> <!-- end finalWrapIn -->
</div> <!-- end finalWrap -->








<script>
$(document).on("click", "#_pinsertBtn", function() {
	location.href="productwrite.do";
});

//검색버튼 누름
function searchBtnClick() {
	$("#_searchForm").submit();
}
</script>




<!-- 관리페이지 ㅋ
<button onclick="location.href='cancelReserveList.do'">예약취소 리스트</button> -->

<!-- 관라지계정 관리페이지에 들어가야 할 내용들

1. 관라자 계정 관리
  - 관리자 계정 생성
  - 관리자 계정 수정

2. 회원 계정 관리
  - 회원 계정 수정

3. 축제
  - 축제 등록 및 수정

4. 지역명소
  - 글 등록 및 수정

5. 커뮤니티
  - 공지 등록 및 수정
  
6. 숙박
  - 호텔 등록 및 수정
  
7. 쇼핑
  - 제품 등록 및 수정

8. 기타
  - 질문글 관리
  - 메인페이지 관리
  - 
 -->

</body>
</html>










































