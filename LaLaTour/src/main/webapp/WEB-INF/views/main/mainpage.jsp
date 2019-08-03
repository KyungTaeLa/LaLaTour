 <%@page import="lala.com.a.model.LocationDto"%>
<%@page import="lala.com.a.model.FestivalDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath() %>/resources/css/mainTest.css"> 
<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">
<style type="text/css">
a{
	text-decoration: none;
	cursor: po
}
*{
   margin: 0;
   padding: 0;
}
.carousel slide{
transition: transform 0.5s ease, opacity 0.5s ease-out;
height: 100% !important; /*원래 여기고 이미지에 없어야댐  */

}
.carousel-inner{

/* height: 100% !important; */
width: 880px;
height: 750px !important;
top: 0px;
}
.left-element{

   width: 50%;
position:absolute;
   top: 40px;
   left: 40px;
   box-sizing: border-box;
   padding-left: 40px;
height: 750px;
 background-color: #f5f5f5; 
 border-bottom: 1px solid #ddd;
}

.carousel-inner img{
   height: 750px;
   width: 752px;
}
.right-element{
position: relative;
width: 50%;
float: right;
 height: 750px; 
 background-color: #f5f5f5; 
}
.right-element li{
width: 50%;
float: left;
box-sizing: border-box;
background-color: #f5f5f5;
}
.visual-element{
position: relative;
 padding: 40px 40px 0px 40px; 
 background-color: #f5f5f5; 
margin-top: 50px;
border-bottom: 1px solid #ddd;
border-top: 1px solid #ddd;

}
ul, ol, li{
 list-style: none; 
border: none;

}
.shadow-box{
display: block;
overflow: hidden;
width : 425px; 
transition:all 0.2s ease-out;

}
.shadow-box img{

height: 283px;
width : 425px;  
}

.small-text{
   display: block;
   font-size: 14px;
   color: #0966bc;

}
.lagre-text{
display: block;
   font-size: 200px;
   color: #333;
}
.wrapper{
position: relative;
margin: auto;
width: 100%;
max-width: 1920px;
box-sizing: border-box;

} 
.carousel-control-next{
    margin-right: 5%; 

}
.carousel-indicators{
    margin-left: 2%;
    padding-left: 10%; 
  
}
.right-text-wrap{

   display: block;
   min-height: 80px;
   margin-top: 10px;
}
.shadow-box img:hover{
            cursor:pointer;
            -webkit-transform:scale(1.1); /*  크롬 */
            -moz-transform:scale(1.1); /* FireFox */
            -o-transform:scale(1.1); /* Opera */
            transform:scale(1.1);
            transition: transform .35s;
            -o-transition: transform .35s;
            -moz-transition: transform .35s;
            -webkit-transition: transform .35s;
        }
        
/* 여기서부턴 밑에메인 */
.travel-guide {
    position: relative;
    height: 650px;
    padding-top: 80px;
   
}      
.travel-guide .travel-guide-inner {
   
        position: relative;
    margin: 0 auto;
    width: 100%;
    max-width: 1540px;
    padding: 76px 50px;
    margin-left: 250px;
}  
.travel-slide-control {
    margin-top: 20px;
}        
.travel-guide .travel-guide-inner .travel-guide-text {
    position: absolute;
    left: 0px;
    top: 80px;
    width: 250px;
    height: 200px;
    z-index: 10;
}
.travel-guide .travel-slide-wrap {
    width: 1200px;
    height: 450px;
    position: absolute;
    left: 200px;
    right: 0px;
    top: 0px;
    bottom: 0px;
    z-index: 1000;
    padding: 60px 0px 20px 15px;
    box-sizing: border-box;
    overflow: hidden;
}
.bx-wrapper {
    overflow: visible !important;
    width: 100%;
    max-width: 100% !important;
}
.bx-wrapper .bx-viewport {
    -webkit-transform: translatez(0);
    -moz-transform: translatez(0);
    -ms-transform: translatez(0);
    -o-transform: translatez(0);
    transform: translatez(0);
}
.travel-guide .travel-slide-wrap .item a {
    position: relative;
    display: block;
    text-decoration: none;
}
.travel-guide .travel-slide-wrap .bx-wrapper {
    overflow: visible !important;
    width: 100%;
    max-width: 100% !important;
}
.travel-guide .travel-slide-wrap .item a .slide-text {
    display: block;
    padding: 15px 25px 25px 20px;
    height: 50px;
}
.travel-guide .travel-slide-wrap .item a .slide-text-inner {
    display: -webkit-box;
    font-size: 24px;
    color: #333;
    line-height: 25px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
    word-wrap: break-word;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    box-sizing: border-box;
}
.travel-guide .travel-slide-wrap .item img {
    width: 240px;
    height: 245px;
} 
.travel-guide .travel-slide-wrap .item a img {
    width: 240px;
    height: 245px;
}

.top-right img {
   z-index:100;
    width: 240px;
    height: 245px;
    overflow: hidden;
           position: absolute;
    left: 0px;   
    
}

.travel-guide .travel-guide-inner .bx-controls-direction {
    display: none;
}
.bx-wrapper .bx-controls-direction a {
    position: absolute;
    top: 50%;
    margin-top: -16px;
    outline: 0;
    width: 32px;
    height: 32px;
    text-indent: -9999px;
    z-index: 9999;
}
.travel-guide .travel-slide-wrap .item {
    float: left;
    padding: 0px;
    height: 380px;
    box-sizing: border-box;
    transition: all 0.2s ease-out;
    margin: 0px 0px 0px 50px;
}

.travel-guide .travel-slide-wrap .item a .item-inner {
    display: block;
    box-shadow: 1px 1px 5px rgba(0,0,0,.2);
    background-color: #fff;
}
.travel-guide .travel-slide-wrap .item a .icon-plus {
    display: none;
    position: absolute;
    z-index: 1;
    right: -15px;
    bottom: 30px;
    width: 40px;
    height: 40px;
    line-height: 41px;
    background-color: #0966bc;
    text-align: center;
    color: #fff;
    font-size: 18px;
    border-radius: 50%;
    transition: all 0.3s ease-out;
}
.travel-guide .travel-slide-wrap .item:nth-child(1), .travel-guide .travel-slide-wrap .item:nth-child(2), .travel-guide .travel-slide-wrap .item:nth-child(3) {
    opacity: 1;
}
.travel-guide .travel-slide-wrap .item:nth-child(even) a .icon-plus{top:30px;}
 [class*="ion-"] {
    line-height: 0;
} 
.travel-guide .travel-guide-inner .travel-slide-control a {
    position: relative;
    display: inline-block;
    width: 56px;
    height: 56px;
    border: 1px solid #dfdfdf;
    border-radius: 50%;
    text-align: center;
    margin-right: 10px;
    transition: all 0.3s ease-out;
    background-color: #fff;
}
.travel-guide .travel-slide-wrap .item.bottom-right a .item-inner {
    border-bottom-right-radius: 25px;
}
.travel-guide .travel-guide-inner h2 {
    font-size: 33px;
    color: #333;
    line-height: 70px;
}
.left-infor{

  background-color: rgba(255,255,255,.35);
  position: absolute; 
  top:530px; 
  padding-left: 70px;
  z-index: 50;
  box-sizing: border-box;
  width: 400px;
}
.carousel-item a{

text-decoration: none; 
color: black;
}
.carousel-item h2{
padding-top:12px;
}
.left-infor p{
margin-top: 50px;
    width: auto;
    display: inline-block;
    padding: 5px 25px;
    height: 25px;
    font-size: 14px;
    color: #fff;
    background-color: #333333;
    border-radius: 20px;
    padding-bottom: 25px;
    }
   
</style>   
 <!-- Optional JavaScript -->
   <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"></script>
   <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"></script>

<!-- bxslider -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">  -->
<script src="https://code.jquery.com/jquery-1.11.3.js"></script> 
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script> 



</head>
<body style="overflow: visible;"><a></a>

<!-- 사진 띄울 값 받기 -->
<%
//festival
List<FestivalDto> flist = (List<FestivalDto>)request.getAttribute("list");
List<LocationDto> loclist = (List<LocationDto>)request.getAttribute("loclist");
%>



<div class="wrapper">

<section class="visual-element" id="skip-container" style="height: auto;">
    


<div class="left-element">
<!-- 슬라이드? -->

<div id="carouselExampleIndicators" class="carousel slide"
   data-ride="carousel" data-interval="3000" >
   <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="1"
         class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
   </ol>
   <div class="carousel-inner">
   <!-- 슬라이드 이미지 받아와야댐  안명길 festival-->
   	<%for(int i =0;i<flist.size();i++){ 
   		
   		if(i==4){
   			break;
   		}
   	%>
   	
   <%System.out.println("list size()"+flist.size()); %>
    <%if(i==0){ %>
		<div class="carousel-item active" style="cursor: pointer;">
			<img alt="사진없음" src="<%=request.getContextPath()%>/upload/<%=flist.get(i).getThumbnail()%>"  class="d-block w-100">
		<a href="festivalDetail.do?seq=<%=flist.get(i).getSeq() %>" style="text-decoration: none; color: black;">
			<div class="left-infor">
			<h2><%=flist.get(i).getTitle() %></h2>	
			<p>자세히 보기</p>
			</div>
			</a>
		</div>  
         <%}else{ %>
     	<div class="carousel-item" style="cursor: pointer;">
         	<img alt="사진없음" src="<%=request.getContextPath()%>/upload/<%=flist.get(i).getThumbnail()%>"  class="d-block w-100">
         	<a href="festivalDetail.do?seq=<%=flist.get(i).getSeq() %>" >
         	<div class="left-infor" >
			<h2><%=flist.get(i).getTitle() %></h2>			
			<p>자세히 보기</p>
         	</div>
			</a> 
       </div>
         <%} %>        
   <%} %>
   
     <%--  <div class="carousel-item active">
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/main1.jpg" class="d-block w-100"
            alt="...">
      </div>
      <div class="carousel-item">
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/main2.jpg" class="d-block w-100"
            alt="...">
      </div>
      <div class="carousel-item">
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/main3.jpg" class="d-block w-100"
            alt="...">
      </div>
      <div class="carousel-item">
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/main4.jpg" class="d-block w-100"
            alt="...">
      </div> --%>
   </div>
   <a class="carousel-control-prev" href="#carouselExampleIndicators"
      role="button" data-slide="prev"> <span
      class="carousel-control-prev-icon" aria-hidden="false"></span> <span
      class="sr-only">Previous</span>
   </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
      role="button" data-slide="next"> <span
      class="carousel-control-next-icon" aria-hidden="false"></span> <span
      class="sr-only">Next</span>
   </a>
</div> <!-- 슬라이드 전체 div -->

<!-- 밑에는 오른쪽 이미지 넣어야해요 -->

</div> <!-- left div 닫는곳 -->



<!-- 하단이미지 -->
<div class="right-element">

<ul class="right-inner">

<!-- li반복 안명길  2개  -->
<%for(int i =4;i<flist.size();i++){ 
	if(i==6){
		break;
	}
%>

<li>
   <a href="festivalDetail.do?seq=<%=flist.get(i).getSeq() %>" class="나중에 링크걸어주세여" style="text-decoration: none;">
 	  <span class="shadow-box">
  		 <img alt="" src="<%=request.getContextPath()%>/upload/<%=flist.get(i).getThumbnail()%>"  class="d-block w-100">
  	 </span>
  	 <span class="right-text-wrap">
   	   <span class="small-text">축제</span>
   	   <span class="large-text"><%=flist.get(i).getTitle() %></span>
   </span>
   </a>
</li>
<%} %>
<%-- <li>
   <a href="#" class="나중에 링크걸어주세여">
   <span class="shadow-box">
   <img alt="" src="<%=request.getContextPath() %>/resources/images/mainTest/tobi2.jpg">
   </span>
   <span class="right-text-wrap">
      <span class="small-text">축제&행사</span>
      <span class="large-text">축제제목</span>
   </span>
   </a>
</li> --%>
<!-- li반복 안명길 지역명소 -->
<%for(int i=0; i<loclist.size(); i++){ 
	if(i==2){break;}
	
%>
<li>
   <a href="location_attrac_detail.do?seq=<%=loclist.get(i).getSeq() %>&tname='attrac'" class="나중에 링크걸어주세여"  style="text-decoration: none;">
   <span class="shadow-box">
   <img alt="" src="<%=request.getContextPath()%>/upload/<%=loclist.get(i).getThumbnail() %>" >
   </span>
   <span class="right-text-wrap">
      <span class="small-text">지역명소</span>
      <span class="large-text"><%=loclist.get(i).getTitle() %></span>
   </span>
   </a>
</li>

<%} %>


</ul>
</div>

</section>

<section class="travel-guide" style="background-color: white;">

<div class="travel-guide-inner">

<div class="travel-guide-text"><!-- 왼쪽묶음 -->
<h2>여행가이드</h2>
<div class="travel-slide-control">
<a class="travel-slide-prev">
<span></span>
<span class="hd-element" >
<img src="<%=request.getContextPath() %>/resources/images/mainTest/main_prevBtn.png" style="vertical-align: top;">
</span>
</a>
<a class="travel-slide-next">
<span></span>
<span class="hd-element">
<img src="<%=request.getContextPath() %>/resources/images/mainTest/main_nextBtn.png" style="vertical-align: top;">
</span>
</a>

</div>
</div> <!-- 왼쪽 묶음 div -->

<div class="travel-slide-wrap"><!-- 슬라이드 시작 다이브 -->
<div class="bx-wrapper"><!-- 슬라이드 wrapper -->
<div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 381px;">
<div class="travel-slide-wrap-inner bxslider" style="width: 1115%; position: relative;transition-duration: 0s;
    transform: translate3d(-1008px, 0px, 0px); ">

   
   <!-- 밑에부터 top-bottom 묶음 -->
   <div class="item top-right bx-clone" style="float: left; list-style: none; position: relative; width: 240px;" id="onemoretrip">
   <a href="https://www.onemoretrip.net/">
   <span class="item-inner">
      <span class="slide-text"> <!-- 슬라이드 이름&사진묶음 -->
         <span class="slide-text-inner"><!-- 이미지이름 -->
         One More Trip
         </span>
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/mainBxslider1.png">
      </span>
      <span class="icon-plus">
      <i class="ion-plus">+</i>
      </span>
   </span>
  </a>
   </div>
   <div class="item bottom-right bx-clone" style="float: left; list-style: none; position: relative; width: 240px;" id="visitkorea">
   <a class="링크걸어주세요">
   <span class="item-inner">
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/mainBxslider2.png">
      <span class="slide-text"> <!-- 슬라이드 이름&사진묶음 -->
         <span class="slide-text-inner"><!-- 이미지이름 -->
         한국 관광 공사
         </span>
      </span>
      <span class="icon-plus">
         <i class="ion-plus">+</i>
      </span>
   </span>
   </a>
   </div>
   <!-- 위에부터 top-bottom 묶음 -->
   
   <!-- 밑에부터 top-bottom 묶음 -->
   <div class="item top-right bx-clone" style="float: left; list-style: none; position: relative; width: 240px;" id="tourtips">
   <a class="링크걸어주세요">
   <span class="item-inner">
      <span class="slide-text"> <!-- 슬라이드 이름&사진묶음 -->
         <span class="slide-text-inner"><!-- 이미지이름 -->
         Tour tips
         </span>
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/mainBxslider3.png">
      </span>
      <span class="icon-plus">
      <i class="ion-plus">+</i>
      </span>
   </span>
   </a>
   </div>
   <div class="item bottom-right bx-clone" style="float: left; list-style: none; position: relative; width: 240px;" id="tago">
   <a class="링크걸어주세요">
   <span class="item-inner">
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/mainBxslider4.png">
      <span class="slide-text"> <!-- 슬라이드 이름&사진묶음 -->
         <span class="slide-text-inner"><!-- 이미지이름 -->
         대중교통 정보센터
         </span>
      </span>
      <span class="icon-plus">
         <i class="ion-plus">+</i>
      </span>
   </span>
   </a>
   </div>
   <!-- 위에부터 top-bottom 묶음 -->
   
   <!-- 밑에부터 top-bottom 묶음 -->
   <div class="item top-right bx-clone" style="float: left; list-style: none; position: relative; width: 240px;" id="museum">
   <a class="링크걸어주세요">
   <span class="item-inner">
      <span class="slide-text"> <!-- 슬라이드 이름&사진묶음 -->
         <span class="slide-text-inner"><!-- 이미지이름 -->
       대한민국 역사 박물관
         </span>
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/mainBxslider5.jpg">
      </span>
      <span class="icon-plus">
      <i class="ion-plus">+</i>
      </span>
   </span>
   </a>
   </div>
   <div class="item bottom-right bx-clone" style="float: left; list-style: none; position: relative; width: 240px;" id="weather">
   <a class="링크걸어주세요">
   <span class="item-inner">
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/mainBxslider6.jpg">
      <span class="slide-text"> <!-- 슬라이드 이름&사진묶음 -->
         <span class="slide-text-inner"><!-- 이미지이름 -->
         기상청 날씨 누리
         </span>
      </span>
      <span class="icon-plus">
         <i class="ion-plus">+</i>
      </span>
   </span>
   </a>
   </div>
   <!-- 위에부터 top-bottom 묶음 -->
   
   <!-- 밑에부터 top-bottom 묶음 -->
   <div class="item top-right bx-clone" style="float: left; list-style: none; position: relative; width: 240px;" id="emergency">
   <a class="링크걸어주세요">
   <span class="item-inner">
      <span class="slide-text"> <!-- 슬라이드 이름&사진묶음 -->
         <span class="slide-text-inner"><!-- 이미지이름 -->
       emergency
         </span>
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/mainBxslider7.png">
      </span>
      <span class="icon-plus">
      <i class="ion-plus">+</i>
      </span>
   </span>
   </a>
    </div>
    <div class="item bottom-right bx-clone" style="float: left; list-style: none; position: relative; width: 240px; " id="seouldanurim">
   <a class="링크걸어주세요">
   <span class="item-inner">
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/mainBxslider8.png">
      <span class="slide-text"> <!-- 슬라이드 이름&사진묶음 -->
         <span class="slide-text-inner"><!-- 이미지이름 -->
       다누림 관광
         </span>
      </span>
      <span class="icon-plus">
         <i class="ion-plus">+</i>
      </span>
   </span>
   </a>
   </div>
   <!-- 위에부터 top-bottom 묶음 -->
   
   <!-- 밑에부터 top-bottom 묶음 -->
   <div class="item top-right bx-clone" style="float: left; list-style: none; position: relative; width: 240px; " id="culture">
  <a class="링크걸어주세요"> 
   <span class="item-inner">
      <span class="slide-text"> <!-- 슬라이드 이름&사진묶음 -->
         <span class="slide-text-inner"><!-- 이미지이름 -->
         문화 포털
         </span>
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/mainBxslider9.jpg">
      </span>
      <span class="icon-plus">
      <i class="ion-plus">+</i>
      </span>
   </span>
    </a> 
   </div>
   <div class="item bottom-right bx-clone" style="float: left; list-style: none; position: relative; width: 240px; display: none;">
   <a class="링크걸어주세요">
   <span class="item-inner">
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/main4.jpg">
      <span class="slide-text"> <!-- 슬라이드 이름&사진묶음 -->
         <span class="slide-text-inner"><!-- 이미지이름 -->
         이미지 이름
         </span>
      </span>
      <span class="icon-plus">
         <i class="ion-plus">+</i>
      </span>
   </span>
   </a>
   </div>
   <!-- 위에부터 top-bottom 묶음 -->
   
   <!-- 밑에부터 top-bottom 묶음 -->
   <div class="item top-right bx-clone" style="float: left; list-style: none; position: relative; width: 240px; display: none;">
   <a class="링크걸어주세요">
   <span class="item-inner">
      <span class="slide-text"> <!-- 슬라이드 이름&사진묶음 -->
         <span class="slide-text-inner"><!-- 이미지이름 -->
         이미지 이름
         </span>
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/main2.jpg">
      </span>
      <span class="icon-plus">
      <i class="ion-plus">+</i>
      </span>
   </span>
   </a>
   </div>
   
    <div class="item bottom-right bx-clone" style="float: left; list-style: none; position: relative; width: 240px; display: none;">
   <a class="링크걸어주세요">
   <span class="item-inner">
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/main4.jpg">
      <span class="slide-text"> <!-- 슬라이드 이름&사진묶음 -->
         <span class="slide-text-inner"><!-- 이미지이름 -->
         이미지 이름
         </span>
      </span>
      <span class="icon-plus">
         <i class="ion-plus">+</i>
      </span>
   </span>
   </a>
   </div>
   <!-- 위에부터 top-bottom 묶음 -->
    <!-- 밑에부터 top-bottom 묶음 -->
   <div class="item top-right bx-clone" style="float: left; list-style: none; position: relative; width: 240px; display: none;">
   <a class="링크걸어주세요">
   <span class="item-inner">
      <span class="slide-text"> <!-- 슬라이드 이름&사진묶음 -->
         <span class="slide-text-inner"><!-- 이미지이름 -->
         이미지 이름
         </span>
         <img src="<%=request.getContextPath() %>/resources/images/mainTest/main2.jpg">
      </span>
      <span class="icon-plus">
      <i class="ion-plus">+</i>
      </span>
   </span>
   </a>
   </div>
   
   
   

    
</div>
<div class="bs-controls bx-has-controls-direction">
<div class="bx-controls-direction">
<a class="bx-prev" style="left: 10px;">Prev</a>
<a class="bx-next" style="right: 10px;">Next</a>
</div>

</div>




</div>



</div><!-- 오른쪽 이미지묶은 wrapper끝 -->


</div>


</div><!-- section전 inner -->
</section>


</div>

<script type="text/javascript">

       $(window).load(function(){
            var minSlides;
              var maxSlides;
              function windowWidth() {
                  if ($(window).width() < 380) {
                      minSlides = 1;
                      maxSlides = 1;
                  } else if ($(window).width() < 480) {
                      minSlides = 2;
                      maxSlides = 2;
                  }
                  else if ($(window).width() < 1251) {
                      minSlides = 4;
                      maxSlides = 4;
                  }
                  else {
                      minSlides = 4;
                      maxSlides = 4;
                  }
              }
              windowWidth();
            var travelSlide =$('.travel-slide-wrap-inner.bxslider').bxSlider({
               slideWidth:240,
               autoReload : true,
               infiniteLoop : true,
               pager:false,
                   maxSlides: maxSlides,
                   minSlides: minSlides
                   /*
               onSliderLoad : function($slideElement, oldIndex, newIndex){
                  $('.travel-slide-prev').addClass('off')
               },
               onSlideAfter : function($slideElement, oldIndex, newIndex) {
                  var ind = newIndex;
                  var maxind = $('.travel-slide-wrap-inner.bxslider .item').size();
                  if($(window).width() > 1024){
                     $('.travel-slide-wrap-inner.bxslider .item').removeClass('active');
                     $('.travel-slide-prev').removeClass('off');
                     $('.travel-slide-next').removeClass('off')
                     for (var i = ind; i < ind+3;) {
                        i++;
                        $('.travel-slide-wrap-inner.bxslider .item:nth-child('+i+')').addClass('active')
                     }
                     if(newIndex == 0){
                        $('.travel-slide-prev').addClass('off')
                     } else if(newIndex >= maxind-1){
                        $('.travel-slide-next').addClass('off')
                     }
                  }
               }*/
            });


       /* $(document).on('click','.travel-slide-prev',function() {
             
            bxslider.goToPrevSlide();
            //bxslider.goToNextSlide();
             return true;
         }); */
       
        $('.travel-slide-prev').on('click',function() {
            travelSlide.goToPrevSlide();
             return false;
         }); 
         
         $('.travel-slide-next').on('click',function() {
            
         
            travelSlide.goToNextSlide(); 
             return false;
         });

         
      
          $('.item').on('mouseenter',function(){
            $('.item').removeClass('on')
            $(this).addClass('on')
         });
         
         $('.item').on('mouseleave',function(){
            $('.item').removeClass('on')
         });
         
         
    

        $("#onemoretrip").mousedown(function () {
			window.open('https://www.onemoretrip.net/');
			location.reload();
			
		});
        
        $("#visitkorea").mousedown(function () {
			window.open('http://kto.visitkorea.or.kr/kor.kto');
			location.reload();
		});
        
        
        $("#tourtips").mousedown(function () {
			window.open('http://www.tourtips.com/');
			location.reload();
		});
             
        $("#tago").mousedown(function () {
			window.open('https://www.tago.go.kr/');
			location.reload();
		});  
        
        
        $("#museum").mousedown(function () {
			window.open('https://www.much.go.kr/');
			location.reload();
		});  
        
        $("#weather").mousedown(function () {
			window.open('https://www.weather.go.kr/weather/main.jsp');
			location.reload();
		});  
        
        
        $("#emergency").mousedown(function () {
			window.open('https://www.e-gen.or.kr/egen/search_hospital.do');
			location.reload();
		});  
         
        $("#seouldanurim").mousedown(function () {
			window.open('https://www.seouldanurim.net');
			location.reload();
		});  
        
       
        
        $("#culture").mousedown(function () {
    			window.open('https://www.onemoretrip.net/');
    			location.reload();
    		});  
         
        
        
        
    }); 
      

 
</script>

</body> 