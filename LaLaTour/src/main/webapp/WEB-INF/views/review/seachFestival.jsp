<%@page import="lala.com.a.model.FestivalDto"%>
<%@page import="lala.com.a.util.pagingBean"%>
<%@page import="java.util.List"%>
<%@page import="lala.com.a.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/resources/css/festivalList.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/festivalList.css"> 
</head>
<body onload="window.resizeTo(1000,400)">
<h3 >
축제를 선택하세요
</h3>
<%


 List<FestivalDto> list = (List<FestivalDto>)request.getAttribute("list"); 
 pagingBean paging = (pagingBean)request.getAttribute("paging");
 Object ologin = session.getAttribute("login");
 MemberDto member = null;
 if(ologin != null) {
 	  member = (MemberDto)ologin;
 }

%>



<!-- 전체 div -->
<div class="main">
	<div class="container-inner" style="width:70% ;margin-left: 15%">
	<p class="location-lst">
	 <span>	&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;라라투어</span>
		 <span>축제&amp;행사</span>
		 <span>축제후기</span> 
		 <span>축제후기 수정</span>
		 <span class="active">축제선택</span>  
		 <input type="button" class="btn btn-outline-dark" onclick="location_()" value="뒤로가기">
	</p>
	
	<!-- 사진 리스트 -->
	<ul class="lst-type-thumnail active">
			<!-- 인터파크 이벤트 컨텐츠 노출 제외 조건 추가   17007909 -->
<%
			for(int i =0 ; i < list.size() ; i++){
			FestivalDto ftdto = list.get(i);
%>
				<li>
					<a href="#" class="seqclick" seq=<%=ftdto.getSeq() %>>
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
</form>
		











<br><br><br><br><br>

					<!-- page include------------------>
		<jsp:include page="paging1.jsp">
			<jsp:param name="actionPath" value="festivalSeach.do" />
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
		
	location.href="seachFestival1.do?seq="+ $(this).attr("seq");
	<%-- location.href="seachFestivalUp.do?seq="+ $(this).attr("seq")+"&pseq="+<%=pseq%>; --%>
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
	location.href="reivewWrite.do";
}

function location__(){
	location.href="endFetival.do";
}
</script>
</body>
</html>