<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<!-- local CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login.css">
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
<title>라라투어 - 로그인</title>


</head>
<body style="margin:0px">


<%
String alertMsg = request.getParameter("alertMsg");
if( !(alertMsg==null || alertMsg.equals("")) ) {
   %>
   <script type="text/javascript">
   alert("<%=alertMsg %>");
  // location.href = "login.jsp";
   </script>
   <%
}
%>
<!-- <input type="checkbox" id="saveid">id저장 -->

<!-- 상단이미지 -->
<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
<div class="middleImg">
<h1 class="middleTitle">로그인</h1>
</div>
</div>

<div id="outer">
<div id="inner">

<div id="login_container">
	<div id="login_box" style="float: left; width: 600px; height:400px; /* background-color: #f4f4f4; */">
		<div id="uni_container" style="width: 350px; margin: auto;">
			<p style="font-size:25px; font-weight:bold;" class="login">라라투어 로그인</p>
			<!-- <div style="width:200px; margin:30px auto;"> -->
		   		<form action="loginaf.do" method="post" onsubmit="return check()">
					<div>
			   			<input type="text" name="id" id="id" class="login_input" placeholder="아이디 입력">
					</div>
					<div>
			   			<input type="password" name="pwd" id="pwd" class="login_input" style="margin-top: 10px;" placeholder="비밀번호 입력">
					</div>   
					<div>
			   			<!-- <input type="image" src="./images/main/login_btn.png" style="margin-top:20px;"> -->
			   			<button type="submit" id="_loginBtn" class="login_btn">라라투어 로그인</button>
					</div>   
					<div style="margin-top:20px;">
			   			<!-- <a href="../member/join.jsp" style="font-weight:bold; color:#626262;" class="joinbox">· 회원가입</a> -->
			   			<div style="float: left;">
			   				<a id="_joinBtn" class="login_text">회원가입</a>
			   			</div>
			   			<div style="float: right;">
			   				<a id="_findId" class="login_text">아이디</a>·
			   				<a id="_findPwd" class="login_text">비밀번호찾기</a>
			   			</div>
			   			<!-- <button type="button" id="_joinBtn" class="login_joinBtn">회원가입</button>
			   			<button type="button" id="findId">아이디찾기</button>
			   			<button type="button" id="findPwd">비밀번호찾기</button> -->
					</div>
		      	</form>
			<!-- </div> -->
		</div>
	</div> <!-- end login_box -->
	
	<div id="login_ad_box" style="float:right; width: 600px; height: 400px;">
		<img alt="" src="<%=request.getContextPath()%>/resources/images/member/login_ad1.jpg" style="width: 600px; height: 400px;">
	</div> <!-- end login_ad_box -->
</div> <!-- end login_container -->


</div> <!-- end inner -->
</div> <!-- end outer -->



<script type="text/javascript">
$(function() {
	// 쿠키생성 - 키값: user_id
	//var user_id = $.cookie("user_id");

	//지정된 쿠키가있을 때,
	//텍스트박스에 적어놓고, 체크박스도 체크해 놓는다.
	if($.cookie("user_id") != null) {
        alert("저장된 쿠키가 있음");
        $("#id").val( $.cookie("user_id") );
		$("#saveid").attr("checked", "checked");
	}

	//체크박스 눌렀을 때
	$("#saveid").click(function() {
        // 클릭을 했는데 체크박스에 체크가 됐을 때때
        //if($("input:checkbox[id='chk_save_id']").is(":checked"))
		if( $("#saveid").is(":checked") ) {
			// 아이디를 안썼으면, 체크해제
			if($("#id").val().trim()==""){
				alert("id를 입력하세요.");
				$("#saveid").prop("checked", false);
			}
         	// 아이디가 적혔으면 쿠키에 저장
         	else {
				// 7일동안 유지, 어느경로던 받아들이겠다.
              	// user_id로 id의 value를 받겠다.
              	$.cookie("user_id", $("#id").val().trim(), {expires:7, path:"/"});
         	}
		}
		// 클릭했는데 체크가 없어짐
		// 그렇다면 세션삭제
		else {
			$.removeCookie("user_id", {path:"/"});
		}
	});
});

function check() {
   	if($("#id").val().trim()=="") {
		alert("ID를 입력해야 합니다.");
      	$("#id").focus();
      	return false;
   	}
   	if($("#pwd").val().trim()=="") {
      	alert("비밀번호를 입력해야 합니다.");
      	$("#pwd").focus();
      	return false;
   	}

   return true;
}

//회원가입 클릭
$("#_joinBtn").click(function() {
	location.href="join.do";
});

//아이디 찾기 클릭
$("#_findId").click(function () {
	location.href="findId.do";
});

//비밀번호 찾기 클릭
$("#_findPwd").click(function () {
	location.href="findPwd.do";
});

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


