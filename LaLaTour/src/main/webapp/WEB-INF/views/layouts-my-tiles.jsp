<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
     
    
<!DOCTYPE html>
<html style="height: 100%">
<head>
<meta charset="UTF-8">
<style type="text/css">

#footer{
position:relative;

    bottom:0;

    width:100%;

    height:70px;   

    background:#ccc;
}
body {

    margin:0;

    padding:0;

    height:100%;

}
#wrapper {

   position:relative;

    min-height:100%;

}
a:hover{
	text-decoration: none !important;
	color:inherit;
}
a:visited{
text-decoration: none !improtant;
color: inherit;
}
a:link{
	text-decoration: none !important;
	color:inherit;
}
.middleImg{ 
	margin-top:60px;
	background-repeat: no-repeat;
 	background-size: 100% 230px; 
	height: 230px;
	opacity: 0.9; 
	background-image: url("<%=request.getContextPath() %>/resources/images/admin_my_top.jpg");
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
<tiles:insertAttribute name="header"/>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/style.css">
</head>
<body>

<div id="body_wrap">
	<div id="main_wrap">
		<div id="header_wrap">
			<tiles:insertAttribute name="top_inc"/>
			<tiles:insertAttribute name="top_menu"/>
		</div>
		<div>
		<c:if test="${login.auth eq '0'}">
			<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
				<div class="middleImg">
				<h1 class="middleTitle">My Page</h1>
				</div>
			</div>
		</c:if>
		<c:if test="${login.auth eq '1'}">
			<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
				<div class="middleImg">
				<h1 class="middleTitle">Admin Page</h1>
				</div>
			</div>
		</c:if>
		</div>
		<div id="middle_wrap">
			<div id="sidebar_wrap" style="background-color: #eeeeee">
				<tiles:insertAttribute name="left_main"/>
			</div>
		
			<div id="content_wrap">
				<tiles:insertAttribute name="main"/>
			</div>		
		</div>	
		
		<div id="footer_wrap">
			 <tiles:insertAttribute name="footer"/>
		</div>		
	</div>
</div>

</body>
</html>

