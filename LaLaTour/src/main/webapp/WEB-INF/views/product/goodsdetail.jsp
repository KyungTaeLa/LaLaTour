<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/product.css">

<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
<script src="https://unpkg.com/ionicons@4.5.5/dist/ionicons.js"></script>

<c:if test="${goods.gid ne login.id}">
	<script>
		alert("로그인 해야 합니다");
		location.href="mainpage.do";
	</script>
</c:if>

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
th {
	font-size: 20px;
	color: #514c4c;
	text-align: center;
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
.goodsupdate_imagedelbtn {
	width: 100px;
	background-color: white;
	padding: 5px 10px;
	border: 1px solid black;
	color: black;
	text-align: center;
	text-decoration: none;
	font-size: 15px;
	display: inline-block;
	cursor: pointer;
	border-radius: 10px;
	/* box-shadow:1px 1px 1px; */
}
.goodsupdate_imagedelbtn:hover {
	color: red;
	border: 1px solid red;
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
<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
	<div class="middleImg">
		<h1 class="middleTitle">Shopping</h1>
	</div>
</div>

<div id="outer">
<div id="inner">
    
<h1>상품평 수정</h1>

<div id="totalDiv" style="width: 1250px;">

<div id="topDiv" style="width: 1250px;">
	<table class="padding10 colline">
	<colgroup>
		<col width="250px"><col width="1000px">
	</colgroup>
	<tr>
		<td>
			<img alt="" src="<%=request.getContextPath()%>/upload/${goods.thumbNail}" style="width: 200px; height: 200px;">
		</td>
		<td>
			<span style="font-size: 25px; font-weight: 300; color: #514c4c">${goods.title}</span>
			<span class="selllist_rednumber" style="font-size: 20px;">(${goods.subtitle})</span>
		</td>
	</tr>
	</table>
</div> <!-- end topDiv -->

<form id="_goodsForm" method="post" enctype="multipart/form-data">
<input type="hidden" name="goods_seq" value="${goods.goods_seq}">
<input type="hidden" name="gpseq" value="${goods.product_seq}">
<input type="hidden" name="gid" value="${goods.gid}">
<input type="hidden" name="gcseq" value="${goods.gcseq}">

<div id="pointDiv" style="width: 1250px; display: inline-block;">
	<table class="padding5 colline">
	<colgroup>
		<col width="250px"><col width="1000px">
	</colgroup>
	<tr>
		<th>별점 선택</th>
		<td>
			<div id="starRight" style="width: 900px; height: 100%; float: left;">
				<input type="hidden" name="oripoint" value="${goods.gpoint}">
				<input type="hidden" name="gpoint" id="_gpoint" value="${goods.gpoint}">
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
			<textarea name="gcontent" id="_gcontent" rows="10" cols="100" >${goods.gcontent}</textarea>
		</td>
	</tr>
	<tr>
		<th>이미지 첨부<br>(한 장만 첨부 가능)</th>
		<td>
		<div style="width: 900px; height: 180px;">
			<div style="display:inline-block; width: 400px; height: 150px; padding: 5px 5px; background-color: #e8e8e8;">
				<c:if test="${not empty goods.pictures}">
					<div style="width: 100px; height: 100px;">
						<img id="_oriImage" src="<%=request.getContextPath()%>/upload/${goods.pictures}" style="width: 100px; height: 100px;">
					</div>
					<input type="text" name="pictures" id="_pictures" value="${goods.pictures}" readonly="readonly" style="border: none;">
					<button type="button" class="goodsupdate_imagedelbtn" id="_delBtn">파일 삭제</button>
					<button type="button" class="goodsupdate_imagedelbtn gray" id="_cancelBtn">삭제 취소</button>
				</c:if>
					<c:if test="${empty goods.pictures}">
						이미지 없음...
					</c:if>
			</div>
			<div style="display:inline-block; width: 400px; height: 150px; padding: 5px 5px; background-color: #f4f4f4;">
				<div style="width: 100px; height: 100px;">
					<img id="inputThumbNail" alt="이미지없음" src="<%=request.getContextPath()%>/resources/images/product/noimage.gif" style="width: 100px; height: 100px; float: left;">
				</div>
				<div style="height: 150px;">
					변경:&nbsp;<input type="file" id="imgInp" name="fileload" id="_fileload" accept=".jpg, .jpeg, .png, .bmp, .gif" style="display: none;">
					<label for="imgInp" class="fileChoiceBtn">파일선택</label>
					<input type="text" class="inputtext" id="fName" style="height: 28px; vertical-align: bottom; border: none;">
				</div>
			</div>
		</div>
		</td>
	</tr>
	</table>
</div> <!-- end pointDiv -->

<div id="btnDiv" style="width: 1250px; display: inline-block; padding-top: 20px; text-align: center;">
	<div>
		<button type="button" class="selllist_goodsBtn" onclick="updateBtnClick()">수정</button>
		<button type="button" class="selllist_goodsBtn selllist_gray" onclick="backBtnClick()">취소</button>
	</div>
</div> <!-- end btnDiv -->
</form>

</div> <!-- end totalDiv -->

</div> <!-- end inner -->
</div> <!-- end outer -->



<script>
var msgArr = new Array("아쉽네요", "그냥그래요", "보통이에요", "좋아요", "최고예요");
var filename = $("#_pictures").val();
var oriImage = $("#_oriImage").attr("src");

$(document).ready(function() {
	var index = Number($("#_gpoint").val())-1;
	//alert("index: " + index);
	
	var stars = document.getElementsByName("star");
	
	for(var i=4; i>=0; i--) {
		stars[i].style.color="black";
	}
	for(var i=4; i>=4-index; i--) {
		stars[i].style.color="#ffd52d";
	}
	
	var pmsg = 
		"<p id='msgs'><font style='font-size: 20px; color: #ffd52d;'>"
		+ Number($("#_gpoint").val()) + "점 "
		+ msgArr[Number($("#_gpoint").val())-1]
		+ "</font></p>";
	//$("#starRight").append(pmsg);
	
});

//이미지 첨부에서 파일삭제, 삭제취소 버튼을 눌렀을때 각각 동작
$(document).on("click", "#_delBtn", function() {
	$("#_pictures").val("");
	$("#_oriImage").attr("src", "<%=request.getContextPath()%>/resources/images/product/noimage.gif");
});
$(document).on("click", "#_cancelBtn", function() {
	$("#_pictures").val(filename);
	$("#_oriImage").attr("src", oriImage);
});

function updateBtnClick() {
	if($("#_gcontent").val().trim()=='') {
		alert("상품평을 입력해 주세요");
		return;
	}
	if($("#_gpoint").val()=='0') {
		alert("별점을 선택해 주세요(최소 1점)");
		return;
	}
	
	$("#_goodsForm").attr("action", "updateGoodsAf.do").submit();
}

// 별점 별 마우스 호버작동
$("ion-icon[name=star]").hover(function(onmouseover) {
	var index = Number($(this).attr("value"))-1;
	
	var stars = document.getElementsByName("star");
	
	//색깔 까맣게 바꿔놓고
	for(var i=4; i>=0; i--) {
		stars[i].style.color="black";
	}
	//호버하기
	for(var i=4; i>=4-index; i--) {
		//stars[i].style.color="#c0392b";
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

// 별점 별 클릭했을 때
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
    }
    else {
    	$('#inputThumbNail').attr('src', "<%=request.getContextPath()%>/resources/images/product/noimage.gif");
    }
}
</script>




























