<%@page import="lala.com.a.util.pagingBean"%>
<%@page import="lala.com.a.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- https://kin.naver.com/qna/detail.nhn?d1id=1&dirId=1040201&docId=68609270&qb=ZWztg5zqt7ggc3ViU3RyaW5n&enc=utf8&section=kin&rank=1&search_sort=0&spq=0&pid=UMgkEspVuFRssaVW3Hossssstpd-333537&sid=6s56/szyfNwKExuncD7KUQ%3D%3D -->
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
font-family: 'Nanum Gothic', sans-serif;
	font-size: 18px;
	
}
table{
	width: 1250px;
	text-align: center;
	border:none;
	border-collapse: collapse;
	
}
tr,td{
	height: 40px;
	border-bottom:  1px gray dotted; 
	color: black;
	padding: 13px;
}
th{
	 border-bottom:  1px #424242 solid;  
	  color:#424242;
	  background-color:white; 
	  font-weight: bold;
}
.divList{
	
	padding-bottom: 40px;
	padding-top: 40px;
	
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
a{
	text-decoration: none;
	color: black;
}
#divSub{
		padding-bottom: 20px; 
	border-bottom: 3px black solid;
	padding-right: 3px;
}
#trNotice{
	color: red;
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
<meta charset="UTF-8">
<%
pagingBean paging = (pagingBean)request.getAttribute("paging");
//검색항목, 검색어
String searchWord = request.getParameter("searchWord");
String choice = request.getParameter("choice");

String id = "";
//사용자 세션
Object ologin = session.getAttribute("login");
MemberDto member = null;
if(ologin != null) {
	  member = (MemberDto)ologin;
	  id = member.getId();
}
%>

</head>
<body>
<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
<div class="middleImg">
<h1 class="middleTitle">커뮤니티</h1>
</div>
</div>

<div class="divAll">
<div class="main_title">
<h1>자유 게시판</h1>
</div>
<div id="divSub"  style="text-align: right; width: 100%">
<a href="bbsList.do"><b>자유게시판</b></a>&nbsp;&nbsp;|&nbsp;
<a href="meeting.do">참여게시판</a>
</div>

<div align="center" class="divList">
<table>
<col width="10%"><col width="40%"><col width="20%"><col width="20%">
<tr>
	<th>번호</th><th>제목</th><th>아이디</th><th>작성일</th>
</tr>
<c:if test="${bbslist.size() eq '0' or empty bbslist}">
<tr>
	<td colspan="4" align="center">작성된 글이 없습니다</td>
</tr>
</c:if>
<c:if test="${bbslist.size()>0}">
<c:set value="${paging.startNum-authSize }" var="no"/>
<c:forEach items="${bbslist}" var="bbs">
<c:if test="${bbs.del eq 0 }">
<c:if test="${bbs.auth eq 1 }">
<tr id="trNotice" style="background-color: #EEEDE6;">
<td style="color: #F01928; background-color: #EEEDE6;"><b>공지사항</b></td>
</c:if>
<c:if test="${bbs.auth eq 0 }">
<tr>
	<td>${no }</td>
</c:if>
<c:set value="${no-1 }" var="no"/>
	<c:if test="${bbs.auth eq 1 }">
	<td style="background-color: #EEEDE6;">
	<a href="bbsDetail.do?seq=${bbs.seq }" style="color: #F01928;"><b>${bbs.title }</b></a>
	</td>
	</c:if>
	
	
	<c:if test="${bbs.auth eq 0 }">
	<td>
	<a href="bbsDetail.do?seq=${bbs.seq }">${bbs.title }</a>
	</td>
	</c:if>
	
	
	<c:if test="${bbs.auth eq 1 }">
	<td style="color: #F01928; background-color: #EEEDE6;"><b>${bbs.id }</b></td>
	</c:if>
	
	<c:if test="${bbs.auth eq 0 }">
	<td>${bbs.id }</td>
	</c:if>
	
	<c:if test="${bbs.auth eq 1 }">
	<td style="color: #F01928; background-color: #EEEDE6;"><b>20${fn:substring(bbs.wdate,0,2) }-${fn:substring(bbs.wdate,3,5) }-${fn:substring(bbs.wdate,6,8) }</b></td>
	</c:if>
	
	<c:if test="${bbs.auth eq 0 }">
	<td>20${fn:substring(bbs.wdate,0,2) }-${fn:substring(bbs.wdate,3,5) }-${fn:substring(bbs.wdate,6,8) }</td>
	</c:if>
</tr>
</c:if>

</c:forEach>
</c:if>


</table>
</div>



<a href="bbsWrite.do" style="float: right; clear: both; padding-right: 30px">
<img src="<%=request.getContextPath() %>/resources/images/meetWriteBtn.png" style="float: right; clear: both; cursor: pointer; "onclick="return writeChk(<%=id %>)">
</a> 

<div align="center" class="divList" ">

<jsp:include page="paging.jsp">
	<jsp:param name="actionPath" value="bbsList.do" />
	<jsp:param name="nowPage" value="<%=paging.getNowPage() %>" />
	<jsp:param name="totalCount" value="<%=paging.getTotalCount() %>" />
	<jsp:param name="countPerPage" value="<%=paging.getCountPerPage() %>" />
	<jsp:param name="blockCount" value="<%=paging.getBlockCount() %>" />
	
	<jsp:param name="findWord" value="<%=paging.getFindWord() %>" />
	<jsp:param name="choice" value="<%=paging.getChoice() %>" />
</jsp:include>


<br>



<div style="border-bottom: 2px black solid; width: 500px;">
<select id="choice" style="vertical-align: middle; height: 35px; border: none; font-size: 16px; text-align: center;" >
<option value="sel">선택</option>
<option value="title">제목</option>
<option value="writer">작성자</option>
<option value="content">내용</option>
</select>
<input type="text" id="search" value="" style="vertical-align: middle; height: 30px; width: 340px; border: none; font-size: 16px;" placeholder="키워드"  >

<img alt="" src="<%=request.getContextPath() %>/resources/images/search.png" onclick="searchMeet()" style="vertical-align: bottom; cursor: pointer;">

</div>





</div>
</div>

<script type="text/javascript">
function searchMeet() {
	var choice = document.getElementById("choice").value;
	var word = $("#search").val();
//	alert(choice);
//	alert(word);
	
	if(word == ""){
		document.getElementById("choice").value = 'sel';		
	}
	
	location.href = "bbsList.do?findWord=" + word + "&choice=" + choice;
}

function writeChk( id ) {
	if( id == null || id==""){
		alert("로그인 후 이용해주세요");
		return false;
	}
	
};


</script>




</body>
</html>