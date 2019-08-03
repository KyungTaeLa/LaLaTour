<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
html,body{
height:100%;
}
.myCategory li{
	height:21px;
	margin:10px 0px;
}


</style>
<!-- boot CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<!-- boot js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body >
<div style="background-color: #eeeeee; height:100%;width:100%; min-height: 720px;overflow:hidden; position:relative; ">
<ul class="myCategory" style="padding:0px">
	<li><b>내정보</b></li>
	<ul class="in_ul">
		<li>
			<a href="myPage.do?id=${login.id }"class="left_menu">내정보</a></li>
		<li>
			<a href="myInfoChange.do?id=${login.id }"class="left_menu">내 정보 수정</a>
		</li>
		<li><a href="myMemberDrop.do?id=${login.id }"class="left_menu">회원탈퇴</a></li>
	</ul>
	<hr class="hrBar">
	<li><b>타임라인</b></li>
	<ul>
		<li>
			<a href="myCalendar.do?id=${login.id }" class="left_menu">캘린더</a>
		</li>
		<li><a href="myReserveList.do?id=${login.id }"class="left_menu">리스트</a></li>
		<li><a href="MyWriteReply.do?id=${login.id }"class="left_menu">작성한 댓글</a></li>
		<li><a href="MyWriteReview.do?id=${login.id }"class="left_menu">내가쓴글</a></li>
	</ul>
	<hr class="hrBar">
	<li><b>마이쇼핑</b></li>
	<ul>
		<li><a href="sellList.do"class="left_menu">주문내역</a></li>
		<li><a href="cartlist.do?id=${login.id }"class="left_menu">장바구니</a></li>
	</ul>
</ul>
</div>
</body>
</html>