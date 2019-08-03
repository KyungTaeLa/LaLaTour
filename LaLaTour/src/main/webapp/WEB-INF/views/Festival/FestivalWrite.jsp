<%@page import="lala.com.a.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* .form-control{
background-image: url(resources/images/search1png.png);
} */

.middleImg{ 
	margin-top:60px;
	background-repeat: no-repeat;
 	background-size: 100% 230px; 
	height: 230px;
	opacity: 0.9; 
	background-image: url("<%=request.getContextPath() %>/resources/images/Festival.jpg");
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

<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/resources/css/festivalList.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/festivalList.css"> 


<!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- bootstrapJS -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!-- jQuery 기본 ui파일 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
 <!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
 <!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>   



</head>
<body>

<%
 Object ologin = session.getAttribute("login");
 MemberDto member = null;
 if(ologin != null) {
 	  member = (MemberDto)ologin;
 }else{
	 %>
	 	<script type="text/javascript">
	 		location.href="festivalList.do";
	 	</script>
	 	<script> 
		location.reaplce( ""); 
		</script>
	 <%
	 }
%>

	<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
		<div class="middleImg">
			<h1 class="middleTitle">축제 글쓰기</h1>
		</div>
	</div>
<!-- <img src="resources/images/Festival.jpg" alt="NO Picture" style="width: 100%;height: 330px"> -->
<div style="margin-left: 10%" class="main">
<!-- 상단tag -->
<p class="location-lst" style="margin-left: 5%">
	<span>라라투어</span>
	<span>축제&행사</span> 
	<span class="active">글쓰기</span> 
</p>

<!-- //글쓰기 폼 -->
<form action="FestivalWriteAf.do" enctype="multipart/form-data"  method="post" onsubmit="return nullcheck()">
<!-- 제목 -->
<div class="input-group mb-3"  style="width: 60%; margin-left: 5%" >
  <div class="input-group-prepend">
    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    	<input name="place" id="place" value="축제장소" style="border: 0"> <!-- place -->
    </button>
    <div class="dropdown-menu">
      <a class="dropdown-item" onclick="place('서울특별시')">서울특별시</a>
      <a class="dropdown-item" onclick="place('경기도')">경기도</a>
      <a class="dropdown-item" onclick="place('강원도')">강원도</a>
      <a class="dropdown-item" onclick="place('충청도')">충청도</a>
      <a class="dropdown-item" onclick="place('전라도')">전라도</a>
      <a class="dropdown-item" onclick="place('경상도')">경상도</a>
 	  <a class="dropdown-item" onclick="place('제주도')">제주도</a>
    </div>
  </div>
  <input type="text" name="title" id="title" class="form-control"			
  aria-label="Text input with dropdown button" placeholder="제목을 입력하세요"> <!-- title -->
</div>


<!-- fileUpload -->
<div class="input-group mb-3" style="width:60%;margin-left: 5%">
 	 <div class="input-group-prepend">
   		 <span class="input-group-text" id="inputGroup-sizing-default">ThumbNail</span>
  	 </div>
 	 <input type="file" class="form-control" aria-label="Sizing example input" onchange="checkFile(this)"
 	 aria-describedby="inputGroup-sizing-default" style="border: 0" name="thumbfile" id="thumbnail">&nbsp;&nbsp;&nbsp;	<!-- Thumbnail -->
    
    <div class="input-group-prepend">
   		 <span class="input-group-text" id="inputGroup-sizing-default">Pamplet</span>
    </div>
 	 <input type="file" class="form-control" aria-label="Sizing example input"  onchange="pcheckFile(this)"
 	 aria-describedby="inputGroup-sizing-default" style="border: 0" name="pamphlet" id="pamphlet"> &nbsp;&nbsp;&nbsp;		<!-- Pamphlet -->
    
     <div class="input-group-prepend">
   		 <span class="input-group-text" id="inputGroup-sizing-default">MultiImg</span>
     </div>
	 <input type="file" class="form-control" aria-label="Sizing example input" onchange="McheckFile(this)"
	  aria-describedby="inputGroup-sizing-default" style="border: 0" multiple="multiple" id="img_multi"  name="img_multi"> <!-- multiImg -->
</div>

<!-- 본문 내용 -->
<textarea rows="30" cols="180" placeholder="본문글을 입력하세요." style="margin-left: 5%" name="content" id="content"></textarea> <!-- content -->

<!-- 축제기간 -->
<div class="input-group input-group-sm mb-3" style="width:38%;margin-left: 5%">
	<div class="input-group-prepend">
    	<span class="input-group-text" id="inputGroup-sizing-sm">축제기간</span>
    </div>
	<input type="text" class="form-control" aria-label="Sizing example input" readonly="readonly"
   	aria-describedby="inputGroup-sizing-default" style="background-image: url(resources/images/search1.png);"
   	 value="시작일" id="sDate" name="sDate">~					<!-- sdate -->
   	 
	<input type="text" class="form-control" aria-label="Sizing example input"  readonly="readonly"
 	aria-describedby="inputGroup-sizing-default" style="background-image: url(resources/images/search1.png);" 
 	value="종료일" id="eDate" name="eDate" onchange="edateCheck()">					<!-- edate -->
 	<input type="hidden" name="id" value="<%=member.getId()%>">
 	&nbsp;<input type="button" value="뒤로가기" class="btn btn-outline-secondary">&nbsp;
 	&nbsp;<input type="submit" value="글작성" class="btn btn-outline-secondary">&nbsp;
</div>
</form>
</div>
<br><br><br><br><br><br>

<script type="text/javascript">

//썸네일 파일 확장자 체크
function checkFile(f){
	var	file =f.files
	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name))
		alert('이미지 파일만 선택해 주세요.\n현재 파일 : ' + file[0].name);
	else return;
	f.outerHTML = f.outerHTML;
}

function pcheckFile(f){
	var	file =f.files
	if(!/\.(pdf|pptx)$/i.test(file[0].name))
		alert('pdf 파일만 선택해 주세요.\n현재 파일 : ' + file[0].name);
	else return;
	f.outerHTML = f.outerHTML;
}

function McheckFile(f){
	var	file =f.files;
	
	for (var j = 0; j < file.length; j++) {
		if(!/\.(gif|jpg|jpeg|png)$/i.test(file[j].name)){
		alert('이미지 파일만 선택해 주세요.\n문제 파일 : ' + file[j].name);			
     	 f.outerHTML = f.outerHTML; 	
		}
	}
}

var minDate = new Date()

$(function() {
    $( "#sDate" ).datepicker({
    	showButtonPanel: true,  
        currentText: '오늘 날짜', 
        closeText: '닫기', 
        dateFormat: "yy-mm-dd",
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
             dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             changeMonth: true, 
             changeYear: true,
             nextText: '다음 달',
             prevText: '이전 달',
             minDate: minDate
    });
});

$(function() {
    $( "#eDate" ).datepicker({
    	showButtonPanel: true,  
        currentText: '오늘 날짜', 
        closeText: '닫기', 
        dateFormat: "yy-mm-dd",
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
             dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             changeMonth: true, 
             changeYear: true,
             nextText: '다음 달',
             prevText: '이전 달' ,
             minDate: minDate
    });
}); 

function nullcheck(){
	if($("#place").val().trim()=="축제장소"){
		alert("축제장소를 입력하세요")
		return false;
	}
	
	if($("#title").val().trim()==""){
		alert("제목을 입력하세요");	
		return false;
	}

if($("#thumbnail").val().trim()==""){
		alert("썸네일을 첨부하세요");
		return false;
	}

	if($("#pamphlet").val().trim()==""){
		alert("팜플랫을 첨부하세요");
		return false;
	}
	
	if($("#img_multi").val().trim()==""){
		alert("이미지를 첨부하세요");
		return false;
	}
	
	
	if($("#content").val().trim()==""){
		alert("내용을 입력하세요");
		return false;
	}
	if($("#sDate").val().trim()=="시작일"){
		alert("축제 시작 날짜를 입력하세요");
		return false;
	}
	if($("#eDate").val().trim()=="종료일"){
		alert("축제 끝나는 날짜를 입력하세요");	
		return false;
	}
	if($("#sDate").val().trim()==""){
		alert("축제 시작 날짜를 입력하세요");
		return false;
	}
	if($("#eDate").val().trim()==""){
		alert("축제 끝나는 날짜를 입력하세요");	
		return false;
	} 
	
	return true;
}








function place( p ){
	
	$("#place").val(p);
}

function edateCheck(){
	
var sdate=$("#sDate").val();
var edate=$("#eDate").val();

if(sdate>edate){
	alert("마감일이 시작일보다 빠릅니다.");
	$("#sDate").val("");
	edate=$("#eDate").val("");
	}
}



</script>




</body>
</html>





