<%@page import="lala.com.a.model.FestivalDto"%>
<%@page import="java.util.List"%>
<%@page import="lala.com.a.model.MeetingDto"%>
<%@page import="lala.com.a.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
List<FestivalDto> meetwrite = (List<FestivalDto>)request.getAttribute("meetwrite");
%>
    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
font-family: 'Nanum Gothic', sans-serif;
	font-size: 19px;
}
.divList{

	padding-top: 50px;
	padding-bottom: 10%;
	width: 1000px;
	margin: auto;
}
table{
	width: 800px;
	vertical-align: middle;
	 text-align: left; 
	 padding-top: 55px;
	 
}
.divList td{
	height: 60px;
	
}
.divAll{
	width: 1250px;
	margin: auto;
}

#divSub{
	padding-top:40px;
	padding-bottom: 20px;
	border-bottom: 3px black solid;
	
	text-align: right;
}
a{
	text-decoration: none;
	color: black;
}
td,tr{
	border-bottom: 1px gray dotted;
}
#divBack{
	padding-top:10px;
	height:400px; 
	background-color:#fbfbfb;
	padding-bottom: 250px;
	margin: auto;
}
input{

	font-size: 17px;
	height: 28px;
}
#edate{

  background-image : url('<%=request.getContextPath() %>/resources/images/calTest4.jpg'); 

  background-position:top left; 

  background-repeat:no-repeat;
  cursor: pointer;
   padding-left: 30px; 
   padding-bottom: 0;
   vertical-align: bottom;

  }
 #caution{
	margin-bottom:70px;
	border: 1px black solid;
	width: 900px;
	text-align: center;
	height: 200px;
} 
#cautionOuter{
	text-align: center;
	padding-left: 200px;
}
#cuation_title{
text-align: left;
 padding-left: 50px; 
 vertical-align: top;
 height:40px;
}
 #cuation_title div {
	text-align: right;
	float: right;
	margin: 0px 50px 5px 0px;
}
.main_title{
	padding-top: 20px;
	padding-bottom:0;
	padding-left:30px;
	margin-bottom: 0;
}
.middleImg{ 
margin-top:60px;
	background-image: url("<%=request.getContextPath() %>/resources/images/backTest.jpg");
	background-repeat: no-repeat;
 	background-size: 100% 230px; 
	height: 230px;
	opacity: 0.9; 
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
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

 <!-- jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
 <!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
 <!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
</head>
<body>
<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
<div class="middleImg">
<h1 class="middleTitle">커뮤니티</h1>
</div>
</div>

<div class="divAll">

<div class="main_title">
<h1>참여 게시판</h1>
</div>

<div id="divSub"  style="text-align: right; width: 100%">
<a href="bbsList.do">자유게시판</a>&nbsp;&nbsp;|&nbsp;
<a href="meeting.do"><b>참여게시판</b></a>
</div>

<div align="center" class="divList">

<div id="cuationOuter">
<div id="cuation_title">
<font color="#ff000">*</font><b>유의사항</b>
<div>
<input type="checkbox" id="agree"  style="vertical-align: bottom; 	position: relative; top: 5px;" value="0">동의합니다.
</div>
<p style="clear: both">&nbsp;</p>
</div>
<div id="caution" >
<br>
작성자 혹은 마감일에 의해 마감된 글은 삭제 하실수 없습니다.<br>
글 작성 완료 후 축제/모집일/모집인원은 수정이 불가합니다.<br><br>
You can not delete posts written by the author or deadline.<br>
The festival/recruitment day/recruitment number can not be modified<br>
after the completion of the writing.
</div>
</div>

<form action="meetWriteAf.do" method="post" >
<div id="divBack">
<table>
<col width="40%"><col width="60%">
<tr>
	<td>작성자</td>
	<td><%=member.getId() %></td>
</tr>
<tr>
	<td>축제선택</td>
	<td>
		<select name="meet_loc" id="meet_loc" style="height: 35px; font-size: 19px;">
			<option id="select" selected="selected">축제선택</option>
			<%for(int i =0; i<meetwrite.size(); i++){
				%>	
				<option value="<%=meetwrite.get(i).getSeq() %>" id="<%=meetwrite.get(i).geteDate() %><%=meetwrite.get(i).getsDate() %>" ><%=meetwrite.get(i).getTitle() %></option>
				<% 
			}
			%>
			
		</select> 
	</td>
</tr>

<tr>
	<td>제목</td>
	<td>
		<input type="text" name="title" id="title" size="50" >
	</td>
</tr>

<tr>
	<td >내용</td>
	<td>
		<textarea rows="10" cols="80" name="content" id="content"></textarea>
	</td>
</tr>

<tr>
	<td>모집인원</td>
	<td>
		<input type="text" name="maxcnt" id="maxcnt" onblur="return numChk( this.value )" size="20">
	</td>
</tr>

<tr>
	<td>모집일</td>
	<td>
		<input type="text" id="edate" name="edate" readonly="readonly" size="15">
	</td>
</tr>


</table>
<input type="hidden" name="id" value="<%=member.getId() %>">
<br>
<!-- <input type="submit" value="완료" id="ok"> -->
<div>
<input type="image" src="<%=request.getContextPath() %>/resources/images/meetComplete.png" id="complete" style="cursor: pointer; height: 43px; width: 78px;">
<%-- <img src="<%=request.getContextPath() %>/resources/images/meetComplete.png" id="complete" style="cursor: pointer;"> --%>
</form>
<a href="meeting.do">
<img src="<%=request.getContextPath() %>/resources/images/meetCancel.png">
</a>
</div>
</div>

</div>
<script type="text/javascript">

/* 동의합니다 체크시에 값이 1로 바뀜 */

 $("#agree").change(function () {
	if($("#agree").is(":checked")){
		
		$("#agree").val("1");
	}else{
		$("#agree").val("0");
	}
});
		
 

/* 축제선택 안하면 false기능 */
var edate =0;
var sdate =0;
$("#meet_loc").change(function() {
	//alert("선택됨");
	   edate = $(this).children(":selected").attr("id");
	   sdate = edate.substring(10,20).replace(/-/gi,"");
	   edate = edate.substring(0,10).replace(/-/gi,"");
	   if(edate == 'select'){
		   
		   alert("축제를 선택하세요");
		   return false;
	   }
	
	
	//alert(edate);
	//alert(sdate);
	});


/* 모집인원이 1이상의 숫자여야한다. */
 function numChk( num ) {
	
	//alert(num);
	
	if( !isNaN(num) && num>0){
		
		if(num == 1){
			alert("1이상의 숫자를 입력하세요.");
			return false;
		}
		
		return true;
	}
	else{
		alert("숫자를입력해주세요");
		$("#maxcnt").val("");
		return false;
	}
	
} 


/* 글쓰기 완료시에 각 칸의 값들이 빈칸이거나 null값이면 안된다 */
$("#complete").click(function () {

	if($("#title").val().trim() == null || $("#title").val().trim() == ""){
		
		alert("제목을 입력하세요");
		$("#title").focus();
		return false;
	}
	
	 if($("#content").val().trim() == null || $("#content").val().trim() == ""){
		
		alert("내용을 입력하세요");
		$("#content").focus();
		return false;
	} 
	
	if($("#maxcnt").val().trim() == null || $("#maxcnt").val().trim() == ""){
		
		alert("모집인원을 입력하세요");
		//$("#maxcnt").focus();
		return false;
	}
	 
	
	//현재날짜 이후만 설정가능
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day = date.getDate();
	
	if(month < 10){
		
		month = "0"+month;
	}
	if(day < 10){
		
		day = "0"+day;
	}
	var today = year+month+day;
	//alert(today);
	
	// 축제의 마지막날 이후에 선택불가
	if($( "#edate" ).val() < today){
		alert("날짜를 다시 선택하세요");
		return false;
		
	}
	else if( $( "#edate" ).val() > edate ){
		alert("축제 기간이 아닙니다.");
		
		return false;
	}else if ($( "#edate" ).val() < sdate){
		alert("축제 시작일은 "+ sdate.substring(0,4)+ "-" +  sdate.substring(4,6)+ "-"+ sdate.substring(6,8) + "입니다.");
		
		return false;
	}
	
	 if( $("#agree").val() == 0){
		alert("유의사항에 동의해주십시오.");
		//alert($("#agree").val());
		return false;
	}else{
		
		//alert("들어가기직전2");
		//alert($("#agree").val());
		return true;
		
	}
});


	

/* 달력 */
$(function() {
	
    $("#edate").datepicker({
       showButtonPanel: true,  
        currentText: '오늘 날짜', 
        closeText: '닫기', 
        dateFormat: "yymmdd",
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
             dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             changeMonth: true, 
             changeYear: true,
             nextText: '다음 달',
             prevText: '이전 달'
    });
    
   
}); 

</script>

</body>
</html>