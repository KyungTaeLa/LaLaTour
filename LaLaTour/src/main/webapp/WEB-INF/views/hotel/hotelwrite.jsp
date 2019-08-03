<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- local CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/hotelWrite.css">
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<div>
<img alt="" src="<%=request.getContextPath() %>/resources/images/hotel_top.png" border="0" style="width: 100%; height: 230px;">
</div>
<form name="frmFrom" id="_frmForm" action="hotelwriteAf.do" method="post" enctype="multipart/form-data" onsubmit="return submitChk()">
<c:if test="${empty login or login.auth ne '1'  }">
	<script type="text/javascript">
		alert("접근 권한이 없는 페이지입니다.");
		location.href="hotellist.do";
	</script>
</c:if>
<div class="sub-container">
<p class="topPath">
<a href="hotellist.do">숙박</a> > <b>호텔 등록</b></p><br>
<div class="tb_div">
	<div class="tb_sub">
		<table class="tb_main">
		<colgroup>
			<col width=15%"><col width="*">
		</colgroup>
		<div class="tr_top"></div>
		<tr >
			<th>호텔 명</th>
			<td>
				<input type="text" name="title" id="title" value="" placeholder="호텔 명을 입력해주세요">
			<td>
		</tr>
		<tr>
			<th>지역</th>
			<td>
				<select name="place1" id="place1">
					<option value="서울특별시">서울특별시</option>
					<option value="경기도">경기도</option>
					<option value="강원도">강원도</option>
					<option value="충청도">충청도</option>
					<option value="전라도">전라도</option>
					<option value="경상도">경상도</option>
					<option value="제주도">제주도</option>
				</select>
				<input type="text" value="" name="place2" id="place2" placeholder="상세주소">
				<input type="hidden" value="" name="place" id="place">
			<td>
		</tr>
		<tr>
			<th>구글맵 URL</th>
			<td>
				<span id="url_info">구글맵 -> 주소검색 -> 공유 -> 지도퍼가기 -> HTML복사 후 붙여넣기 <button id="move_to_map" type="button">이동</button></span><br>
				<input type="text" value="" name="mapurl" id="mapurl" placeholder="url을 입력해주세요">
			<td>
		</tr>
		<tr>
			<th>객실 수</th>
			<td>
				<input type="text" name="maxcount" id="maxcount" value="" maxlength="200"
				placeholder="숫자만 입력해주세요"onkeydown='return onlyNumber(event)' onkeyup='removeChar(event) numberWithCommas(this.vale)'>
			</td>
		</tr>
		<tr>
			<th>사진첨부</th>
			<td>
				<div class="filebox bs3-primary preview-image">
		            <input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
		            <label for="_pFiles">업로드</label> 
		            <input  multiple="multiple" type="file" id="_pFiles"  name="pFiles[]" class="upload-hidden"> 
		        </div>
			</td>
		</tr>
		<tr>
			<th>썸네일첨부</th>
			<td>
			<div class="thumbBtn">
				<div class="filebox bs3-primary preview-image">
		            <input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
		            <label for="input_file">업로드</label> 
		            <input type="file" id="input_file"  name="fileThumb" class="upload-hidden"> 
		        </div>
	        </div>
	
			<td>
		</tr>
		<tr>
			<th>1일 숙박비용</th>
			<td> 
				<input type="text" value="" name="price" id="price" maxlength="200"
				placeholder="숫자만 입력해주세요" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
			<td>
		</tr>
		<tr class="tr_last">
			<th>내용</th>
			<td>
				<textarea rows="20" cols="115" style="resize: none;" id="content" name="content"></textarea>
			<td>
		</tr>
		</table>
	</div>
</div>
<div class="div_btn">
	<a href="#" class="myButton" onclick="smWrite()">호텔 등록</a>
	<a href="#" class="myButton" onclick="location.href='hotellist.do'">돌아가기</a>
	<input type="hidden" value="${login.id }" name="id">
</div>
</form>
</div>

<script type="text/javascript">
/* 구글맵 이동 */
$("#move_to_map").click(function () {
	window.open("https://www.google.co.kr/maps/@45.2000678,17.2800773,5z?hl=ko");
});
function smWrite(){
	$("#_frmForm").submit();
}
function numberWithCommas(x) {
	  x = x.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
	  x = x.replace(/,/g,'');          // ,값 공백처리
	  $("#money").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // 정규식을 이용해서 3자리 마다 , 추가 
	}
function submitChk(){
	var place1 = $("#place1").prop("selected",true).val();
	var place2 = $("#place2").val();
	var place = "[" + place1 + "] " + place2;
	var mapurl = $("#mapurl").val();
	var title = $("#title").val();
	var maxcount = $("#maxcount").val();
	var _pFiles = $("#_pFiles").val();
	var input_file = $("#input_file").val();
	var price = $("#price").val();
	var content =$("#content").val();
	
	// 플레이스 합치기
	if(place2 != null && place2 != ""){
		$("#place").val(place);
	}
	
	// 널체크 //
	if(title == "" || title == null){
		alert("호텔명을 입력해주세요");
		$("#title").focus();
		return false;
	}
	else if(place == "" || place == null){
		alert("지역을 입력해주세요");
		$("#place2").focus();
		return false;
	}
	else if(mapurl == "" || mapurl == null){
		alert("URL을 입력해주세요");
		$("#mapurl").focus();
		return false;
	}
	else if(maxcount == "" || maxcount == null){
		alert("객실수를 입력해주세요");
		$("#maxcount").focus();
		return false;
	}
	else if(_pFiles == "" || _pFiles == null){
		alert("사진을 첨부해주세요");
		$("#_pFiles").focus();
		return false;
	}
	else if(input_file == "" || input_file == null){
		alert("썸네일을 첨부해주세요");
		$("#input_file").focus();
		return false;
	}
	else if(price == "" || price == null){
		alert("숙박비용을 입력해주세요");
		$("#price").focus();
		return false;
	}
	else if(content == "" || content == null){
		alert("내용을 입력해주세요");
		$("#content").focus();
		return false;
	}
	
	return true;
}
function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        return false;
}
 
function removeChar(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
$('#_pFiles').change(function(){
	
	const target = document.getElementsByName('pFiles[]');
	        
	var html = '';
	$.each(target[0].files, function(index, file){
		
	    const fileName = file.name;
	    const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
	    if(fileEx != "jpg" && fileEx != "png" &&  fileEx != "gif" &&  fileEx != "bmp" && 
	    		fileEx != "wmv" && fileEx != "mp4" && fileEx != "avi"){
	    	
	        alert("파일은 (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.");

			$("#_pFiles").val("");
	        return false;
	    }
	 });
});
$('#input_file').change(function(){
	
	const target = document.getElementsByName('fileThumb');
	        
	var html = '';
	$.each(target[0].files, function(index, file){
		
	    const fileName = file.name;
	    const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
	    if(fileEx != "jpg" && fileEx != "png" &&  fileEx != "gif" &&  fileEx != "bmp" && 
	    		fileEx != "wmv" && fileEx != "mp4" && fileEx != "avi"){
	    	
	        alert("파일은 (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.");

			$("#input_file").val("");
	        return false;
	    }
	 });
});


$(document).ready(function(){
	   var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            // 파일명 추출
	            var filename = $(this)[0].files[0].name;
	        } 

	        else {
	            // Old IE 파일명 추출
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        };

	        $(this).siblings('.upload-name').val(filename);
	    });

	    //preview image 
	    var imgTarget = $('.preview-image .upload-hidden');

	    imgTarget.on('change', function(){
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();

	        if(window.FileReader){
	            //image 파일만
	            if (!$(this)[0].files[0].type.match(/image\//)) return;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }

	        else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
	    });
	});
</script>

</body>
</html>


