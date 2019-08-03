<%@page import="lala.com.a.model.ReviewDto"%>
<%@page import="lala.com.a.model.MemberDto"%>
<%@page import="lala.com.a.model.FestivalDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/fontawesome-stars.css"> 
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/resources/css/star.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/festivalDetail.css">
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/resources/css/festivalDetail.css"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<body>

<%
String id ="";
int seq =0;



 Object object = request.getAttribute("dto");
FestivalDto dto = null;
if(object!=null){
	dto = (FestivalDto)object;
	seq = dto.getSeq();
} 

Object objectLogin = session.getAttribute("login");
MemberDto login = null;


if(object!=null){
	login = (MemberDto)objectLogin;
	id = login.getId();
} 
%>
<!-- onsubmit="return nullCheck()" -->
<form action="reviewWriteAf.do" method="post" enctype="multipart/form-data"  onsubmit="return nullCheck()">

<img src="resources/images/Festival.jpg" alt="NO Picture" style="width: 100%;height: 330px">
	<p class="location-lst" style="margin-left: 5%">
		<span>라라투어</span>
		<span>축제&행사</span> 
		<span>축제&행사 후기</span> 
		<span class="active">축제&행사 후기작성</span>
	</p>


<br><br>
<div class="sub-detail-contents" id="sub-container">
	<div class="sub-detail-inner" >
		<!-- left-content -->
		<div class="left-content">
			<%-- <a href="#" onclick="festivalSeach()" id="fttitle">[<%=dto.getPlace() %>]<%=dto.getTitle() %></a>		<br><br> --%>

<div class="sub-detail-contents" id="sub-container">
	<div class="sub-detail-inner" > <!-- style="margin-left: -15%" -->
		<!-- left-content -->
		<div class="left-content">			
  			<div class="input-group-append">
			<%if(dto.getTitle()==null){ %>
				<a href="#"> 축제를 선택하세요.&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<input type="hidden" id="festivalNullCheck" value="<%=dto.getTitle()%>"> 
  				  <button class="btn btn-primary" type="button" onclick="festivalSeach()">축제</button>
			<%}else{%>
			 <a href="#">	<h>[<%=dto.getPlace() %>] <%=dto.getTitle() %>&nbsp;&nbsp;&nbsp;&nbsp;</h> </a>
			 <button class="btn btn-primary" type="button" onclick="festivalSeach()">수정</button>
			<%}%>			
  				</div>		
  				<br>
  				<div class="input-group" style="width: 60%">
 					 <div class="input-group-prepend">
   						<span class="input-group-text">Title</span>
  					</div>
 					 <input type="text" id="title" name="title" aria-label="First name" class="form-control" >
 				<!-- ////////////////////////축제 null check중///////////////////////////////// -->
</div>
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
			<div class="aside" style="width: 230px;top:500px; margin-left:33%; position: fixed;"><!-- scroll fixed 추가 -->
			<div class="detail-box">
				<span>관리자 리모콘</span>
			</div>
			<div class="right-content-inner">

				<dl class="detail-type">
					<dt>작성자ID</dt>
					<dd><a href="">${login.id} </a></dd>
					<dt>button</dt>
					<dd>
						<input type="button" class="btn btn-secondary" onclick="back_()" value="back">
<!-- 						<a href="" onclick="reviewWrite()">글 작성</a> -->
						<input type="submit" class="btn btn-secondary"  value="Write">
					</dd>
				</dl>				
			</div>
		</div>
	</aside>
</div>
	<!--// right-content -->
	
<div class="content_main" style="margin-left:-15%;max-width: 940px" >
<!-- ww이제부터 본문글 content -->
		<!-- www -->
	<div>
		<div>
			
			<div id="appendPtag" >
			</div>	
<!-- 			<p id="appendPtag">
			
			</p>	 -->
	<p style="clear:both">&nbsp;</p>
		
		</div>
	</div>
<br>

	<!-- 동적으로 보내는 입력창 -->

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
	
	 <!-- onchange="checkFile(this)" -->
	<input type="file" name="reviewFile" id="reviewFile0"  class="upload-hidden">
	<input type="file" name="reviewFile" id="reviewFile1"  class="upload-hidden" style="display: none;">
	<input type="file" name="reviewFile" id="reviewFile2"  class="upload-hidden" style="display: none;" onchange="checkFile(this)">
	<input type="file" name="reviewFile" id="reviewFile3"   class="upload-hidden" style="display: none;" onchange="checkFile(this)">
	<input type="file" name="reviewFile" id="reviewFile4"   class="upload-hidden" style="display: none;"onchange="checkFile(this)" >
	<input type="file" name="reviewFile" id="reviewFile5"   class="upload-hidden" style="display: none;" onchange="checkFile(this)">
	<input type="file" name="reviewFile" id="reviewFile6"   class="upload-hidden" style="display: none;" onchange="checkFile(this)">
	<input type="file" name="reviewFile" id="reviewFile7"    class="upload-hidden" style="display: none;" onchange="checkFile(this)">
	<input type="file" name="reviewFile" id="reviewFile8"    class="upload-hidden" style="display: none;" onchange="checkFile(this)">
	<input type="file" name="reviewFile" id="reviewFile9"   class="upload-hidden" style="display: none;" onchange="checkFile(this)">
	<input type="file" name="reviewFile" id="reviewFile10"  class="upload-hidden" style="display: none;" onchange="checkFile(this)">
	<input type="file" name="reviewFile" id="reviewFile11"  class="upload-hidden" style="display: none;" onchange="checkFile(this)">
	<input type="file" name="reviewFile" id="reviewFile12"  class="upload-hidden" style="display: none;" onchange="checkFile(this)">
	<input type="file" name="reviewFile" id="reviewFile13" class="upload-hidden" style="display: none;" onchange="checkFile(this)">
	<input type="file" name="reviewFile" id="reviewFile14"  class="upload-hidden" style="display: none;" onchange="checkFile(this)">
</div>			



	<textarea rows="15" cols="115" name="content" id="content0" class="content"></textarea>
	<textarea rows="15" cols="115" name="content" id="content1" class="content" style="display: none;"></textarea>
	<textarea rows="15" cols="115" name="content" id="content2" class="content" style="display: none;"></textarea>
	<textarea rows="15" cols="115" name="content" id="content3" class="content" style="display: none;"></textarea>
	<textarea rows="15" cols="115" name="content" id="content4" class="content" style="display: none;"></textarea>
	<textarea rows="15" cols="115" name="content" id="content5" class="content" style="display: none;"></textarea>
	<textarea rows="15" cols="115" name="content" id="content6" class="content" style="display: none;"></textarea>
	<textarea rows="15" cols="115" name="content" id="content7" class="content" style="display: none;"></textarea>
	<textarea rows="15" cols="115" name="content" id="content8" class="content" style="display: none;"></textarea>
	<textarea rows="15" cols="115" name="content" id="content9" class="content" style="display: none;"></textarea>
	<textarea rows="15" cols="115" name="content" id="content10" class="content" style="display: none;"></textarea>
	<textarea rows="15" cols="115" name="content" id="content11" class="content" style="display: none;"></textarea>
	<textarea rows="15" cols="115" name="content" id="content12" class="content" style="display: none;"></textarea>
	<textarea rows="15" cols="115" name="content" id="content13" class="content" style="display: none;"></textarea>
	<textarea rows="15" cols="115" name="content" id="content14" class="content" style="display: none;"></textarea>
	
	<button type="button" id="addFile" style="margin-left:20%;  float:right"; class="btn btn-primary">추가</button>
	<input type="hidden" name="score" id="score" value="">
	<input type="hidden" name="pseq" value="<%=seq%>">
	<input type="hidden" name="id" value="<%=id%>">
	
			
		
			</div>
		</div>
	</div>
</div>
</form>


<br>
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

function festivalSeach(){	
	
	
	
	
	
	
	location.href="festivalSeach.do";

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

	$("#appendPtag").append(
			"<div id='ImgNull"+i+"' style='margin-top:50px'>"+
		 		"<div  style='float:left'>"+
		 			"<img src='"+src_+"' style='width: 400px;height:265px;margin-top: 24px;' id=''>"+
		 		"</div>"+	
		 		"<div style='float:right;width:330px;margin-top: 25px;'>"+
		 			"<input type='button' id='delete_"+i+"' onclick='reviewWriteDel("+i+")' value='삭제' class='btn btn-secondary'>"+"<br>"+
		 			"<textarea rows='9' cols='70' readonly='readonly' id='hcontent"+i+"' style='border:none; outline:none'>"+$('#content'+i).val()+"</textarea>"+
		 		"</div>"+
	 		"</div>"
	 		)

	i++;
	
	$(".content").hide();
	$(".fileLabel1").hide();
	$(".upload-name").val("파일 업로드");
	
	$("[name='reviewFile"+i+"']").show();
	$("#content"+i).show();
	

	
})
 
function reviewWriteDel(i){
	
	$("#delete_"+i).hide();
	$("#hdelete_"+i).hide();
	$("#hcontent"+i).hide();
	$("#ImgNull"+i).empty();
	$("#reviewFile"+i).val("");
	$("#content"+i).val("");
	
}

function nullCheck(){
	<%-- var title = '<%=dto.getTitle()%>'; --%>
	
/* 
	if(title==null){
		alert("축제를 선택하세요");
		return false;
	} 
	 */
	if($("#festivalNullCheck").val().trim="null"){
		alert("축제를 선택하세요")
		return false;
	}
	
	if($("#score").val()<0.5){
		alert("별점을 입력하세요.")
		return false;
	}
	if($("#title").val()==""){		
		alert("제목을 입력하세요")
		return false;
	}	
	if($("#reviewFile0").val()==""){
		alert("파일을 입력하세요.2")
		return false;
	}
	
	if($("#content0").val().trim()==""){
		alert("내용을 입력하세요")
		return false;
	}
	return true;
}
function reviewWrite(){
	
// 	$("#reviewWriteAf_frm").submit();
	location.href="reviewWriteAf.do";
}



var i =0;
var src = '';
var aa = true;
var imgTarget = $('.preview-image .upload-hidden');
imgTarget.on('change', function(){
	var parent = $(this).parent(); 
	parent.children('.upload-display').remove();
	if(window.FileReader){ //image 파일만
		if (!$(this)[0].files[0].type.match(/image\//)){
			alert("이미지 파일만 첨부하세요");

			aa = false;
			
			return;
		}
//  		if(!/\.(gif|jpg|jpeg|png)$/i.test(this[0].files[0].name)) return;
	 
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
		if(aa==false){
			$(this).siblings('.upload-name').val("");
			
			aa=true;
			
		}else{
			
			$(this).siblings('.upload-name').val(filename); 
			
		}
	});
}); 

function back_(){
	location.href="reviewList.do";
}

/* 
function checkFile(f){
	var	file =f.files
	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name))
		alert('이미지 파일만 선택해 주세요.\n현재 파일 : ' + file[0].name);
	else return;
	f.outerHTML = f.outerHTML;
}
 */
</script>





</body>
</html>