<%@page import="lala.com.a.model.QuestionDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>    

<!DOCTYPE html>
<html>
<head>
<!-- local CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login.css">

<style type="text/css">
/* .q_title{
	display: none;
}
.email{
	display: none;
} */
.middleImg{ 
margin-top:60px;
	background-image: url("<%=request.getContextPath() %>/resources/images/joinMiddle.jpg");
	background-repeat: no-repeat;
 	background-size: 100% 230px; 
	height: 230px;
	opacity: 0.9; 
}
.middleTitle{
	color: black;
	text-align: center;
padding-top: 85px;
font-size: 45px;

}
.middleAll{
margin-top: 100px;
}
</style>
<meta charset="UTF-8">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<%
List<QuestionDto> qlist = (List<QuestionDto>)request.getAttribute("qlist");
%>
</head>
<body>

<!-- <input type="checkbox" id="saveid">id저장 -->

<!-- 상단이미지 -->
<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
<div class="middleImg">
<h1 class="middleTitle">비밀번호 찾기</h1>
</div>
</div>

<div id="outer">
<div id="inner">

<div id="login_container">
	<div id="login_box" style="float: left; width: 600px; /* height:400px; */ /* background-color: #f4f4f4; */">
		<div id="uni_container" style="width: 350px; margin: auto;">
			<p style="font-size:25px; font-weight:bold;" class="login">비밀번호 찾기</p>
			<div style="margin-bottom: 10px;">
	   			<input type="text" name="id" id="id" class="login_input" placeholder="아이디 입력">
			</div>
			<div id="search" style="margin-bottom: 10px;">
	   			<input type="radio" value="questions" name="way" id="question" checked="checked">질문으로 찾기
				<input type="radio" value="emails" name="way" id="send_email">이메일로 받기
			</div>
			<div id="questions">
				<form action="findPwdAf1.do" method="post" id="questionsFrm">
					<select class="select_question" name="question">
						<c:forEach items="${qlist}" var="que">
							<option value="${que.seq}">${que.title}</option>
						</c:forEach>
					</select>
					<input type="text" name="answer" id="answer" class="login_input" placeholder="답변 입력"><br>
					<input type="hidden" name="id" id="qId">
					<button type="button" id="qok" class="login_btn">비밀번호 찾기</button>
				</form> 
			</div>
			<div id="emails" style="display: none;">
				<form action="findPwdAf2.do" method="post" id="emailsFrm">
					<input type="text" placeholder="이메일을 입력하세요" name="email" id="email" class="login_input">
					<input type="hidden" name="id" id="emailId">
					<button type="button" class="login_btn" id="email_ok">이메일로 전송</button>
				</form>
			</div>
		</div>
	</div> <!-- end login_box -->
	
	<div id="login_ad_box" style="float:right; width: 600px; height: 400px;">
		<img alt="" src="<%=request.getContextPath()%>/resources/images/member/login_ad1.jpg" style="width: 600px; height: 400px;">
	</div> <!-- end login_ad_box -->
</div> <!-- end login_container -->






<%-- 아이디:<input type="text" id="id"><br>
<input type="radio" value="질문으로찾기" name="way" id="question">질문으로찾기
<input type="radio" value="이메일전송" name="way" id="send_email">이메일전송

<br>
<form action="findPwdAf1.do" method="post">
<select class="q_title" style="display: none;" name="question">
	<%for(int i =0; i<qlist.size(); i++){ %>
		<option value="<%=qlist.get(i).getSeq() %>"><%=qlist.get(i).getTitle() %></option>
	<%} %>
</select>
<input type="text" name="answer" class="q_title"><br>
<input type="hidden" name="id" id="qId">
<input type="submit" value="확인" class="q_title" id="qok">
 </form> 
 
 
 <form action="findPwdAf2.do" method="post">
<input type="text" value="이메일을 입력하세요." name="email" class="email" id="email">
<input type="hidden" name="id" id="emailId">
<input type="submit" value="전송" class="email" id="email_ok">
 </form> --%>


</div> <!-- end inner -->
</div> <!-- end outer -->
 
 
<script type="text/javascript">

//질문누르면 이메일 안보임
$("#question").click(function() {
	$("#emails").hide();
	$("#questions").show();
});

//이메일누르면 질문 안보임
$("#send_email").click(function() {
	$("#questions").hide();
	$("#emails").show();
	
	$("#email").click(function() {
		$("#email").val("");
	});
});

$("#qok").click(function name() {
	if( $("#id").val().trim()=="" ) {
		alert("아이디를 입력하세요");
		return;
	}
	if( $("#answer").val().trim()=="" ) {
		alert("답변을 입력하세요");
		return;
	}
	$("#qId").val( $("#id").val() );
	$("#questionsFrm").submit();
});

//이메일전송시 id값가져옴
$("#email_ok").click(function() {
	if( $("#id").val().trim()=="" ) {
		alert("아이디를 입력하세요");
		return;
	}
	if( $("#email").val().trim()=="" ) {
		alert("이메일 주소를 입력하세요");
		return;
	}
	$("#emailId").val( $("#id").val() );
	$("#emailsFrm").submit();
});


</script>



</body>
</html>























