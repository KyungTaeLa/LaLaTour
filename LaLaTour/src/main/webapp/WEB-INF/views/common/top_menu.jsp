<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />

<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/top_menu.css">
    
 <script src="<%=request.getContextPath()%>/resources/js/top_menu.js"></script> 


<style>
.at a:link {
   color: black;
   text-decoration: none;
}

.at  a:visited {
   color: black;
   text-decoration: none;
}

.at  a:hover {
   color: gray;
   text-decoration: none;
}
</style>
<%-- <div>
<img alt="" src="<%=request.getContextPath()%>/resources/images/lo.png" style="height: 90px; width: 400px;">
</div> --%>
<div class='zeta-menu-bar'>
   <a href="mainpage.do"><img alt="" src="<%=request.getContextPath()%>/resources/images/lo.png" style="height: 90px; width: 400px;"></a>
  <ul class="zeta-menu" style="background-color: white">
      <img alt="" src="resources/images/fanalLogo.png" style="width:330px;height: 73px;
      position: absolute;border: 100px;top: 70px;left: 60px; cursor: pointer" id="mainLogoImg"
      onclick="location.href='mainpage.do'" >   
     
     <img alt="" src="resources/images/finalLogoAf1.png" style="width: 330px;position: absolute;
     border: 100px;left: 60px;display: none;top: -15px;cursor: pointer" id="mainLogoImgAf"
     onclick="location.href='mainpage.do'" >
      
    <li><a href="productlist.do">특산품</a></li>
    <li><a href="hotellist.do">호텔</a></li>
    <li><a href="#">커뮤니티</a>
      <ul class="zeta-menu_in">
        <li><a href="meeting.do">참여게시판</a></li>
        <li><a href="bbsList.do">자유게시판</a></li>
      </ul>
    </li>
    <li><a href="#">명소추천</a>
      <ul class="zeta-menu_in">
        <li><a href="location_attrac.do">지역명소</a></li>
        <li><a href="location_food.do">음식점</a></li>
        <li><a href="location_shop.do">쇼핑</a></li>
      </ul>
    </li> 
    <li><a href="#">축    제</a>
       <ul class="zeta-menu_in">
        <li><a href="festivalList.do">축  제</a></li>
        <li><a href="reviewList.do">축제후기</a></li>
      </ul>
    </li> 
  </ul>
</div>