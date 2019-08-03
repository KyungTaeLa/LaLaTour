<%@page import="lala.com.a.util.pagingBean"%>
<%@page import="lala.com.a.model.PdsDto"%>
<%@page import="lala.com.a.model.MemberDto"%>
<%@page import="lala.com.a.model.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
	background-image: url("<%=request.getContextPath() %>/resources/images/DMZ5.JPG");
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>


<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/resources/css/reviewList.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reviewList.css"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<body>
<%
List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("list");
List<PdsDto> plist = (List<PdsDto>)request.getAttribute("plist");
ArrayList thumbnail = new ArrayList();
pagingBean paging = (pagingBean)request.getAttribute("paging");
thumbnail = (ArrayList)(request.getAttribute("thumbnail"));
		
Object object = session.getAttribute("login");
MemberDto login = null;
if(object!=null){
	login = (MemberDto)object;
}




%>
<!-- 전체 다이브 -->
<!-- <img src="resources/images/Festival.jpg" alt="NO Picture" style="width: 100%;height: 230px"> -->
	<!-- 텍스트랑 이미지묶는거 -->
	<div class="middleAll">
		<div class="middleImg">
			<h1 class="middleTitle">축제후기 게시판</h1>
		</div>
	</div>

<div class="sub-container" id="sub-container-type1">
<form action="reviewList.do" method="post">
	<!-- filter -->
	 	<div class="filter-wrap ticket" style="width:110%;margin-left: -6%" >
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
							  		<button class="" type="submit" style="background-image: resources/images/search.png;background-color: white;    background-size: 30px 30px">
							  			<span class="hd-element">키워드 검색 버튼</span>
							  		</button>							  		
					</div>					
				</div> 
			</div>
					<div class="filter-right">
			<input type="button" class="btn btn-light" onclick = "location_()" value="전체후기">
			</div>
		</div> 
	</form><!--// filter -->


	<!-- container-inner -->
	<div class="container-inner">
		<p class="location-lst">
			<span>LaLaTour</span>
		<span class="active">축제후기</span>
		</p>
		<ul  class="lst-type-card ">
					<%for(int i =0;i<list.size();i++){ 
						ReviewDto dto = list.get(i);
					%>
			<li>
				<a href="#" onclick="loc_detail(<%=dto.getSeq()%>,<%=dto.getPseq()%>,'<%=dto.getFtitle()%>','<%=dto.getTitle()%>',
							'<%=dto.getPlace()%>','<%=dto.getSdate()%>','<%=dto.getEdate()%>','<%=dto.getId() %>')">
					<div class="img-cont">
						<img alt="사진없음" src="<%=request.getContextPath()%>/upload/<%=thumbnail.get(i)%>">
					</div>
						<div class="lst-infor-wrap">
							<div class="lst-infor-title">[<%=dto.getPlace()%>][<%=dto.getFtitle() %>]</div>
							<div class="lst-infor-title"><%=dto.getTitle() %></div>
							<p class="advisor">
		<%if(dto.getScore()>4.5){ %>
			<img src="resources/images/star/star_5.0.png" alt="NO Picture" style="width:100px; height:20px;">
		<%}else if(dto.getScore()>4){ %>
			<img src="resources/images/star/star_4.5.png" alt="NO Picture" style="width:100px; height:20px;">
		<%}else if(dto.getScore()>3.5){ %>
			<img src="resources/images/star/star_4.0.png" alt="NO Picture" style="width:100px; height:20px;">
		<%}else if(dto.getScore()>3){ %>
			<img src="resources/images/star/star_3.5.png" alt="NO Picture" style="width:100px; height:20px;">
		<%}else if(dto.getScore()>2.5){ %>
			<img src="resources/images/star/star_3.0.png" alt="NO Picture" style="width:100px; height:20px;">
		<%}else if(dto.getScore()>2.0){ %>
			<img src="resources/images/star/star_2.5.png" alt="NO Picture" style="width:100px; height:20px;">
		<%}else if(dto.getScore()>1.5){ %>
			<img src="resources/images/star/star_2.0.png" alt="NO Picture" style="width:100px; height:20px;">
		<%}else if(dto.getScore()>1.5){ %>
			<img src="resources/images/star/star_1.5.png" alt="NO Picture" style="width:100px; height:20px;">
		<%}else if (dto.getScore()>1.0){ %>
			<img src="resources/images/star/star_1.5.png" alt="NO Picture" style="width:100px; height:20px;">
		<%}else if(dto.getScore()>0.5){ %>
			<img src="resources/images/star/star_1.0.png" alt="NO Picture" style="width:100px; height:20px;">
		<%}else if(dto.getScore()>0){ %>
			<img src="resources/images/star/star_0.5.png" alt="NO Picture">
		<%}%>
								<span class="demilight fc-grey3"><%=dto.getScore() %>점</span>
							</p>
							<div class="lst-infor-link" style="height: 40px">
								자세히 보기<i class="ion-ios-arrow-thin-right"></i>
							</div>
						</div>
						<div class="ico-arrow"><span></span></div>
					</a>
				</li>
					<%}%>
			</ul>
		</div>
	</div>
			

<table>
	<tr>
	
	</tr>

</table>


<c:if test="${empty list }">
	<tr>
		<td colspan="5" align="center">
			<font color="red">작성된 글이 없습니다.</font>
		</td>
	</tr>
</c:if>

<%-- 
<c:if test="${!empty list }">


<table>
<th>#</th> <th>별점</th> <th>작성자</th> <th>title</th> <th>작성일</th> <th>축제기간</th>
<%for(int i =0;i<list.size();i++){ 
	ReviewDto dto = list.get(i);
%>
	<tr onclick="loc_detail(<%=dto.getSeq()%>,<%=dto.getPseq()%>,'<%=dto.getFtitle()%>','<%=dto.getTitle()%>',
							'<%=dto.getPlace()%>','<%=dto.getSdate()%>','<%=dto.getEdate()%>','<%=dto.getId() %>')">
		<td><%=i %></td>
		
		
		<%if(dto.getScore()>4.5){ %>
			<td><img src="resources/images/star/star_5.0.png" alt="NO Picture"><%=dto.getScore()%></td>
		<%}else if(dto.getScore()>4){ %>
			<td><img src="resources/images/star/star_4.5.png" alt="NO Picture"><%=dto.getScore()%></td>
		<%}else if(dto.getScore()>3.5){ %>
			<td><img src="resources/images/star/star_4.0.png" alt="NO Picture"><%=dto.getScore()%></td>
		<%}else if(dto.getScore()>3){ %>
			<td><img src="resources/images/star/star_3.5.png" alt="NO Picture"><%=dto.getScore()%></td>
		<%}else if(dto.getScore()>2.5){ %>
			<td><img src="resources/images/star/star_3.0.png" alt="NO Picture"><%=dto.getScore()%></td>
		<%}else if(dto.getScore()>2.0){ %>
			<td><img src="resources/images/star/star_2.5.png" alt="NO Picture"><%=dto.getScore()%></td>
		<%}else if((dto.getScore()>1.5)){ %>
			<td><img src="resources/images/star/star_2.0.png" alt="NO Picture"><%=dto.getScore()%></td>
		<%}else if((dto.getScore()>1.5)){ %>
			<td><img src="resources/images/star/star_1.5.png" alt="NO Picture"><%=dto.getScore()%></td>
		<%}else if (dto.getScore()>1.0){ %>
			<td><img src="resources/images/star/star_1.5.png" alt="NO Picture"><%=dto.getScore()%></td>
		<%}else if(dto.getScore()>0.5){ %>
			<td><img src="resources/images/star/star_1.0.png" alt="NO Picture"><%=dto.getScore()%></td>
		<%}else if(dto.getScore()>0){ %>
			<td><img src="resources/images/star/star_1.0.png" alt="NO Picture"><%=dto.getScore()%></td>
		<%} %>
		<td><%=dto.getId() %></td>
		<td><%=dto.getPlace() %><%=dto.getFtitle()%><%=dto.getTitle() %></td>
		<td><%=dto.getWdate() %></td>
		<td><%=dto.getSdate() %>~<%=dto.getEdate() %></td>
	</tr>

<%} %>


</table>
</c:if>
 --%>
<c:if test="${login ne null }">
	<input type="button" value="글쓰기" onclick="reivewWrite()"  class="btn btn-secondary" style="margin-left: 78%;size: 50px">
</c:if>
 					<!-- page include------------------>
		<jsp:include page="paging1.jsp">
			<jsp:param name="actionPath" value="reviewList.do" />
			<jsp:param name="nowPage" value="<%=String.valueOf(paging.getNowPage())%>" />
			<jsp:param name="totalCount" value="<%=String.valueOf(paging.getTotalCount())%>" />
			<jsp:param name="countPerPage" value="<%=String.valueOf(paging.getCountPerPage())%>" />
			<jsp:param name="blockCount" value="<%=String.valueOf(paging.getBlockCount())%>" />

			<jsp:param name="findWord" value="#{findWorld} }" />
			<jsp:param name="choice" value="#{choice}" />
		</jsp:include>
 

<!-- 디테일 포스트 폼 -->
<form action="reviewDetail.do" method="post" id="detail_frm">
	<input type="hidden" name="seq" id="seq" value="">
	<input type="hidden" id="pseq" value="">
	<input type="hidden" name="ftitle" id="ftitle" value="">
	<input type="hidden" name="title" id="title" value="">
	<input type="hidden" name="place" id="place" value="">
	<input type="hidden" name="sdate" id="sdate" value="">
	<input type="hidden" name="edate" id="edate" value="">
	<input type="hidden" name="id" id="id" value="">				
</form>

<script type="text/javascript">
function reivewWrite(){
	location.href="reivewWrite.do";
}


function loc_detail(seq , pseq , ftitle , title , place , sdate , edate , id){
	
	$("#seq").val(seq);
	$("#pseq").val(pseq);
	$("#ftitle").val(ftitle);
	$("#title").val(title);
	$("#place").val(place);
	$("#sdate").val(sdate);
	$("#edate").val(edate);
	$("#id").val(id);
	$("#detail_frm").submit();
}
function location_(){
	location.href="reviewList.do"
}
</script>



</body>
</html>






