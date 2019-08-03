
<%@page import="lala.com.a.model.MemberDto"%>
<%@page import="lala.com.a.util.pagingBean"%>
<%@page import="lala.com.a.model.FestivalDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.middleImg{ 
	margin-top:60px;
	background-repeat: no-repeat;
 	background-size: 100% 230px; 
	height: 230px;
	opacity: 0.9; 
	background-image: url("<%=request.getContextPath() %>/resources/images/Festival.jpg");
}

.middleTitle{
	color: white;
	text-align: center;
padding-top: 85px;
font-size: 45px;
}
.middleAll{
margin-top: 100px;
}
</style>
<!-- 부트스트랩 -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/resources/css/festivalList.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/festivalList.css"> 
<body>
<%
 List<FestivalDto> list = (List<FestivalDto>)request.getAttribute("list"); 
 pagingBean paging = (pagingBean)request.getAttribute("paging");
 Object ologin = session.getAttribute("login");
 MemberDto member = null;
 if(ologin != null) {
 	  member = (MemberDto)ologin;
 }

%>





<!-- 상단 검색창 -->
<form action="festivalList.do" method="post">
	<!-- <img src="resources/images/Festival.jpg" alt="NO Picture" style="width: 100%;height: 230px"> -->
	<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
		<div class="middleImg">
			<h1 class="middleTitle">축제 리스트</h1>
		</div>
	</div>
<div class="sub-container" id="sub-container-type1">
	 	<div class="filter-wrap ticket" style="width:120%;margin-left: -10%" >
	 		<div class="filter-left">
	 			<div class="filter-left-inner">
	 				<div class="filter-box">
						<label for="allshort1" class="hd-element">진행여부</label>
							 <div class="custom-cell">
							 	 <select id="choice" name="choice">
									 <option value="서울특별시">서울특별시</option>
        							 <option value="경기도">경기도</option>
       							 	 <option value="강원도">강원도</option>
       							 	 <option value="충청도">충청도</option>
      							  	 <option value="전라도">전라도</option>
        							 <option value="경상도">경상도</option>
       							     <option value="제주도">제주도</option>	
							 	 </select>
							 </div> 
					</div> 
				</div>
				<div class="filter-box keyword" style="width:300px">
					<div class="filter-box-inner">
						<label for="Keyword1" class="hd-element">키워드</label>							 
							  <input type="text" name="findWord" id="findWord" placeholder="키워드" value="" style="border: 0">
							  		<button class="ico-search" type="submit" style="background-image: resources/images/search.png;background-color: white;    background-size: 30px 30px">
							  			<span class="hd-element">키워드 검색 버튼</span>
							  		</button>							  		
					</div>					
				</div> 
			</div>
					<div class="filter-right">
			<input type="button" class="btn btn-outline-dark" onclick="location_()" value="진행중">
			<input type="button" class="btn btn-outline-dark" onclick="location__()" value="마감">
			<!-- <a href="#" class="lst-type-card active" onclick = "location_()">진행중 축제</a> -->
			<!-- <a href="#" class="lst-type-thumnail" onclick="location__()">마감된 축제</a> -->
			</div>
		</div> 
		</div>
		
</div>
</form>



<!-- 전체 div -->
<div class="main">
	<div class="container-inner" style="width:70% ;margin-left: 15%">
	<p class="location-lst">
	 <span>	&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;라라투어</span>
		 <span class="active">축제&amp;행사</span> 
	</p>
	
	<!-- 사진 리스트 -->
	<ul class="lst-type-thumnail active">
			<!-- 인터파크 이벤트 컨텐츠 노출 제외 조건 추가   17007909 -->
<%
			for(int i =0 ; i < list.size() ; i++){
			FestivalDto ftdto = list.get(i);
%>
				<li>
					<a href="festivalDetail.do?seq=<%=ftdto.getSeq()%>">
						<% %>
						<div class="img-cont">
							<img src="<%=request.getContextPath()%>/upload/<%=ftdto.getThumbnail()%>" alt="NO Picture" class="img-thumbnail">
						</div>
						<div class="lst-infor-wrap">
							<div class="lst-infor-title">[<%=ftdto.getPlace() %>]<%=ftdto.getTitle() %></div>
							<div class="lst-infor-text"><%=ftdto.getsDate() %> ~ <%=ftdto.geteDate() %></div>
							
		<%if(ftdto.getScore()>4.5){ %>
			<img src="resources/images/star/star_5.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=ftdto.getScore()%>
		<%}else if(ftdto.getScore()>4){ %>
			<img src="resources/images/star/star_4.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=ftdto.getScore()%>
		<%}else if(ftdto.getScore()>3.5){ %>
			<img src="resources/images/star/star_4.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=ftdto.getScore()%>
		<%}else if(ftdto.getScore()>3){ %>
			<img src="resources/images/star/star_3.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=ftdto.getScore()%>
		<%}else if(ftdto.getScore()>2.5){ %>
			<img src="resources/images/star/star_3.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=ftdto.getScore()%>
		<%}else if(ftdto.getScore()>2.0){ %>
			<img src="resources/images/star/star_2.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=ftdto.getScore()%>
		<%}else if((ftdto.getScore()>1.5)){ %>
			<img src="resources/images/star/star_2.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=ftdto.getScore()%>
		<%}else if((ftdto.getScore()>1.5)){ %>
			<img src="resources/images/star/star_1.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=ftdto.getScore()%>
		<%}else if (ftdto.getScore()>1.0){ %>
			<img src="resources/images/star/star_1.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=ftdto.getScore()%>
		<%}else if(ftdto.getScore()>0.5){ %>
			<img src="resources/images/star/star_1.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=ftdto.getScore()%>
		<%}else if(ftdto.getScore()>0){ %>
			<img src="resources/images/star/star_1.0.png" alt="NO Picture"><%=ftdto.getScore()%>
		<%}else{%>
			<span>작성된 후기가 없습니다.</span>
		<%
	
		} 
		%>
						<div class="lst-infor-link">
							자세히 보기<i class="ion-ios-arrow-thin-right"></i>
						</div>
					</div>
				</a>
			</li>
		<%} %>					
	</ul>
</div>
</div>


<form action="FestivalWrite.do" method="post">
<c:if test="${login.auth eq 1 }">
	<input type="submit" value="축제등록" class="btn btn-secondary" style="margin-left: 80%;size: 50px">
	
</c:if>
</form>
					<!-- page include------------------>
		<jsp:include page="paging1.jsp">
			<jsp:param name="actionPath" value="festivalList.do" />
			<jsp:param name="nowPage" value="<%=String.valueOf(paging.getNowPage())%>" />
			<jsp:param name="totalCount" value="<%=String.valueOf(paging.getTotalCount())%>" />
			<jsp:param name="countPerPage" value="<%=String.valueOf(paging.getCountPerPage())%>" />
			<jsp:param name="blockCount" value="<%=String.valueOf(paging.getBlockCount())%>" />

			<jsp:param name="findWord" value="#{findWorld} }" />
			<jsp:param name="choice" value="#{choice}" />
		</jsp:include>
	



<script type="text/javascript">

$(function () {

	$(".seqclick").mousedown(function() {
	location.href="festivalDetail.do?seq="+ $(this).attr("seq");
	/* location.href = "QnADtail?seq=" + $(this).attr("seq"); */
	});
	
	
	$(".seqclick").mouseover(function() {		
		$(this).css("background", "#e0e0e0");
	});
	$(".seqclick").mouseout(function() {
		$(this).css("background", "#ffffff");
	});
	
});

function location_(){
	location.href="festivalList.do";
}

function location__(){
	location.href="endFetival.do";
}
</script>



</body>
</html>










