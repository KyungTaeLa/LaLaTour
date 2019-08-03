<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/product.css">


<c:if test="${empty login || login.auth ne '1'}">
	<script>
		alert("권한이 없습니다");
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

hr {
	margin: 10px;
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
	border: 1px solid #7a7676;
	width: 170px;
	height: 30px;
}
th {
	font-size: 18px;
	color: #514c4c;
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
#outer {
	width: 100%;
	text-align: center;
	margin-top: 30px;
	padding-bottom: 20px;
}

#inner {
	display: inline-block;
	width: 1250px;
	text-align: left;
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
	border: 1px solid black;
	/* border: none; */
	color: black;
	text-align: center;
	text-decoration: none;
	font-size: 20px;
	display: inline-block;
	cursor: pointer;
	border-radius: 10px;
	box-shadow:1px 1px 1px;
}
.blue100btn  {
	width: 100px;
	background-color: white;
	padding: 5px 10px;
	border: 1px solid #1c6fb2;
	color: #1c6fb2;
	text-align: center;
	text-decoration: none;
	font-size: 15px;
	font-weight: bolder;
	display: inline-block;
	cursor: pointer;
	border-radius: 10px;
	box-shadow:1px 1px 1px;
}
.goodsupdate_imagecancelbtn, .filechoice_btn {
	width: 100px;
	background-color: #e8e8e8;
	padding: 5px 10px;
	border: 1px solid black;
	/* border: none; */
	color: black;
	text-align: center;
	text-decoration: none;
	font-size: 15px;
	display: inline-block;
	cursor: pointer;
	border-radius: 10px;
	box-shadow:1px 1px 1px;
}
.bigbtnblack {
	width: 250px;
	background-color: black;
	padding: 15px 30px;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	font-size: 30px;
	display: inline-block;
	cursor: pointer;
}
.bigbtnred {
	width: 250px;
	background-color: #E55310;
	padding: 15px 30px;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	font-size: 30px;
	display: inline-block;
	cursor: pointer;
}

.productupdate_searchBtn  {
	width: 100px;
	background-color: white;
	padding: 5px 10px;
	border: 1px solid #1c6fb2;
	color: #1c6fb2;
	text-align: center;
	text-decoration: none;
	font-size: 15px;
	display: inline-block;
	cursor: pointer;
	vertical-align: middle;
}
.productupdate_searchBtn:hover {
	background-color: #d9ecfc;
}
.productupdate_addFileBtn  {
	width: 100px;
	background-color: #434b51;
	padding: 5px 10px;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	font-size: 15px;
	display: inline-block;
	cursor: pointer;
	/* border-radius: 10px; */
	/* box-shadow:1px 1px 1px; */
}
.selllist_goodsBtn {
	width: 150px;
	background-color: white;
	padding: 10px 10px;
	border: 1px solid black;
	/* border: none; */
	color: black;
	text-align: center;
	text-decoration: none;
	font-size: 20px;
	display: inline-block;
	cursor: pointer;
	/* border-radius: 10px; */
	/* box-shadow:1px 1px 1px; */
}
.selllist_goodsBtn:hover {
	color: red;
	font-weight: bolder;
	border: 2px solid red;
	
	/* color: white;
	background-color: red;
	font-weight: bolder; */
}
.black:hover {
	background-color: #f4f4f4;
	border: 2px solid black;
	color: black;
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
    
<h1>제품 등록</h1>

<div id="totalDiv" style="width: 1250px;">

<form action="productwriteaf.do" id="_frmWrite" method="post" enctype="multipart/form-data">

<table class="padding10 colline">
<colgroup>
	<col width="250px"><col width="1000px">
</colgroup>

<tbody>
<tr>
	<th>ID</th>
	<td><input type="text" name="id" value="${login.id}" class="inputtext" readonly="readonly"></td>
</tr>
<tr>
	<th>제목</th>
	<td><input type="text" name="title" class="inputtext" id="_title"></td>
</tr>
<tr>
	<th>단위수량</th>
	<td><input type="text" name="subtitle" class="inputtext" id="_subtitle"></td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="100" name="content" id="_content"></textarea>
	</td>
</tr>
<tr>
	<th>썸네일</th>
	<td>
	<div style="display: table;">
		<div style="width: 100px; height: 100px; display: table-cell; vertical-align: middle; margin-right: 10px;">
			<img id="inputThumbNail" src="<%=request.getContextPath()%>/resources/images/product/noimage.gif" style="border: 1px solid #bfc1bd; width: 100px; height: 100px; float: left;">
		</div>
		<div style="display: table-cell; vertical-align: middle;">
			<input type="file" id="imgInp" name="filethumbnail" accept=".jpg, .jpeg, .png, .bmp, .gif" style="display: none;">
			<label for="imgInp" class="fileChoiceBtn">파일선택</label>
			<input type="text" class="inputtext" id="fName" style="height: 28px; vertical-align: bottom; border: none;">
		</div>
	</div>
	</td>
</tr>
<tr>
	<th>수량</th>
	<td><input type="text" name="pcount" class="inputtext" id="_pcount"></td>
</tr>
<tr>
	<th>원산지</th>
	<td>
	<select name="place1" id="_place1" class="inputtext">
		<option value="서울특별시" selected="selected">서울특별시</option>
        <option value="경기도">경기도</option>
        <option value="강원도">강원도</option>
        <option value="충청도">충청도</option>
        <option value="전라도">전라도</option>
        <option value="경상도">경상도</option>
        <option value="제주도">제주도</option>
	</select><br><br>
	상세 주소 : <input type="text" name="place2" class="inputtext" id="_place2">
	<input type="hidden" name="place" id="_place">
	</td>
</tr>
<tr>
	<th>관련축제</th>
	<td>
		<input type="text" id="f_title" class="inputtext" readonly="readonly" placeholder="축제를 검색해 주세요">
		<button type="button" id="_deleteBtn" class="productupdate_searchBtn">취소</button>
		<br><hr>
		<input type="hidden" name="fseq" id="_fseq" value="0">
		<input type="text" id="s_keyword" class="inputtext" placeholder="축제 검색어 입력">
		<button type="button" id="_festivalBtn" class="productupdate_searchBtn">검색</button>
		<div id="demo" class="demo" style="display: none; width: 600px; padding: 5px; margin-top: 5px; background-color: #e0e0e0;">
		</div>
	</td>
</tr>
<tr>
	<th>가격</th>
	<td><input type="text" name="price" id="_price" class="inputtext"></td>
</tr>
<tr>
	<th>이미지</th>
	<td id="_imageTd">
		<button type="button" id="faddBtn" class="productupdate_addFileBtn">입력추가</button>
		<hr>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<button type="button" class="selllist_goodsBtn" onclick="check()">제품등록</button>
		<button type="button" class="selllist_goodsBtn black" onclick="location.href='productlist.do'">제품목록</button>
	</td>
</tr>
</tbody>
</table>
</form>
</div> <!-- end totalDiv -->

</div> <!-- end inner -->
</div> <!-- end outer -->


<script>
//축제검색 버튼 클릭
$("#_festivalBtn").click(function() {
	if($("#s_keyword").val()=="") {
		alert("검색어를 입력해야 합니다");
	}
	else {
		getFestivalList();
	}
});

//축제 삭제 버튼
$("#_deleteBtn").click(function() {
	$("#_fseq").val("0");
	$("#f_title").val("");
});

//파일입력 버튼 클릭
$("#faddBtn").on("click", function() {
	var etag = "<div style='padding-bottom: 5px;'><input multiple='multiple' type='file' name='fileload' accept='.jpg, .jpeg, .png, .bmp, .gif'>";
	etag += "<button type='button' onclick='delEl(this)' class='productupdate_addFileBtn' style='width: 60px;' style='width: 70px;'>취소</button><br></div>";
	$("#_imageTd").append(etag);
});

//파일입력폼 중 하나를 지울때, 엘리먼트 삭제시킴
function delEl(obj) {
	$(obj).parent().remove();
}

//축제검색 시 목록가져와서 화면에 뿌려줄 ajax
function getFestivalList() {
	$.ajax({
		url: "getFestivalList.do",
		type: "get",
		data: { s_keyword:$("#s_keyword").val() },
		
		success: function(data) {
			//alert("ss");
			var list = data.list; //list로 날아왔음
			$("#demo").empty();
			$("#demo").show();
			
			if(list.length==0) {
				alert("검색된 축제가 없습니다");
				$("#s_keyword").val("");
				$("#demo").empty();
				$("#demo").hide();
			}
			else {
				for(i=0; i<list.length; i++) {
					if(i==0) {
						var tag = "<input type='radio' name='fseqs' value='" + list[i].seq + "' ftname='" + list[i].title + "' checked='checked'>" + list[i].title;
					}
					else {
						var tag = "<input type='radio' name='fseqs' value='" + list[i].seq + "' ftname='" + list[i].title + "'>" + list[i].title;
					}
					$("#demo").append(tag + "<br>");
					//$("#demo").innerHTML(tag);
				}
				
				var tag = "<br><button type='button' id='setBtn' class='productupdate_searchBtn' style='width: 60px;' style='width: 70px;'>선택</button> ";
				$("#demo").append(tag);
				var tag = "<button type='button' id='cancelBtn' class='productupdate_searchBtn' style='width: 60px;' style='width: 70px;'>취소</button>";
				$("#demo").append(tag);
			}
		},
		error: function(r,s,err) {
			alert("error");
		}
	});
}

//축제 검색해서 하나를 선택하면 등록
$(document).on("click", "#setBtn", function() {
	var fseq = $("input[name=fseqs]:checked").attr("value");
	var ftitle = $("input[name=fseqs]:checked").attr("ftname");
	$("#f_title").val(ftitle);
	$("#_fseq").val(fseq);
	$("#s_keyword").val("");
	$("#demo").empty();
	$("#demo").hide();
});

//축제검색했지만 등록안할때, 축제목록사라짐
$(document).on("click", "#cancelBtn", function() {
	$("#s_keyword").val("");
	$("#demo").empty();
	$("#demo").hide();
});

function check() {
	//제목 공백 안돼요
	var title = $("#_title").val().trim();
	$("#_title").val(title);
	if(title=="" || title.length==0) {
		alert("제목을 입력하세요");
		return false;
	}
	
	//단위수량 공백 안돼요
	var subtitle = $("#_subtitle").val().trim();
	$("#_subtitle").val(subtitle);
	if(subtitle=="" || subtitle.length==0) {
		alert("단위수량을 입력하세요");
		return false;
	}
	
	//내용 공백 안돼요
	var content = $("#_content").val();
	if(content=="" || content.length==0) {
		alert("내용을 입력하세요");
		return false;
	}
	
	//썸네일 등록 확인
	var thumb = document.getElementsByName("filethumbnail");
	if(thumb[0].files.length==0) {
		alert("썸네일을 등록해야 합니다");
		return false;
	}
	
	//수량 등록 및 숫자만 썼는지 확인
	var regPcount = /^[0-9]/g;
	//if( !regPcount.test($("#_pcount").val()) ) {
	if( !$.isNumeric( $("#_pcount").val().trim() ) ) {
		alert("수량을 확인하세요");
		return false;
	}
	
	//원산지 체크
	//alert($("#_place1").val());
	var places = $("#_place2").val().trim();
	$("#_place2").val(places);
	if(places=="" || places.length==0) {
		alert("지역을 입력하세요");
		return false;
	}
	$("#_place").val( $("#_place1").val() + " " + $("#_place2").val() );
	
	//다중파일 개수 확인 (10개까지만 허용)
	var obj = document.getElementsByName("fileload");
	var flength = 0;
	for(var i=0; i<obj.length; i++) {
		flength += obj[i].files.length;
	}
	if(flength>10) {
		alert("파일은 10개까지만 첨부할 수 있습니다.");
		return false;
	}
	
	//가격 등록 및 숫자만 썼는지 확인
	var regPrice = /^[0-9]/g;
	//if( !regPrice.test($("#_price").val()) ) {
	if( !$.isNumeric( $("#_price").val().trim() ) ) {
		alert("가격을 확인하세요");
		return false;
	}
	
	//폼전송 해야한다.
	$("#_frmWrite").submit();
}

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
























