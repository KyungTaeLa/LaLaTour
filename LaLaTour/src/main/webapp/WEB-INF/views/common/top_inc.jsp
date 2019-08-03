<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/layout_css.css">


<jsp:useBean id="nows" class="java.util.Date"/>

<div class="_top_inc">
<ul>
   <c:if test="${login.id eq '' or empty login}">
      <li><a href="join.do" class="_top" title="회원가입">회원가입</a></li>
      <li><a href="login.do" class="_top title="로그인">로그인</a></li>
   </c:if>
   
   <c:if test="${login.auth eq '0'}">
      <li><a href="myPage.do" class="_top" title="마이페이지">마이페이지</a></li>
      <li><a href="logout.do" title="로그아웃" class="_top">로그아웃</a></li>
   </c:if>
   
   <c:if test="${login.auth eq '1'}">
      <li><a href="admin.do" class="_top" title="관리페이지">관리페이지</a></li>
      <li><a href="logout.do" class="_top" title="로그아웃">로그아웃</a></li>
   </c:if>
   
   <c:if test="${login.id ne '' and not empty login}">
      <li>[${login.id}]님</li>
   </c:if>
   
   

</ul>
</div>
<!-- </div> -->
<!-- </div>
</div>
 -->
