<%@page import="lala.com.a.util.HotelUtil"%>
<%@page import="lala.com.a.model.HotelDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/hotelList.css">
<div>
<img alt="" src="<%=request.getContextPath() %>/resources/images/hotel_top.png" border="0" style="width: 100%; height: 230px;">
</div>
<div class="sub-container">
<div class="filter-wrap ticket">
	<div class="filter-left">
		<div class="filter-left-inner">
			<div class="filter-box">
				<div class="custom-cell">
					
				</div>
			</div>
		</div>
		<div class="filter-box keyword" style="width:860px; border:none;border-bottom: 1px solid black;">
			<select name="place1" id="place1" style="border:none;">
				<option value="all">전체보기</option>
				<option value="서울특별시">서울특별시</option>
				<option value="경기도">경기도</option>
				<option value="강원도">강원도</option>
				<option value="충청도">충청도</option>
				<option value="전라도">전라도</option>
				<option value="경상도">경상도</option>
				<option value="제주도">제주도</option>
			</select>
			<select name="choice" id="choice" style="border:none">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name ="findWord" id="findWord" value="${paging.findWord }" style="width:600px; border:none" placeholder="키워드">
			<img src="<%=request.getContextPath() %>/resources/images/search.png" style="float: right;cursor: pointer;" alt="검색" onclick="doSearch()">			
		</div>
	</div>
</div>
<div class="container-inner">
<p class="location-lst">
<span class="active">숙박 > <b> <a href="hotellist.do" style="color:black">호텔 리스트</a> </b></span>
</p>
<table>
<colgroup>
<col width="33%"><col width="33%"><col width="33%">
</colgroup>
<thead>
</thead>
<tbody>
	<c:if test="${empty hotelList }">
		작성된 글이없습니다.
	</c:if>
	<c:if test="${not empty hotelList}">
		<tr>
			<c:forEach items="${hotelList }" var="hotel" varStatus="vs">
					<td>
					<ul  class="lst-type-card  active">
						<li>
							<a href="hoteldetail.do?seq=${hotel.seq }">
								<div class="img-cont">
									<img alt="이미지없음" src="<%=request.getContextPath() %>/upload/${hotel.thumbnail }" style="width:355px;height: 255px">
								</div>
								<div class="lst-infor-wrap">
									<div class="lst-infor-title">${hotel.title }</div>
									<div class="lst-infor-text">
										<div class="lst-infor-text-inner">
											<%HotelDto h = (HotelDto)pageContext.getAttribute("hotel"); %>
											<img style="width:100px; height:20px;" alt="이미지없음" src="<%=request.getContextPath()%>/resources/images/star/star_<%=HotelUtil.xxx(h.getGrade())%>.png">
											<%=HotelUtil.xxx(h.getGrade()) %> 
										</div>
									</div>
									<div class="lst-infor-link">
										자세히보기
										<i class="ion-ios-arrow-thin-right"></i>
									</div>
									<div class="ico-arrow">
										<span></span>
									</div>
								</div>
							</a>
						</li>
					</ul>
				<c:if test="${vs.count%3 == 0}">
					</tr>
					<tr>
				</c:if>
			</c:forEach>
	</c:if>
</tbody>
</table>
<br><br>

<jsp:include page="paging.jsp">
		<jsp:param name="actionPath" value="hotellist.do"/>
		<jsp:param name="nowPage" value="${paging.nowPage }" />
		<jsp:param name="totalCount" value="${paging.totalCount }" />
		<jsp:param name="countPerPage" value="${paging.countPerPage }" />
		<jsp:param name="blockCount" value="${paging.blockCount }" />
		
		<jsp:param name="findWord" value="${paging.findWord }" />
		<jsp:param name="choice" value="${paging.choice }" />
		<jsp:param name="place" value="${paging.place }" />
</jsp:include>
<c:if test="${login.auth eq '1' }">
<div class="back" onclick="location.href='hotelwrite.do'">
    <div class="button_base b07_3d_double_roll">
        <div>호텔 등록</div>
        <div>호텔 등록</div>
        <div>호텔 등록</div>
        <div>호텔 등록</div>
    </div>
</div>
<!-- 	<input type="button" value="호텔등록" onclick="location.href='hotelwrite.do'"> -->
</c:if>
<p style="clear:both;">&nbsp;</p>
<div style="border-top:1px solid black"></div>
</div>
</div>

<script type="text/javascript">
$(document).ready(function () {
	$("#choice").val('${paging.choice}').prop("selected", true);
	$("#place1").val('${paging.place}').prop("selected",true);
});
function doSearch() {
	var findWord = $("#findWord").val();
	var choice = $("#choice").prop("selected",true).val();
	var place = $("#place1").prop("selected",true).val();
	location.href="hotellist.do?findWord=" + findWord +"&choice=" + choice + "&place=" + place;
}
$("#place1").change(function() {
	var place = $(this).val();
	
	location.href="hotellist.do?place=" + place;
});
</script>