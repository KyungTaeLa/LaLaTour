<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
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
<title>라라투어 - 아이디찾기</title>
</head>

<!-- local CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login.css">

<body>

<!-- 상단이미지 -->
<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
<div class="middleImg">
<h1 class="middleTitle">아이디 찾기</h1>
</div>
</div>

<div id="outer">
<div id="inner">

<div id="login_container">
	<div id="login_box" style="float: left; width: 600px; height:400px; /* background-color: #f4f4f4; */">
		<div id="uni_container" style="width: 350px; margin: auto;">
			<p style="font-size:25px; font-weight:bold;" class="login">아이디 찾기</p>
			<!-- <div style="width:200px; margin:30px auto;"> -->
		   		<form action="findIdAf.do" method="post" onsubmit="return check()">
					<div>
			   			<input type="text" name="name" id="name" class="login_input" placeholder="이름 입력">
					</div>
					<div>
			   			<input type="text" name="email" id="email" class="login_input" style="margin-top: 10px;" placeholder="이메일 입력">
					</div>   
					<div>
			   			<button type="submit" id="_searchBtn" class="login_btn">아이디 찾기</button>
					</div>   
					<div style="margin-top:20px;">
			   			<div style="float: left;">
			   				<a id="_joinBtn" class="login_text" href="login.do">로그인하기</a>
			   			</div>
					</div>
		      	</form>
			<!-- </div> -->
		</div>
	</div> <!-- end login_box -->
	
	<div id="login_ad_box" style="float:right; width: 600px; height: 400px;">
		<img alt="" src="<%=request.getContextPath()%>/resources/images/member/login_ad1.jpg" style="width: 600px; height: 400px;">
	</div> <!-- end login_ad_box -->
</div> <!-- end login_container -->


<!-- <form action="findIdAf.do">
아이디 찾기<br>
이름:<input type="text" name="name" id="name"><br>
이메일:<input type="text" name="email" id="email">
<br>
<input type="submit" value="확인">
</form> -->


</div> <!-- end inner -->
</div> <!-- end outer -->

<script type="text/javascript">
function check() {
	if( $("#name").val().trim()=="" ) {
		alert("이름을 입력해야 합니다.");
		return false;
	}
	if( $("#email").val().trim()=="" ) {
		alert("이메일 주소를 입력해야 합니다.");
		return false;
	}
}

//위 세가지 텍스트에 마우스 hover 효과
$(document).on("mouseover", ".login_text", function() {
	$(this).addClass("textBold");
});
$(document).on("mouseout", ".login_text", function() {
	$(this).removeClass("textBold");
});
</script>

</body>
</html>


















