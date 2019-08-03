<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

body{
font-family: 'Nanum Gothic', sans-serif;
	font-size: 19px;
}
textarea{
font-family: 'Nanum Gothic', sans-serif;
	font-size: 19px;
	padding: 10px;
}
.divList{

	padding-top: 50px;
	padding-bottom: 10%;
	width: 1000px;
	margin: auto;
}
table{
	width: 800px;
	vertical-align: middle;
	 text-align: left; 
	 padding-top: 55px;
	 
}
.divList td{
	height: 60px;

	
}
.divAll{
	width: 1250px;
	margin: auto;
}

#divSub{
	padding-top:40px;
	padding-bottom: 20px;
	border-bottom: 3px black solid;
	
	text-align: right;
}
a{
	text-decoration: none;
	color: black;
}
td,tr{
	border-bottom: 1px gray dotted;
	padding: 15px;
}
#divBack{
	padding-top:10px;
	height:480px; 
	background-color:#fbfbfb;
	padding-bottom: 250px;
	margin: auto;
	margin-bottom: 130px;
}
input{
padding-left: 10px;
	font-size: 17px;
	height: 28px;
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


<div align="center">
<form action="bbsUpdateAf.do">
<div id="divBack">
<table>
<tr>
	<td>작성자</td>
	<td>${bbs.id }
		<input type="hidden" name="id" readonly="readonly" value="${bbs.id }" >
	</td>
</tr>

<tr>
	<td>제목</td>
	<td>
		<input type="text" name="title" value="${bbs.title }" size="70" id="title">
	</td>
</tr>

<tr>
	<td>내용</td>
	<td>
		<textarea rows="14" cols="60" name="content" id="content">${bbs.content }</textarea>
	</td>
</tr>

</table>
<input type="hidden" value="${bbs.seq }" name="seq"> 
<br>
<div>
<input type="image" src="<%=request.getContextPath() %>/resources/images/meetComplete.png" id="complete" style="cursor: pointer; height: 43px; width: 78px;">
<%-- <img src="<%=request.getContextPath() %>/resources/images/meetComplete.png" id="complete" style="cursor: pointer;"> --%>
</form>
<a href="bbsDetail.do?seq=${bbs.seq }">
<img src="<%=request.getContextPath() %>/resources/images/meetCancel.png">
</a>
</div>

</div>

</div>
</div>

<script type="text/javascript">

$("#complete").click(function () {

	if($("#title").val().trim() == null || $("#title").val().trim() == ""){
		
		alert("제목을 입력하세요");
		$("#title").focus();
		return false;
	}
	
	 if($("#content").val().trim() == null || $("#content").val().trim() == ""){
		
		alert("내용을 입력하세요");
		$("#content").focus();
		return false;
	} 
});
</script>

</body>
</html>