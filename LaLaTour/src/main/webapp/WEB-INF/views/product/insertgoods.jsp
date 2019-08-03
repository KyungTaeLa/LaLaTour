<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/product.css">

<script src="https://unpkg.com/ionicons@4.5.5/dist/ionicons.js"></script>



<!-- <style>
.star-rating {
	unicode-bidi: bidi-override;
	direction: rtl;
}
.star-rating > span {
	display: inline-block;
	position: relative;
	width: 1em;
	font-size: 3em;
	/* float: left; */
}
.star-rating > span:hover:before,
.star-rating > span:hover ~ span:before {
	content: "\2605";
	position: absolute;
	color: #e87474;
}
</style> -->

<style>

.middleImg{ 
margin-top:60px;
	background-image: url("<%=request.getContextPath() %>/resources/images/product/productshop_top.jpg");
	background-repeat: no-repeat;
 	background-size: 100% 230px; 
	height: 230px;
}
.middleTitle{
	color: black;
	text-align: center;
	padding-top: 85px;
	font-size: 60px;
}
.middleAll{
	margin-top: 100px;
}

th {
	font-size: 20px;
	color: #514c4c;
	text-align: center;
}
#starRight{
	position: static;
	top: 50%;
	left: 100%;
	direction: rtl;
	/* float: left; */
	/* transform: translate(-60%); */
}
#starRight ion-icon {
	font-size: 90px;
}
.inputtext {
	border: 1px solid #7a7676;/
	border-radius: 8px;
	height: 20px;
}
.inputckbox {
	width: 20px;
	height: 20px;
}
table {
	border-collapse: collapse;
	border-left: none;
	border-right: none;
}
.padding10 td, .padding10 th {
	padding: 10px;
}
.padding5 td, .padding5 th {
	padding: 5px;
}
.colline {
	border: none;
	border-top: 3px solid black;
}
.colline td, .colline th {
	border-bottom: 1px solid #bfc1bd;
}
.basic th, .basic td{
 	border: 1px solid #bfc1bd;
}
.smallbtn {
	width: 40px;
	height: 40px;
	background-color: white;
	border: 1px solid gray;
	color: black;
	text-align: center;
	font-size: 25px;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
}
.goodswritebtn {
	width: 150px;
	background-color: white;
	padding: 10px 20px;
	/* border: 1px solid black; */
	border: none;
	color: black;
	text-align: center;
	text-decoration: none;
	font-size: 20px;
	display: inline-block;
	cursor: pointer;
	border-radius: 10px;
	box-shadow:1px 1px 1px;
}
.bigbtnred {
	width: 180px;
	background-color: #f74242; /* #E55310; */
	padding: 15px 30px;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	font-size: 25px;
	display: inline-block;
	cursor: pointer;
}
</style> 

<!-- 상단이미지 -->
<%-- <div>
	<img alt="" src="<%=request.getContextPath() %>/resources/images/productlisttop.jpg" border="0" style="width: 100%; height: 230px;">
</div> --%>
<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
	<div class="middleImg">
		<h1 class="middleTitle">Shopping</h1>
	</div>
</div>

<div id="outer">
<div id="inner">
    
<h1>상품평 작성</h1>

<div id="totalDiv" style="width: 1250px;">

<div id="topDiv" style="width: 1250px;">
	<table class="padding10 colline">
	<colgroup>
		<col width="250px"><col width="1000px">
	</colgroup>
	<tr>
		<td>
			<img align="middle" src="<%=request.getContextPath()%>/upload/${product.thumbNail}" style="width: 200px; height: 200px;">
		</td>
		<td>
			<span style="font-size: 25px; font-weight: 300; color: #514c4c">${product.title}</span>
			<span class="selllist_rednumber" style="font-size: 20px;">(${product.subtitle})</span>
		</td>
	</tr>
	</table>
</div> <!-- end topDiv -->

<form id="_goodsForm" method="post" enctype="multipart/form-data">
<input type="hidden" name="gpseq" value="${product.product_seq}">
<input type="hidden" name="gid" value="${login.id}">
<input type="hidden" name="gcseq" value="${cart_seq}">

<div id="pointDiv" style="width: 1250px; display: inline-block;">
	<table class="padding5 colline">
	<colgroup>
		<col width="250px"><col width="1000px">
	</colgroup>
	<tr>
		<th>별점 선택</th>
		<td>
			<div id="starRight" style="width: 900px; height: 100%; float: left;">
				<input type="hidden" name="gpoint" id="_gpoint" value="0">
				<ion-icon name="star" value="5" class="b1"></ion-icon>
				<ion-icon name="star" value="4" class="b2"></ion-icon>
				<ion-icon name="star" value="3" class="b3"></ion-icon>
				<ion-icon name="star" value="2" class="b4"></ion-icon>
				<ion-icon name="star" value="1" class="b5"></ion-icon>
			</div>
		</td>
	</tr>
	<tr>
		<th>상품평</th>
		<td>
			<textarea name="gcontent" id="_gcontent" rows="10" cols="100" style="resize: none;"></textarea>
		</td>
	</tr>
	<tr>
		<th>이미지 첨부<br>(한 장만 첨부 가능)</th>
		<td>
		<div style="display: table;">
			<div style="width: 100px; height: 100px; display: table-cell; vertical-align: middle;">
				<img id="inputThumbNail" src="<%=request.getContextPath()%>/resources/images/product/noimage.gif" style="border: 1px solid #bfc1bd; width: 100px; height: 100px; float: left;">
			</div>
			<div style="display: table-cell; vertical-align: middle;">
				<input type="file" id="imgInp" name="fileload" id="_fileload" accept=".jpg, .jpeg, .png, .bmp, .gif" style="margin-left: 10px; display: none;">
				<label for="imgInp" class="fileChoiceBtn">파일선택</label>
				<input type="text" class="inputtext" id="fName" style="height: 28px; vertical-align: bottom; border: none;">
			</div>
		</div>
		</td>
	</tr>
	</table>
</div> <!-- end pointDiv -->

<div id="btnDiv" style="width: 1250px; display: inline-block; padding-top: 20px; text-align: center;">
	<div>
		<button type="button" class="selllist_goodsBtn selllist_blue" onclick="addBtnClick()">등록</button>
		<button type="button" class="selllist_goodsBtn selllist_gray" onclick="location.href='sellList.do'">취소</button>
	</div>
</div> <!-- end btnDiv -->
</form>

</div> <!-- end totalDiv -->

</div> <!-- end inner -->
</div> <!-- end outer -->


<script>
var msgArr = new Array("아쉽네요", "그냥그래요", "보통이에요", "좋아요", "최고예요");

function addBtnClick() {
	if($("#_gcontent").val().trim()=='') {
		alert("상품평을 입력해 주세요");
		return;
	}
	if($("#_gpoint").val()=='0') {
		alert("별점을 선택해 주세요(최소 1점)");
		return;
	}
	
	$("#_goodsForm").attr("action", "insertGoodsAf.do").submit();
}

$("ion-icon[name=star]").hover(function(onmouseover) {
	var index = Number($(this).attr("value"))-1;
	
	var stars = document.getElementsByName("star");
	
	//색깔 까맣게 바꿔놓고
	for(var i=4; i>=0; i--) {
		stars[i].style.color="black";
	}
	//호버하기
	for(var i=4; i>=4-index; i--) {
		stars[i].style.color="#ffd52d";
	}
}, function(onmousedown) {
	var index = Number($("#_gpoint").val())-1;
	
	var stars = document.getElementsByName("star");
	
	//색깔 까맣게 바꿔놓고
	for(var i=4; i>=0; i--) {
		stars[i].style.color="black";
	}
	//호버하기
	for(var i=4; i>=4-index; i--) {
		stars[i].style.color="#ffd52d";
	}
})

$(document).on("click", "ion-icon[name=star]", function() {
	var index = Number($(this).attr("value"))-1;
	
	var stars = document.getElementsByName("star");
	
	//alert("value: " + $(this).attr("value"));
	
	for(var i=4; i>=0; i--) {
		stars[i].style.color="black";
	}
	for(var i=4; i>=4-index; i--) {
		stars[i].style.color="#ffd52d";
	}
	
	$("#_gpoint").val($(this).attr("value"));
	//alert($("#_gpoint").val());
	
	$("#msgs").remove();
	var pmsg = 
		"<p id='msgs'><font style='font-size: 20px; color: #ffd52d;'>"
		+ Number($("#_gpoint").val()) + "점 "
		+ msgArr[Number($("#_gpoint").val())-1]
		+ "</font></p>";
	//$("#starRight").append(pmsg);
	
});

//썸네일 파일선택 했을때
$(document).on("change", "#imgInp", function() {
	readURL(this);
});
function readURL(input) {
    if (input.files && input.files[0]) {
    	var reader = new FileReader();

    	reader.onload = function (e) {
            $('#inputThumbNail').attr('src', e.target.result);
		}

		reader.readAsDataURL(input.files[0]);
		
		/////////////////////////
		
		//var fname = this.files[0].name;
		$("#fName").val(input.files[0].name);
    }
    else {
    	$('#inputThumbNail').attr('src', "<%=request.getContextPath()%>/resources/images/product/noimage.gif");
    	$("#fName").val("");
    }
}
</script>




























