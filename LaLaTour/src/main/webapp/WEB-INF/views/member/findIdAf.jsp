<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- local CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login.css">

<title>라라투어 - 아이디찾기</title>
</head>
<body>

<!-- 상단이미지 -->
<div>
	<img alt="" src="<%=request.getContextPath() %>/resources/images/productlisttop.jpg" border="0" style="width: 100%; height: 230px;">
</div>

<div id="outer">
<div id="inner">

<div id="login_container">
	<div id="login_box" style="float: left; width: 600px; height:400px; /* background-color: #f4f4f4; */">
		<div id="uni_container" style="width: 350px; margin: auto;">
			<p style="font-size:25px; font-weight:bold;" class="login">아이디 찾기</p>
			고객님의 정보를 조회한 결과입니다.
			<div class="div_viewId">
	   			<div class="span_viewId">${id}</div>
			</div>
			<div>
	   			<button type="button" id="login_btn" class="login_btn" style="float: left;">로그인 화면</button>
	   			<button type="button" id="_findPwd" class="login_btn" style="float: right;">비밀번호 찾기</button>
			</div>
		</div>
	</div> <!-- end login_box -->
	
	<div id="login_ad_box" style="float:right; width: 600px; height: 400px;">
		<img alt="" src="<%=request.getContextPath()%>/resources/images/member/login_ad1.jpg" style="width: 600px; height: 400px;">
	</div> <!-- end login_ad_box -->
</div> <!-- end login_container -->

</div> <!-- end inner -->
</div> <!-- end outer -->

<script type="text/javascript">
//로그인화면 버튼 클릭
$("#login_btn").click(function() {
	location.href="login.do";
});

//비밀번호 찾기 버튼 클릭
$("#_findPwd").click(function () {
	location.href="findPwd.do";
});
</script>

</body>
</html>
























