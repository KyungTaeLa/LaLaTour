<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/reserveList.css?after">
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<c:if test="${empty login or login.auth ne '1'  }">
	<script type="text/javascript">
		alert("접근 권한이 없는 페이지입니다.");
		location.href="hotellist.do";
	</script>
</c:if>
<div class="wrapper" style="margin: 50px 0px 0px 50px;">
	<div class="main_container">
		<div class="tb_section">
			<table class="main_table">
			<thead>
			<tr class="top_tr">
				<th>No</th><th>고객명</th><th>호텔명</th>
				<th>숙박일</th><th>결제금액</th><th>결제일</th><th>sumbit</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${reserve }" var="res" varStatus="vs">
				<tr>
					<td style="border-left:1px solid #eeeeee">${vs.count }</td>
					<td>${res.id }</td>
					<td>${res.title }</td>
					<td>${res.sdate } ~ ${res.edate }</td>
					<td>${res.re_price }</td>
					<td>${res.wdate }</td>
					<td>
						<button class="snip1535" onclick="cancelReserve('${res.seq}')">취소 승인</button>
					</td>
				</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
		
		<jsp:include page="paging.jsp">
			<jsp:param name="actionPath" value="hoteldetail.do" />
			<jsp:param name="nowPage" value="${paging.nowPage }" />
			<jsp:param name="totalCount" value="${paging.totalCount }" />
			<jsp:param name="countPerPage" value="${paging.countPerPage }" />
			<jsp:param name="blockCount" value="${paging.blockCount }" />
		
			<jsp:param name="id" value="${login.id }" />
		</jsp:include>
		<form action="respCancelReserve.do" method="post" id="cancelFrm">	
			<input type="hidden" name="seq" value="" id="_seq">
		</form>
	</div><!-- main_container 끝 -->
</div><!-- wrapper 끝 todo -->
<script type="text/javascript">
function cancelReserve( seq ) {
	$("#cancelFrm #_seq").val(seq);
	
	if(confirm("정말 승인하시겠습니까?")){
		$("#cancelFrm").submit();
	}
}
</script>
</body>
</html>