<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/product.css">

<script type="text/javascript" src="//cdn.poesis.kr/post/popup.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>

.join_smBtn {
	width: 100px;
	height: 34px;
	background-color: #514c4c;
	color: white;
	font-size: 17px;
	border: none;
	vertical-align: middle;
}
.join_smBtn:hover {
	background-color: black;
}

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
}
.inputtext {
	border: 1px solid #7a7676;
	width: 170px;
	height: 30px;
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
	width: 100px;
	background-color: #2b9cf2;
	padding: 10px 20px;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	font-size: 15px;
	display: inline-block;
	cursor: pointer;
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

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
    
<h1>결제하기</h1>


<!-- 상단 주문내역 리스트 /////////////////////////////////////////////// -->
<div id="div_payment_top" style="width: 1250px; display: inline-block;">
<form method="post" id="_finalForm">
<input type="hidden" name="inseq" id="_inomid" value="">
<input type="hidden" name="merchant_uid" id="_merchant_uid" value="">

<!-- basic 붙어있었음 -->
<table class="colline padding10">
<colgroup>
	<col width="150px"><col width="700px">
	<col width="200px"><col width="200px">
</colgroup>

<thead>
<tr>
	<th>상품</th>
	<th>상품명</th>
	<th>수량</th>
	<th>금액</th>
</tr>
</thead>

<tbody>
<c:forEach items="${olist}" var="item">
<tr>
	<td> <!-- 상품 -->
		<img src="<%=request.getContextPath()%>/upload/${item.thumbNail}" style="width: 130px; height: 130px;">
	</td>
	<td> <!-- 상품명 -->
		<a href="productdetail.do?product_seq=${item.pseq}"><font style="font-size: 20px;">${item.title}</font></a>
		<input type="hidden" name="seq" value="${item.cart_seq}">
	</td>
	<td> <!-- 수량 -->
		<%-- <input type="text" id="_myCount" name="myCount" price="${item.price}" value="${item.myCount}" readonly="readonly" 
			style="width:20px; font-size: 25px; border: none; padding: 0px; background-color: gray;">
		<input type="text" style="border: none;" value="개" readonly="readonly"> --%>
		<input type="hidden" id="_myCount" name="myCount" price="${item.price}" value="${item.myCount}" readonly="readonly" 
			style="width:20px; font-size: 25px; border: none; padding: 0px; background-color: gray;">
		<span style="font-size: 25px; font-weight: 400;">${item.myCount}</span>
		<span style="color: #514c4c">개</span>
	</td>
	<td> <!-- 금액 -->
		<span class="total">
			<c:set var="tprice" value="${item.myCount * item.price}"/>
			<span style="font-size: 25px; font-weight: 400;">${tprice}</span>
			<span style="color: #514c4c">원</span>
		</span>
	</td>
</tr>
</c:forEach>
<tr>
	<td colspan="5" style="text-align: right;">
		결제금액: 
		<input type="text" id="_otprice" name="otprice" style="border: none; width: 100px; 
			text-align: right; font-size: 30px; font-weight: 400; color: #f74242;">원
		<button type="button" id="_finalBtn" class="bigbtnred" onclick="pay2()" style="margin-left: 20px;">결제하기</button>
	</td>
</tr>
</tbody>
</table>
</form> <!-- end _finalForm -->
</div> <!-- div_payment_top -->
<br><br>


<!-- 주문자 정보 받는 div /////////////////////////////////////////////// -->
<div id="div_payment_middle" style="width: 1250px; display: inline-block; padding-top: 30px;">
<h2>수신인 정보 입력</h2>
<div style="width: 1250px; padding-bottom: 10px; display: inline-block;">
	<input type="radio" name="customer" value="0" checked="checked">주문자와 동일&nbsp;&nbsp;&nbsp;
	<input type="radio" name="customer" value="1">수취인 정보 입력
</div>

<div class="customer" style="width: 1250px;">
<div id="customer1">
<form method="post" name="frmCustomer1" id="_frmCustomer1">

<!-- basic 붙어있었음 -->
<table class="colline padding10">
<colgroup>
	<col width="250px"><col width="1000px">
</colgroup>

<tbody>
<tr>
	<th>주문자</th>
	<td>
		${login.id}
		<input type="hidden" name="oid1" id="oid1" value="${login.id}">
	</td>
</tr>
<tr>
	<th>받는 분 이름</th>
	<td>
		${login.name}
		<input type="hidden" name="oname1" id="oname1" value="${login.name}">
	</td>
</tr>
<tr>
	<th>받는 분 전화번호</th>
	<td>
		${login.phone}
		<input type="hidden" name="ophone1" id="ophone1" value="${login.phone}">
	</td>
</tr>
<tr>
	<th>받는 분 주소</th>
	<td>
		${login.address}
		<input type="hidden" name="oaddress1" id="oaddress1" value="${login.address}">
	</td>
</tr>
<tr>
	<th>받는 분 이메일</th>
	<td>
		${login.email}
		<input type="hidden" name="oemail1" id="oemail1" value="${login.email}">
	</td>
</tr>
</tbody>
</table>
</form>
</div> <!-- end customer1 -->

<div id="customer2" style="display: none;">
<form method="post" name="frmCustomer2" id="_frmCustomer2">
<table class="basic colline padding10">
<colgroup>
	<col width="250px"><col width="1000px">
</colgroup>

<tbody>
<tr>
	<th>주문자</th>
	<td>
		${login.id}
		<input type="hidden" name="oid2" id="oid2" value="${login.id}">
	</td>
</tr>
<tr>
	<th>받는 분 이름</th>
	<td>
		<input type="text" name="oname2" id="oname2" class="inputtext" >
	</td>
</tr>
<tr>
	<th>받는 분 전화번호</th>
	<td>
		<select id="phone1" class="inputtext" style="height: 30px;">
			<option value="010" class="inputtext" selected="selected">010</option>
		   	<option value="011" class="inputtext">011</option>
		</select> -
		<input type="text" id="phone2" class="inputtext" size="10"> -
		<input type="text" id="phone3" class="inputtext" size="10">
		<input type="hidden" name="ophone2" id="ophone2" size="20" value="">
   </td>
</tr>
<tr>
	<th>받는 분 주소</th>
	<td>
		<div>
		    <p style="margin-bottom: 10px;">
		        <label>우편번호&nbsp;</label><input type="text" size="4" class="postcodify_postcode6_1 inputtext" id="post1" readonly="readonly" /> &ndash;
		        <label></label><input type="text" size="4" class="postcodify_postcode6_2 inputtext" id="post2" readonly="readonly" /> &nbsp;
		        <input type="button" value="검색" id="postcodify_search_button" class="join_smBtn">
		    </p>
		    <p style="margin-bottom: 10px;"><label style="padding-left:30px">주소&nbsp;</label><input type="text" class="postcodify_address inputtext" id="address1" readonly="readonly" style="width:450px;"/></p>
		    <p><label>상세주소&nbsp;</label><input type="text" class="postcodify_details inputtext" id="address2" style="width:450px;"></p>
		</div>
		<input type="hidden" name="oaddress2" id="oaddress2" size="20" value="">
   </td>
</tr>
</tbody>
</table>
</form>
</div> <!-- end customer2 -->
</div> <!-- end customer -->

</div> <!-- end div_payment_middle -->

<form id="_frmFinal" method="post">
	<input type="hidden" name="oid" id="oid">
	<input type="hidden" name="oname" id="oname">
	<input type="hidden" name="ophone" id="ophone">
	<input type="hidden" name="oaddress" id="oaddress">
	<input type="hidden" name="otprice" id="otprice">
	<input type="hidden" name="omid" id="omid">
	<input type="hidden" name="oemail" id="oemail" value="${login.email }">
</form>

</div> <!-- end inner -->
</div> <!-- end outer -->

<script>
$(document).on("change", "input[name=customer]", function() {
	if($(this).val()==0) {
		$("#customer2").hide();
		$("#customer1").show();
	}
	else {
		$("#customer1").hide();
		$("#customer2").show();
	}
});

//$("#search_button").postcodifyPopUp();

var idck = false;
var wid = "";

$(document).ready(function() {
   $("#postcodify_search_button").postcodifyPopUp();
   
   	//var obj = $("#_myCount");
	var money = 0;
	var obj = document.getElementsByName("myCount");

	for(var i=0; i<obj.length; i++) {
		money += Number(obj[i].getAttribute("price")) * Number(obj[i].value);
	}
	
	$("#_otprice").val( money );
});

function check() {
	
   if($("#oname2").val().trim()=="") {
      alert("이름을 입력해야 합니다.");
      $("#oname2").focus();
      return false;
   }
   if($("#phone2").val().trim()=="" || $("#phone3").val().trim()=="") {
      alert("연락처를 입력해야 합니다.");
      return false;
   }
   if($("#address1").val().trim()=="" || $("#address2").val().trim()=="") {
      alert("주소를 입력해야 합니다.");
      return false;
   }
   
   $("#ophone2").val( $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val() );
   var adrs = "["+$("#post1").val()+"-"+$("#post2").val()+"] " + $("#address1").val() + " " + $("#address2").val();
   $("#oaddress2").val(adrs);
   
   if(valcName()==false || valcPhone()==false) {
      return false;
   }
   return true;
}

function valcPhone() {
   var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
   if( regPhone.test($("#ophone2").val())==false ) {
      alert("잘못된 연락처입니다");
      return false;
   }
   return true;
}

function valcName() {
   var regSpace = /\s/g;
   if( regSpace.test($("#oname2").val().trim())==true ) {
      alert("이름에 공백이 있습니다");
      return false;
   }
   return true;
}



//////////////////////////////////
function pay() {
	var frms;
	
	var checkedValue = Number($("input[name=customer]:checked").val());
	
	if( checkedValue==0 ) {
		$("#oid").val( $("#oid1").val() );
		$("#oname").val( $("#oname1").val() );
		$("#ophone").val( $("#ophone1").val() );
		$("#oaddress").val( $("#oaddress1").val() );
		//frms = $("#_frmFinal").serialize();
	}
	else {
		if(check()==false) {
			alert("다시 확인하세요");
			return;
		}
		$("#oid").val( $("#oid2").val() );
		$("#oname").val( $("#oname2").val() );
		$("#ophone").val( $("#ophone2").val() );
		$("#oaddress").val( $("#oaddress2").val() );
	}
	$("#otprice").val( $("#_otprice").val() );
	frms = $("#_frmFinal").serialize();
	
	/////////////////////////////////////////////////////////////

   	jQuery.ajax({
   		type: "POST",
   		url: "orderedinsert.do",
   		data: frms,
   		
   		//url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
   		//type: 'POST',
   		//dataType: 'json',
   		/* data: {
    		imp_uid : rsp.imp_uid
    		//기타 필요한 데이터가 있으면 추가 전달
   		} */
   		success: function( seq ) {
   			//alert("success");
   			
   			$("#_inseq").val(seq);
   			
   			//$("#_merchant_uid").val( merchant_uid );
   			$("#_finalForm").attr("action", "changecart.do").submit();
   		},
   		error: function(x, s, e) {
   			alert("error");
   		}
   	}).done(function(data) {
   		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
   		if ( everythings_fine ) {
   			var msg = '결제가 완료되었습니다.';
   			msg += '\n고유ID : ' + rsp.imp_uid;
   			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
   			msg += '\결제 금액 : ' + rsp.paid_amount;
   			msg += '카드 승인번호 : ' + rsp.apply_num;

   			//alert(msg);
   		} else {
   			//[3] 아직 제대로 결제가 되지 않았습니다.
   			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
   		}
   	});
}















//////////////////////////////////
function pay2() {
	//alert( $("#oemail").val() );
	var frms;
	
	var checkedValue = Number($("input[name=customer]:checked").val());
	
	if( checkedValue==0 ) {
		$("#oid").val( $("#oid1").val() );
		$("#oname").val( $("#oname1").val() );
		$("#ophone").val( $("#ophone1").val() );
		$("#oaddress").val( $("#oaddress1").val() );
		//frms = $("#_frmFinal").serialize();
	}
	else {
		if(check()==false) {
			alert("다시 확인하세요");
			return;
		}
		$("#oid").val( $("#oid2").val() );
		$("#oname").val( $("#oname2").val() );
		$("#ophone").val( $("#ophone2").val() );
		$("#oaddress").val( $("#oaddress2").val() );
	}
	$("#otprice").val( $("#_otprice").val() );
	frms = $("#_frmFinal").serialize();
	
	/////////////////////////////////////////////////////////////
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp92805508'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    //pay_method : 'trans',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : Number($("#_otprice").val()),
	    buyer_name : "'" + $("#oname").val() + "'",
	    buyer_tel : "'" + $("#ophone").val() + "'",
	    buyer_addr : "'" + $("#oaddress").val() + "'",
	    buyer_email : '${login.email}'
	    //buyer_postcode : '123-456'//,
	    //m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	$("#omid").val( rsp.merchant_uid );
	    	frms = $("#_frmFinal").serialize();
	    	
	    	var msg = '결제가 완료되었습니다.';
			msg += '\n고유ID : ' + rsp.imp_uid;
			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			msg += '\결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;

			
	    	
	    	jQuery.ajax({
	    		type: "POST",
	    		url: "orderedinsert.do",
	    		//data: frms,
	    		data: frms,
	    		
	    		//url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
	    		//type: 'POST',
	    		//dataType: 'json',
	    		/* data: {
		    		imp_uid : rsp.imp_uid
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		} */
	    		success: function( omid ) {
	    			//alert("success");
	    		//	alert("ajax send seq: " + omid);
	       			$("#_inomid").val(omid);
	       			
	       			//$("#_merchant_uid").val( merchant_uid );
	       			$("#_finalForm").attr("action", "changecart.do").submit();
	    		},
	    		error: function(x, s, e) {
	    			alert("error");
	    		}
	    	});/* .done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;

	    			alert(msg);
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	}); */
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;

	        alert(msg);
	    }
	});
}

function paytest() {
	//alert("결제가 완료되었습니다.");
	
	var frms;
	
	var checkedValue = Number($("input[name=customer]:checked").val());
	
	if( checkedValue==0 ) {
		$("#oid").val( $("#oid1").val() );
		$("#oname").val( $("#oname1").val() );
		$("#ophone").val( $("#ophone1").val() );
		$("#oaddress").val( $("#oaddress1").val() );
		//frms = $("#_frmFinal").serialize();
	}
	else {
		if(check()==false) {
			alert("다시 확인하세요");
			return;
		}
		$("#oid").val( $("#oid2").val() );
		$("#oname").val( $("#oname2").val() );
		$("#ophone").val( $("#ophone2").val() );
		$("#oaddress").val( $("#oaddress2").val() );
	}
	$("#otprice").val( $("#_otprice").val() );
	frms = $("#_frmFinal").serialize();
	
	$.ajax({
		type: "POST",
		url: "orderedinsert.do",
		data: frms,
		
		success: function( seq ) {
			//alert("success");
			
			$("#_inseq").val(seq);
			
			$("#_finalForm").attr("action", "changecart.do").submit();
		},
		error: function(x, s, e) {
			alert("error");
		}
	});
	
	//location.href="orderedok.do";
}


</script>






















