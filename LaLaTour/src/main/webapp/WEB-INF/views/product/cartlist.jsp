<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/product.css">

<style>

th {
	font-size: 20px;
	color: #514c4c;
}
table {
	border: 0px;
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
#top_info{
    padding-left: 20px;
    font-weight: bold;
    font-size: 30px !important;
}
</style> 

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 상단이미지 -->
    
<div id="div_detail_top" style="width: 1250px; display: inline-block;margin:50px">
<p id="top_info">장바구니</p>


<div id="totalDiv">

<div id="topDiv" style="width: 1500px;">
<form method="post" id="_orderForm">

<div id="hcount">
</div>

<!-- basic 붙어있었음 -->
<table class="colline padding10">
<colgroup>
	<col width="100px"><col width="150px"><col width="550px">
	<col width="200px"><col width="200px">
</colgroup>

<thead>
<tr>
	<th style="text-align: center;"><input class="inputckbox" type="checkbox" name="allChk" id="_allChk"></th>
	<th>상품</th>
	<th>상품명</th>
	<th>수량</th>
	<th><button type="button" id="_checkDels" class="cartlist_alldelBtn">선택항목 삭제</button></th>
</tr>
</thead>

<tbody>
<c:if test="${clist.size() eq '0' or empty clist}">
	<tr>
		<td colspan="5">장바구니에 제품이 없습니다.</td>
	</tr>
</c:if>

<c:if test="${clist.size() > '0'}">
<c:forEach items="${clist}" var="item">
<tr>
	<td align="center"><input class="inputckbox" type="checkbox" name="chk_order" value="${item.cart_seq}"></td>
	<td><img src="<%=request.getContextPath()%>/upload/${item.thumbNail}" style="width: 130px; height: 130px;"></td>
	<td>
		<a href="productdetail.do?product_seq=${item.pseq}">
			<font class="font20">${item.title}</font>
		</a>
	</td>
	<td>
		<span class="total" style="font-size: 30px; font-weight: 500;">
			<c:set var="tprice" value="${item.myCount * item.price}"/>
			${tprice}
		</span>원<br>
		<span>
			<button type="button" class="smallbtn" id="mBtn" style="float: left; back">-</button>
			<input type="text" id="_myCount" name="myCount" price="${item.price}" value="${item.myCount}" readonly="readonly" class="inputMyCount" style="height: 40px;">
			<button type="button" class="smallbtn" id="pBtn" pcount="${item.pcount}" style="float: left;">+</button>
		</span>
	</td>
	<td><button type="button" class="cartlist_cartdelBtn" onclick="location.href='cartDelete.do?cart_seq=${item.cart_seq}'">제품삭제</button></td>
</tr>
</c:forEach>
<tr>
	<td colspan="5" style="text-align: right;">
		결제예정금액: 
		<span id="_totalprice" style="font-size: 30px; font-weight: 400; color: #f74242;">0</span>원
		<button type="button" id="_orderBtn" class="bigbtnred" style="margin-left: 30px;">주문하기</button>
	</td>
</tr>
</c:if>
</tbody>

</table>
</form>
</div> <!-- end topDiv -->



</div> <!-- end totalDiv -->
</div> <!-- end div_detail_top -->


<script>
function chk(obj){
	var totalPrice = obj.getAttribute("data-xea");
	alert(totalPrice);
	var nowPrice = $("#_totalprice").text();
	alert(nowPrice);
	
	totalPrice = Number(totalPrice);
	nowPrice = Number(nowPrice);
	
	var qq = totalPrice + nowPrice;
	$("#_totalprice").empty();
	$("#_totalprice").append(qq);
} 

//결제하기 했을 때 선택되어 있는지 검사하고 서브밋
$(document).on("click", "#_orderBtn", function() {
	if( $("input:checkbox[name=chk_order]:checked").length==0 ) {
		alert("구매할 제품을 선택해 주세요");
		return;
	}
	else {
		$("#_orderForm").attr("action", "orderedlist.do").submit();
	}
});

$(document).on("click", "#mBtn", function() {
	var obj = $(this).parent().children("input");
	
	var val = Number( obj.val() );
	
	if(val>1) {
		val = val-1;
	}
	
	obj.val( val );
	showTotal(obj);
});

$(document).on("click", "#pBtn", function() {
	var pcount = Number( $(this).attr("pcount") );
	
	var obj = $(this).parent().children("input");

	var val = Number( obj.val() );
	
	if(val==pcount) {
		alert("현재 재고를 초과할 수 없습니다");
		return;
	}
	else if(val==10) {
		alert("최대 주문수량은 10입니다");
		return;
	}
	else {
		val = val+1;
	}
	
	obj.val( val );
	showTotal(obj);
});

function showTotal(obj) {
	var total = Number(obj.attr("price")) * Number(obj.val());

	obj.parent().parent().children("span.total").empty();
	obj.parent().parent().children("span.total").append( (total) );
	
	tpCal();
}

function tpCal() {
	//var obj_cb = document.getElementsByName("chk_order");
	var obj_cb = $("input[name=chk_order]");
	
	var totalPrice = 0;
	var tags = "";
	
	//alert(obj_cb[0].parentNode.parentNode.childNodes[7].childNodes[4].childNodes[3].childNodes.length);
	//alert("1111");
	for(var i=0; i<obj_cb.length; i++) {
		//var oobj = obj_cb[i];
		//alert(obj_cb[i].parentNode.parentNode.childNodes[0].nodeName);
		
		/* for(var j=0; j<obj_cb[i].parentNode.parentNode.childNodes[7].childNodes[5].childNodes.length; j++) {
			alert(obj_cb[i].parentNode.parentNode.childNodes[7].childNodes[5].childNodes[j]);
		} */
		//alert(obj_cb[i].parentNode.parentNode.childNodes[i].childNodes.length);
		if(obj_cb[i].checked==true) {
			var oobj = obj_cb[i].parentNode.parentNode.childNodes[7].childNodes[5].childNodes[3];
			
			var price = Number(oobj.getAttribute("price"));
			var pcount = Number(oobj.value);
			
			//alert(oobj);
			
			totalPrice += price * pcount;
			
			tags += "<input type='hidden' name='hcount' value='" + pcount + "'>";
		}
		//alert(obj_cb[i].parentNode.parentNode.childNodes[7].childNodes[4].childNodes[3].childNodes);
		//alert(i);
		//alert(obj_cb.parent().children("input[name=myCount]").val());
		//alert(obj_cb[i].val());
		//alert(obj_cb[i].parentNode.parentNode.childNodes.length);
		//alert(obj_cb[i].parentNode.parentNode.childNodes[7].childNodes.length);
		//alert(obj_cb[i].parentNode.parentNode.childNodes[7].childNodes[4].childNodes.length);
		//alert(obj_cb[i].parentNode.parentNode.childNodes[7].childNodes[4].childNodes[3].childNodes);
		
		//alert("value: " + oobj.value);
		//alert("price: " + oobj.getAttribute("price"));
		
		
		//for(var j=0; j<obj_cb[i].parentNode.parentNode.length; j++) {
			//alert(obj_cb[i].parentNode.parentNode.childNodes[7].childNodes[4].childNodes[j].nodeName);
			//alert(obj_cb[i].parentNode.parentNode.childNodes[j].nodeName);
		//}
	}
	
	$("#_totalprice").empty();
	$("#_totalprice").append( totalPrice );
	
	
	$("#hcount").empty();
	$("#hcount").append(tags);
	//calTotalPrice(obj_cb);
}

$(document).on("change", "input[name=chk_order]", function() {
	$("#_allChk").prop("checked", false);
	tpCal();
	//var obj_cb = document.getElementsByName("chk_order");
	/* var obj_cb = $("input[name=chk_order]");
	
	var totalPrice = 0;
	
	for(var i=0; i<obj_cb.length; i++) {
		if(obj_cb[i].checked==true) {
			var oobj = obj_cb[i].parentNode.parentNode.childNodes[7].childNodes[4].childNodes[3];
			
			var price = Number(oobj.getAttribute("price"));
			var pcount = Number(oobj.value);
			
			totalPrice += price * pcount;
		}
		//alert(i);
		//alert(obj_cb.parent().children("input[name=myCount]").val());
		//alert(obj_cb[i].val());
		//alert(obj_cb[i].parentNode.parentNode.childNodes.length);
		//alert(obj_cb[i].parentNode.parentNode.childNodes[7].childNodes.length);
		//alert(obj_cb[i].parentNode.parentNode.childNodes[7].childNodes[4].childNodes.length);
		//alert(obj_cb[i].parentNode.parentNode.childNodes[7].childNodes[4].childNodes[3].childNodes);
		
		//alert("value: " + oobj.value);
		//alert("price: " + oobj.getAttribute("price"));
	}
	
	$("#_totalprice").empty();
	$("#_totalprice").append( totalPrice );
	 */
	//calTotalPrice(obj_cb);
});

//전체선택 체크박스 변동시,
$(document).on("change", "#_allChk", function() {
	//체크가 됐으면,
	if( $("#_allChk").is(":checked") ) {
		$("input:checkbox[name=chk_order]").prop("checked", true);
	}
	//체크가 해제됐으면,
	else {
		$("input:checkbox[name=chk_order]").prop("checked", false);
	}
	tpCal();
});

//선택항목 삭제 버튼 클릭시
$(document).on("click", "#_checkDels", function() {
	if( $("input:checkbox[name=chk_order]:checked").length==0 ) {
		alert("선택된 항목이 없습니다");
		return;
	}
	$("#_orderForm").attr("action", "deleteCart.do").submit();
});




</script>
