<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- local CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin.css">

<style type="text/css">

</style>


<!-- boot CSS -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->

<!-- boot js -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->

<!-- local CSS -->
<!-- <link rel="stylesheet" href="css/bbs.css"> -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"></script> -->
<script type="text/javascript" src="//cdn.poesis.kr/post/popup.min.js" charset="UTF-8"></script>
<!-- <script src="//cdn.poesis.kr/post/search.min.js"></script> -->

<title>라라투어</title>
</head>

<body>

<div id="outer" style="margin: 50px 0px 0px 50px;">
<div id="inner">

<div id="div1250" style="width: 1250px;">
<div class="divTop" style="margin-bottom: 20px;">
	<span class="adminTitle">관리자 정보</span>
</div>

<form action="adminUpdate.do" method="post" onsubmit="return check()">
<input type="hidden" name="id" value="${admin.id }">
<table class="basic colline" id="blueTable">
<colgroup>
	<col width="300px"><col width="950px">
</colgroup>

<tbody>
<tr>
	<th>아이디</th>
	<td>${admin.id }</td>
</tr>
<tr>
	<th>비밀번호</th>
	<td>${admin.pwd }</td>
</tr>
<!-- <tr>
	<th>비밀번호 재확인</th>
	<td>
		<input type="password" name="pwd2" id="pwd2" class="join_input">
		<span id="redMsg"></span>
	</td>
</tr> -->
<tr>
	<th>이름</th>
	<td>${admin.name }</td>
</tr>
<tr>
	<th>이메일</th>
	<td>${admin.email }</td>
</tr>
<tr>
	<th>연락처</th>
	<td>${admin.phone }</td>
</tr>
<tr>
	<th>비밀번호 질문</th>
	<td>${admin.title }</td>
</tr>
<tr>
	<th>질문 답변</th>
	<td>${admin.answer }</td>
</tr>
<tr>
   <th>주소</th>
   <td>${admin.address }</td>
</tr>
</tbody>
</table><br>

<div id="joinBtnDiv" style="text-align: center;">
	<button type="submit" id="_updateBtn" class="blue_Btn width250">정보수정</button>
	<button type="button" id="_delBtn" class="blue_Btn width250">삭제</button>
</div>

</form>
</div> <!-- end div1100 -->

</div> <!-- end inner -->
</div> <!-- end outer -->


<script type="text/javascript">


</script>

</body>
</html>