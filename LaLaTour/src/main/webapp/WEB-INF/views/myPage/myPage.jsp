<%@page import="lala.com.a.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
//사용자 세션
Object ologin = session.getAttribute("login");
MemberDto member = null;
if(ologin==null) {
   %>
 <script type="text/javascript">
   alert("로그인을 해주세요.");
   location.href="login.do";
  </script>
   <%
}
else {
   member = (MemberDto)ologin;
   
}
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/myPage.css">
</head>
<body>

<div class="main_container">
	<p id="top_info">내 정보</p>
	<hr style="border:1px solid gray">
	<div class="info_div">
		<table class="info_tb">
		<colgroup>
			<col width="300px"><col width="*">
		</colgroup>
			<tr>
				<th>아이디</th><td>${login.id }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${login.name }</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${login.phone }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					${login.email }
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					${login.address }
				</td>
				
			</tr>
		</table>
	</div>
	
</div>
</body>
</html>