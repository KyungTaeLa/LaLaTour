<%@page import="lala.com.a.model.ReviewDto"%>
<%@page import="lala.com.a.model.FestivalDto"%>
<%@page import="lala.com.a.model.PdsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.middleImg{ 
	margin-top:60px;
	background-repeat: no-repeat;
 	background-size: 100% 230px; 
	height: 230px;
	opacity: 0.9; 
	background-image: url("<%=request.getContextPath() %>/resources/images/DMZ5.JPG");
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

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/fontawesome-stars.css"> 
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/resources/css/star.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/festivalDetail.css">
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/resources/css/festivalDetail.css"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<style type="text/css">


</style>
</head>
<body>


<%
ReviewDto revdto = (ReviewDto)request.getAttribute("revdto");
int seq = 0;
String id="";//아까 조건 지웠으

List<PdsDto> list = (List<PdsDto>)request.getAttribute("list"); 
int pseq = (int)request.getAttribute("pseq"); 


FestivalDto dto = (FestivalDto)request.getAttribute("dto");
seq = dto.getSeq();

%>







<form action="reviewUpdateAf.do" enctype="multipart/form-data" method="post" onsubmit="return nullCheck()" id="reviewUpdateAf_frm">

<!-- <img src="resources/images/Festival.jpg" alt="NO Picture" style="width: 100%;height: 330px"> -->

	<div class="middleAll">
		<div class="middleImg">
			<h1 class="middleTitle">후기 수정</h1>
		</div>
	</div>



			<p class="location-lst" style="margin-left: 5%">
				<span>라라투어</span>
				<span>축제&행사</span> 
				<span>축제&행사 후기</span> 
				<span class="active">축제&행사 후기수정</span>
			</p>

<br><br>
<div class="sub-detail-contents" id="sub-container">
	<div class="sub-detail-inner" >
		<!-- left-content -->
		<div class="left-content">
			<%-- <a href="#" onclick="festivalSeach()" id="fttitle">[<%=dto.getPlace() %>]<%=dto.getTitle() %></a>		<br><br> --%>
			<div class="input-group mb-3" style="width: 55%">
 			  <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username"
   			aria-describedby="button-addon2" readonly="readonly" value=" [<%=dto.getPlace() %>]<%=dto.getTitle() %>">
  				<div class="input-group-append">
  				  <button class="btn btn-outline-secondary" type="button" onclick="festivalSeach()">축제보기</button>
  				</div>
			</div>
			
			<div class="input-group mb-3" style="width: 55%">
 			  <input type="text" class="form-control" id="fttitle"
 			   name="title" placeholder="Recipient's username" aria-label="Recipient's username"
			  aria-describedby="button-addon2" readonly="readonly" value="<%=revdto.getTitle()%>">
  				<div class="input-group-append">
  					<button class="btn btn-outline-secondary" type="button" id="updateButton"
  					 onclick="titleUpdate()">수정</button>
  					<button class="btn btn-outline-secondary" type="button"
  					 onclick="titleUpdateAf()" style="display: none;" id="updateButtonAf">완료</button>
  				</div>
			</div>
			 
		<%-- <h>제목 : </h><input type="text" name="title" id="title" style="width: 200px;height: 17px" value="<%=revdto.getTitle()%>"><br> --%>
		
			
		
		
<span class="star-input" >
	<span class="input">
		<input type="radio" name="star-input" value="0.5" id="p1">
		<label for="p1">0.5</label>
		<input type="radio" name="star-input" value="1.0" id="p2">
		<label for="p2">1.0</label>
		<input type="radio" name="star-input" value="1.5" id="p3">
		<label for="p3">1.5</label>
		<input type="radio" name="star-input" value="2.0" id="p4">
		<label for="p4">2.0</label>
		<input type="radio" name="star-input" value="2.5" id="p5">
	   	<label for="p5">2.5</label>
    	<input type="radio" name="star-input" value="3.0" id="p6">
    	<label for="p6">3.0</label>
    	<input type="radio" name="star-input" value="3.5" id="p7">
    	<label for="p7">3.5</label>
    	<input type="radio" name="star-input" value="4.0" id="p8">
    	<label for="p8">4.0</label>
    	<input type="radio" name="star-input" value="4.5" id="p9">
    	<label for="p9">4.5</label>
    	<input type="radio" name="star-input" value="5.0" id="p10">
    	<label for="p10">5.0</label>
  	</span>
    <output for="star-input"><b>0</b></output>점
</span>

		</div>		
	</div>

		
		<!-- right-content -->
		<aside class="right-content">
			<div class="aside" style="width: 230px;top:500px; margin-left:15%; position: fixed;" ><!-- scroll fixed 추가 -->
			<div class="detail-box">
				<span>관리자 리모콘</span>
			</div>
			<div class="right-content-inner">		

				<dl class="detail-type">
						<dt>button</dt><br>
						<dt>
							<input type="button" class="btn btn-secondary" onclick="back_()" value="back">
							<input type="submit" class="btn btn-secondary" onclick="reviewUpdate()" value="Write">
						</dt>
				</dl>
				<dl class="detail-type">
						<dt>수정전 별점</dt>
						<dt>
						
		<%if(revdto.getScore()>4.5){ %>
			<img src="resources/images/star/star_5.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>4){ %>
			<img src="resources/images/star/star_4.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>3.5){ %>
			<img src="resources/images/star/star_4.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>3){ %>
			<img src="resources/images/star/star_3.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>2.5){ %>
			<img src="resources/images/star/star_3.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>2.0){ %>
			<img src="resources/images/star/star_2.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>1.5){ %>
			<img src="resources/images/star/star_2.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>1.5){ %>
			<img src="resources/images/star/star_1.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if (revdto.getScore()>1.0){ %>
			<img src="resources/images/star/star_1.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>0.5){ %>
			<img src="resources/images/star/star_1.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>0){ %>
			<img src="resources/images/star/star_1.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%} %>

					</dt>
				</dl>
			</div>
		</div>
	</aside>
</div>
	<!--// right-content -->
	
<div class="content_main" style="margin-left:10%;max-width: 940px" >
<!-- ww이제부터 본문글 content -->
<!-- TODO -->
	<div>
			<%for(int i =0;i<list.size();i++){
			PdsDto pdto = list.get(i);
			%>
		<div>	<!-- www -->
			<div style="float:left">
				<img src="<%=request.getContextPath()%>/upload/<%=pdto.getFileName_Af()%>" alt="NO Picture" 
				style="width: 400px;height:265px;vertical-align: top" id="hahaha<%=i%>">							
			</div>
			<div class="filebox preview-image" style="float:right;">
						<input class="upload-name" id="filebb<%=i %>" value="파일수정" disabled="disabled">
						<label for="file_<%=i %>" id="fileLabel<%=i%>">업로드</label>
						<input type="file"  name="file_" id="file_<%=i %>" class="upload-hidden">
				<input type="button" value="삭제" onclick="buttonBf(<%=i %>)" id="buttonBf<%=i%>" class='btn btn-secondary' >	
				<br>
				<textarea style="border:none; outline:none" rows="7" cols="70" name="pcontent" id="pcontent<%=i %>"><%=pdto.getContent() %></textarea>			
			</div>
		
	<p style="clear:both">&nbsp;</p>
	

				<input type="hidden" name="seq" value="<%=pdto.getSeq()%>">
			 	<input type="hidden" name="pseq" value="<%=pdto.getPseq()%>">
				
		<%} %>
		--후기 추가--
				<div id="appendPtag">
				</div>
		
					<br><br>
		</div>		
	</div>
<hr><br>

<div class="filebox preview-image">
	<input class="upload-name" value="파일업로드" disabled="disabled">	
	
	
	<label for="reviewFile0" name="reviewFile0" class="fileLabel1"">업로드</label>
	<label for="reviewFile1" name="reviewFile1" class="fileLabel1" style="display: none;">업로드1</label>
	<label for="reviewFile2" name="reviewFile2" class="fileLabel1" style="display: none;">업로드2</label>
	<label for="reviewFile3" name="reviewFile3" class="fileLabel1" style="display: none;">업로드3</label>
	<label for="reviewFile4" name="reviewFile4" class="fileLabel1" style="display: none;">업로드4</label>
	<label for="reviewFile5" name="reviewFile5" class="fileLabel1" style="display: none;">업로드5</label>
	<label for="reviewFile6" name="reviewFile6" class="fileLabel1" style="display: none;">업로드6</label>
	<label for="reviewFile7" name="reviewFile7" class="fileLabel1" style="display: none;">업로드7</label>
	<label for="reviewFile8" name="reviewFile8" class="fileLabel1" style="display: none;">업로드8</label>
	<label for="reviewFile9" name="reviewFile9" class="fileLabel1" style="display: none;">업로드9</label>
	<label for="reviewFile10" name="reviewFile10" class="fileLabel1" style="display: none;">업로드10</label>
	<label for="reviewFile11" name="reviewFile11" class="fileLabel1" style="display: none;">업로드11</label>
	<label for="reviewFile12" name="reviewFile12" class="fileLabel1" style="display: none;">업로드12</label>
	<label for="reviewFile13" name="reviewFile13" class="fileLabel1" style="display: none;">업로드13</label>
	<label for="reviewFile14" name="reviewFile14" class="fileLabel1" style="display: none;">업로드14</label>	
	
	
	<input type="file" name="reviewFile" id="reviewFile0" class="upload-hidden">
	<input type="file" name="reviewFile" id="reviewFile1" class="upload-hidden" style="display: none;">
	<input type="file" name="reviewFile" id="reviewFile2" class="upload-hidden" style="display: none;">
	<input type="file" name="reviewFile" id="reviewFile3" class="upload-hidden" style="display: none;">
	<input type="file" name="reviewFile" id="reviewFile4" class="upload-hidden" style="display: none;">
	<input type="file" name="reviewFile" id="reviewFile5" class="upload-hidden" style="display: none;">
	<input type="file" name="reviewFile" id="reviewFile6" class="upload-hidden" style="display: none;">
	<input type="file" name="reviewFile" id="reviewFile7" class="upload-hidden" style="display: none;">
	<input type="file" name="reviewFile" id="reviewFile8" class="upload-hidden" style="display: none;">
	<input type="file" name="reviewFile" id="reviewFile9" class="upload-hidden" style="display: none;">
	<input type="file" name="reviewFile" id="reviewFile10" class="upload-hidden" style="display: none;">
	<input type="file" name="reviewFile" id="reviewFile11" class="upload-hidden" style="display: none;">
	<input type="file" name="reviewFile" id="reviewFile12" class="upload-hidden" style="display: none;">
	<input type="file" name="reviewFile" id="reviewFile13" class="upload-hidden" style="display: none;">
	<input type="file" name="reviewFile" id="reviewFile14" class="upload-hidden" style="display: none;">
</div>			



	<textarea rows="25" cols="100" name="content" id="content0" class="content"></textarea>
	<textarea rows="25" cols="100" name="content" id="content1" class="content" style="display: none;"></textarea>
	<textarea rows="25" cols="100" name="content" id="content2" class="content" style="display: none;"></textarea>
	<textarea rows="25" cols="100" name="content" id="content3" class="content" style="display: none;"></textarea>
	<textarea rows="25" cols="100" name="content" id="content4" class="content" style="display: none;"></textarea>
	<textarea rows="25" cols="100" name="content" id="content5" class="content" style="display: none;"></textarea>
	<textarea rows="25" cols="100" name="content" id="content6" class="content" style="display: none;"></textarea>
	<textarea rows="25" cols="100" name="content" id="content7" class="content" style="display: none;"></textarea>
	<textarea rows="25" cols="100" name="content" id="content8" class="content" style="display: none;"></textarea>
	<textarea rows="25" cols="100" name="content" id="content9" class="content" style="display: none;"></textarea>
	<textarea rows="25" cols="100" name="content" id="content10" class="content" style="display: none;"></textarea>
	<textarea rows="25" cols="100" name="content" id="content11" class="content" style="display: none;"></textarea>
	<textarea rows="25" cols="100" name="content" id="content12" class="content" style="display: none;"></textarea>
	<textarea rows="25" cols="100" name="content" id="content13" class="content" style="display: none;"></textarea>
	<textarea rows="25" cols="100" name="content" id="content14" class="content" style="display: none;"></textarea>
	
	<button type="button" class="btn btn-outline-dark" id="addFile">추가</button>
	<input type="hidden" name="score" id="score" value="">
	<input type="hidden" name="fseq" value="<%=seq%>">
	
</div>





</div>



<!-- <p id="footer"> -->

<script src="<%=request.getContextPath() %>/resources/js/Reviewstar.js"></script>
<script type="text/javascript">
$(document).ready(function(){
//스크롤되면 함수시작
	$(window).scroll(function () {   
		//스크롤을 200px이상 하면 스크롤되게 바꾼다	   
	 if($(window).scrollTop() > 200) {
	    $('.aside').css('position','fixed');
	   	//스크롤될때 고정할 위치
	    $('.aside').css('top',200); 
	 }
		//top에서 200px이하로 되면 스크롤기능을 죽임
	 else if ($(window).scrollTop() <= 200) {
	    $('.aside').css('position','');
	  	//스크롤기능 사라질 때  고정할 위치
	    $('.aside').css('top','200');
	 }  
		
		//끝 위치를 동적으로 설정해놓을때 쓰는 함수 (나는 댓글 바로 위에다가 임시 div(footer)생성해놨음)
	    if ($('.aside').offset().top + $(".aside").height() > $("#footer").offset().top) {
	        $('.aside').css('top',-($(".aside").offset().top + $(".aside").height() - $("#footer").offset().top));
	    }
	});
	});


var i =0;
var src_='';

function festivalSeach(){
	
	
	location.href="festivalSeach1.do?pseq="+<%=pseq%>;

}

$("#addFile").click(function(){
	
	
	
	if($("#reviewFile"+i).val()==""){
		alert("파일을 선택하세요");
		return false;
	}
	if($("#content"+i).val().trim()==""){
		alert("내용을 입력하세요");
		return false;
	}
	// TODO

		
 	$("#appendPtag").append(
 		"<div id='ImgNull"+i+"'>"+
	 		"<div  style='float:left'>"+
	 			"<img src='"+src_+"' style='width: 400px;height:265px' id=hahaha"+i+">"+
	 		"</div>"+	
	 		"<div style='float:left; width:520px; margin-left:15px'>"+
	 			"<input type='button' id='deldel"+i+"' onclick='delete_("+i+")' value='삭제' class='btn btn-secondary' class='btn btn-secondary'>"+
	 			"<textarea rows='9' cols='70' readonly='readonly' id='tcontent"+i+"' style='border:none; outline:none'>"+$('#content'+i).val()+"</textarea>"+
	 		"</div>"
 		+"</div>"
 		+"<p style='clear:both'>&nbsp;</p>"
 		
 	)
		/* "<a id='deldel"+i+"' onclick='delete_("+i+")'>삭제</a>"+	"<h3 id='deldeldel"+i+"'>"+$("#reviewFile"+i).val()+
		"</h3>"+"<textarea rows='20' cols='80' readonly='readonly' id='tcontent"+i+"'>"+$('#content'+i).val()+"</textarea>") */

	i++;
	
	$(".content").hide();
	$(".upload-hidden1").hide();
	$(".upload-name").val("파일수정");	
	$(".reviewFile").hide();
	$(".fileLabel1").hide();
	$("#reviewFile"+i).show();
	$("#content"+i).show();
	$("[name='reviewFile"+i+"']").show();
})






function delete_(i){
	
	$("#tcontent"+i).hide();
	$("#deldel"+i).hide();
	$("#reviewFile"+i).hide();
	$("#deldeldel"+i).hide();
	$("#ImgNull"+i).empty();
	
	$("#content"+i).val("");
	$("#reviewFile"+i).val("");
	/* switch(i){
	
	case i : $("#content"+0).hide();
	
	} */
	
}

function textUpdate(i){
	
	//$("#pcontent"+i).attr("readonly",false);
	$("#upButton"+i).hide();
	$("#upButtonAf"+i).show();
	$("#file_"+i).show();
}

function ButtonShow(i){
	//$("#pcontent"+i).attr("readonly",true);
	$("#upButtonAf"+i).hide();
	$("#upButton"+i).show();
	$("#file_"+i).hide();
}
//www
function buttonBf(i){
	
	$("#filebb"+i).hide();
	$("#pcontent"+i).hide();
	$("#file_"+i).hide();
	$("#buttonBf"+i).hide();
	$("#fileLabel"+i).hide();
	$("#hahaha"+i).hide();
	
	$("#upButton"+i).hide();
	$("#buttonBf"+i).hide();

   
	$("#pcontent"+i).val("");
	$("#file_"+i).val("");
	
	
	alert($("#pcontent"+i).val());
	alert($("#file_").val());
	
}

function nullCheck(){
	if($("#fttitle").val().trim()==""){
		alert("제목을 입력하세요.");
		return false;
	}
	
	if($("#score").val()<0.5){
		alert("별점을 입력하세요")
		return false;
	}
/* 	
	if($("#title").val()==""){
		alert("제목을 입력하세요");
		return false;
	}
 */
	
	return true;
}

function titleUpdate(){
	$("#fttitle").attr("readonly",false);
	$("#updateButton").hide();
	$("#updateButtonAf").show();
}
function titleUpdateAf(){
	$("#updateButtonAf").hide();
	$("#updateButton").show();
	$("#fttitle").attr("readonly",true);
}

var imgTarget = $('.preview-image .upload-hidden');
imgTarget.on('change', function(){
	var parent = $(this).parent(); parent.children('.upload-display').remove();
	if(window.FileReader){ //image 파일만
		if (!$(this)[0].files[0].type.match(/image\//))return;
	var reader = new FileReader();
	reader.onload = function(e){
		var src = e.target.result;
		src_ = src;
		parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap" style="float:left" ><img src="'+src+'" class="upload-thumb"></div></div>');
		}
	reader.readAsDataURL($(this)[0].files[0]);
	} else {
		$(this)[0].select();
		$(this)[0].blur();
		var imgSrc = document.selection.createRange().text;
		parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
		var img = $(this).siblings('.upload-display').find('img');
		img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";
		}
	});


$(document).ready(function(){ var fileTarget = $('.filebox .upload-hidden');
fileTarget.on('change', function(){
	// 값이 변경되면
	if(window.FileReader){ // modern browser 
		var filename = $(this)[0].files[0].name; } else { // old IE 
		var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		} // 추출한 파일명 삽입 
		$(this).siblings('.upload-name').val(filename); 
	});
}); 


function reviewUpdate(){
	$("#reviewUpdateAf_frm").submit();
}
function back_(){
	location.href="reviewList.do";
}
</script>




</body>
</html>































