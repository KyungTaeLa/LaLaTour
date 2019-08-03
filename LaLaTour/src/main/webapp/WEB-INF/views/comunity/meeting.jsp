<%@page import="lala.com.a.util.pagingBean"%>
<%@page import="lala.com.a.model.MemberDto"%>
<%@page import="lala.com.a.model.MeetingDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>meeting.jsp</title>

<style type="text/css">
body{
font-family: 'Nanum Gothic', sans-serif;
	font-size: 18px;
	
	
}
table{
	width: 1250px;
	text-align: center;
	border: none;
	border-collapse: collapse;
}
tr,td{
	height: 40px;
	border-bottom:  1px gray dotted; 
	color: black;
}
th{
	color:white;
	  background-color:#7882AE; 
	  font-weight: bold;
}
.divList{
	
	padding-bottom: 40px;
	padding-top: 40px;
	
}
a{
	text-decoration: none;
	color: black;
}
#divSub{
	
	padding-bottom: 20px; 
	border-bottom: 3px black solid;
	padding-right: 3px;
}

.main_title{
	padding-top: 20px;
	padding-bottom:0;
	padding-left:30px;
	margin-bottom: 0;
}
.divAll{
	width: 1250px;
	margin: auto;
}
.list_div td{
	padding: 13px;

}
.middleImg{ 
margin-top:60px;
	background-image: url("<%=request.getContextPath() %>/resources/images/backTest.jpg");
	background-repeat: no-repeat;
 	background-size: 100% 230px; 
	height: 230px;
	opacity: 0.9;
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
</head>
<body>

<%
String id = "";
//사용자 세션
 Object ologin = session.getAttribute("login");
MemberDto member = null;
if(ologin != null) {
	  member = (MemberDto)ologin;
	  id = member.getId();
}
 
%>
<%
List<MeetingDto> meetlist = (List<MeetingDto>)request.getAttribute("meetlist");
pagingBean paging = (pagingBean)request.getAttribute("paging");

//검색항목, 검색어
String searchWord = request.getParameter("searchWord");
String choice = request.getParameter("choice");

System.out.println("검색항목:" + choice);
System.out.println("검색어:" + searchWord);


%>
<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
<div class="middleImg">
<h1 class="middleTitle">커뮤니티</h1>
</div>
</div>



<div class="divAll">


<div class="main_title">
<h1>참여 게시판</h1>
</div>
<div id="divSub"  style="text-align: right; width: 100%">
<a href="bbsList.do">자유게시판</a>&nbsp;&nbsp;|&nbsp;
<a href="meeting.do"><b>참여게시판</b></a>
</div>


<br>
<div align="center" class="divList" >
<table class="list_div">
<col width="5%"><col width="20%"><col width="40%"><col width="7%"><col width="11%"><col width="9%"><col width="8%">
<tr>
	<th>번호</th><th>참가축제</th><th>제목</th><th>모집현황</th><th>모집일</th><th>ID</th><th>마감여부</th>
</tr>
<%
if(meetlist.size() == 0 || meetlist == null){
%>
<tr>
	<td colspan="7">작성된 글이 없습니다.</td>
</tr>
<%}else{
		int no = meetlist.size();
		for(int i =0; i<meetlist.size(); i++){
			MeetingDto mlist = meetlist.get(i);
			if(mlist.getDel() == 0){
	%>
	<tr style="border-bottom: 1px gray solid">
	<td><%=no %></td><td><%=mlist.getFtitle() %></td><td><a href="meetDetail.do?seq=<%=mlist.getSeq() %>&id=<%=id %>"><%=mlist.getTitle() %></a></td>
	<td><%=mlist.getUsercnt() %>/<%=mlist.getMaxcnt() %></td>
	<td><%=mlist.getEdate().substring(0, 4) %>-<%=mlist.getEdate().substring(4, 6) %>-<%=mlist.getEdate().substring(6, 8) %></td>
	<td><%=mlist.getId() %></td>
	
	<td>
	<%if(mlist.getProgress() == 1 || mlist.getProgress() == 2) {%>
	<img alt="" src="<%=request.getContextPath() %>/resources/images/end1.png" width="70px" height="40px">
	<%}else {%>
	<img alt="" src="<%=request.getContextPath() %>/resources/images/together.png" width="70px" height="40px">
	<%} %>
	</td>
	
</tr>
<% no--;}} 
}%>

</table>
</div>
<a href="meetWrite.do" style="float: right; clear: both; padding-right: 30px"><!-- 글쓰기 -->
<img src="<%=request.getContextPath() %>/resources/images/meetWriteBtn.png" onclick="return writeChk(<%=id %>)" style="float: right; clear: both; cursor: pointer;">
</a> 
<div align="center" class="divList" ">

<jsp:include page="paging.jsp">
	<jsp:param name="actionPath" value="meeting.do" />
	<jsp:param name="nowPage" value="<%=paging.getNowPage() %>" />
	<jsp:param name="totalCount" value="<%=paging.getTotalCount() %>" />
	<jsp:param name="countPerPage" value="<%=paging.getCountPerPage() %>" />
	<jsp:param name="blockCount" value="<%=paging.getBlockCount() %>" />
	
	<jsp:param name="findWord" value="<%=paging.getFindWord() %>" />
	<jsp:param name="choice" value="<%=paging.getChoice() %>" />
</jsp:include>


<br>



<div style="border-bottom: 2px #7882AE solid; width: 500px;">
<select id="choice" style="vertical-align: middle; height: 35px; border: none; font-size: 16px; text-align: center;" >
<option value="sel">선택</option>
<option value="title">제목</option>
<option value="id">작성자</option>
<option value="content">내용</option>
</select>
<input type="text" id="search" value="${paging.findWord }" style="vertical-align: middle; height: 30px; width: 340px; border: none; font-size: 16px;" placeholder="키워드"  >

<img alt="" src="<%=request.getContextPath() %>/resources/images/search.png" onclick="searchMeet()" style="vertical-align: bottom; cursor: pointer;">

</div>





</div>
</div>


<script type="text/javascript">

function writeChk( id ) {
	if( id == null || id==""){
		alert("로그인 후 이용해주세요");
		return false;
	}
	
};

function searchMeet() {
	var choice = document.getElementById("choice").value;
	var word = $("#search").val();
//	alert(choice);
//	alert(word);
	
	if(word == ""){
		document.getElementById("choice").value = 'sel';		
	}
	
	location.href = "meeting.do?findWord=" + word + "&choice=" + choice;
}
$(document).ready(function () {
	 var choice ="${paging.choice}";
	 if(choice == null || choice == ""){
		choice="sel";
	 }
	$("#choice").val(choice).prop("selected",true); 
	
	
});


</script>




</body>
</html>