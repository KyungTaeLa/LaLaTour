<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath() %>/resources/css/reserveList.css">
<style type="text/css"></style>


</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<div class="main_container_re">
<p id="top_info">예약 목록</p>
<hr style="border:1px solid gray">
   <div class="main_container">
      <div class="tb_section">
         <table class="main_table">
         <colgroup>
         <col width="370px"><col width="160px"><col width="150px"><col width="130px">
         <col width="150px"><col width="90px"><col width="180px">
         </colgroup>
         <thead>
            <tr>   
               <th>호텔</th><th>주문번호</th><th>호텔명</th>
               <th>예약일</th><th>결제금액</th><th>결제일</th><th style="border-right:0px;">상태</th>
            </tr>
         </thead>
         <tbody>
         <c:if test="${empty reserve }">
         <tr>
            <td colspan="8">
               <b>예약 내역이 없습니다.</b>
            </td>
         </tr>
         </c:if>
         <c:forEach items="${reserve }" var="re" varStatus="vs">
            <tr>
               <td>
                  <img alt="이미지없음" src="<%=request.getContextPath() %>/upload/${re.thumbnail}" style="width:355px;height: 255px">
               </td>
               <td>${re.merchant }</td>
               <td>
                  <a href="hoteldetail.do?seq=${re.pseq}">${re.title }</a>
               </td>
               <td>${re.sdate } <br>~<br> ${re.edate }</td>
               <td>${re.re_price }</td>
               <td>${re.wdate }</td>
               <td style="border-right:0px;">
                  <c:if test="${re.del eq '0' }">
                     <button type="button" class='snip1535' title="예약취소" onclick="reqCancel('${re.seq}','${re.id }')">예약취소</button>
                  </c:if>
                  <c:if test="${re.del eq '1' }">
                     <span style="color:red">예약 취소 </span><br><br> <b>승인</b>
                  </c:if>
                  <c:if test="${re.del eq '2' }">
                     <span style="color:red">예약 취소 </span><br><br> <b>승인 대기중</b>
                  </c:if>
               </td>
            </tr>
            <script>
            </script>
         </c:forEach>
         </tbody>
         </table>
      </div><!-- tb_section 끝 -->
<jsp:include page="paging.jsp">
   <jsp:param name="actionPath" value="hoteldetail.do" />
   <jsp:param name="nowPage" value="${paging.nowPage }" />
   <jsp:param name="totalCount" value="${paging.totalCount }" />
   <jsp:param name="countPerPage" value="${paging.countPerPage }" />
   <jsp:param name="blockCount" value="${paging.blockCount }" />

   <jsp:param name="id" value="${login.id }" />
</jsp:include>

   </div> <!-- main_container 끝 -->
   </div>
</div><!-- wrapper 끝 -->
<script type="text/javascript">
function reqCancel(seq,id){
   if(confirm("정말 예약을 취소하시겠습니까?")){
      location.href='myCancelReserve.do?seq='+seq+'&id='+id;
   }
}
/* 숫자에 콤마붙여주기 */
function addComma(num) {
     var regexp = /\B(?=(\d{3})+(?!\d))/g;
     return num.toString().replace(regexp, ',');
   }
</script>
</body>
</html>