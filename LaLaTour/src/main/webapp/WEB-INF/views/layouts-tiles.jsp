<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
</style>
<tiles:insertAttribute name="header"/>

<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath() %>/resources/css/layout_css.css">
</head>
<body >
<div id="wrapper">
   <div class="_top" >
      <tiles:insertAttribute name="top_inc"/>
      <tiles:insertAttribute name="top_menu"/>
   </div>
   <div>
      <tiles:insertAttribute name="main"/>
   </div>
   <div id="footer" style="padding-bottom: 100px;">
      <tiles:insertAttribute name="footer"/>
   </div>
</div>
</body>
</html>

