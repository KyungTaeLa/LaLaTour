<%@page import="lala.com.a.util.pagingBean"%>
<%@page import="lala.com.a.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

a{
	text-decoration: none;
	color: black;
}
body{
font-family: 'Nanum Gothic', sans-serif;
   font-size: 19px;
  /*  background-color:  #fbfbfb; */
  background-color: white;
   
}
.divList{
   padding-top: 100px;
   width: 1250px;
   margin: auto;
}
table{
	width: 800px;
	vertical-align: middle;
	 text-align: left; 
	 padding-top: 55px;
	 border: none; 
	 margin: auto;
}

 input,textarea{
font-family: 'Nanum Gothic', sans-serif;
font-size: 19px;
resize: none;
   
} 
#divSub{
   padding-top:40px;
   padding-bottom: 20px;
   border-bottom: 3px black solid;
}
a{
   text-decoration: none;
   color: black;
}
.divAll{
   width: 1250px;
   margin: auto;
}
#divBack{
   padding-top:10px;
   padding-bottom: 150px;
   margin: auto;
   background-color:  #fbfbfb;
  
}
.divList td{
	height: 60px;
	padding: 14px;
	margin: 200px;
	 border-bottom: 1px gray dotted;
}

.main_title{
	padding-top: 20px;
	padding-bottom:0;
	padding-left:30px;
	margin-bottom: 0;
}
.reple_div {
   /* height: 60px; */
   font-size: 15px;
   margin: auto;
    padding-right: 68px; 
    padding-left: 25px;
}
.answerDiv{

padding: 50px;
font-size: 19px;
margin:auto;
/* background-color:#F0F4FA; */
background-color:  #fbfbfb;
margin-bottom: 130px;
} 
.answerDiv textarea{
   
   border-radius: 20px;
   outline: none;
   border: 2px solid #5D8CAE !important;
   resize: none;
   padding-left: 20px;
   padding-top: 20px;
}
.answerDiv td{
   margin: 20px 0px 0px 20px;  
   height: 40px;
   vertical-align: center;
   padding-bottom: 5px;
   
}
.answerDiv td,tr{

border-bottom: 1px black dotted;

}
.del_up_Area textarea {
   
   text-align: center; 
   vertical-align:bottom; 
   border: 2px solid #5D8CAE !important; 
   color: #000062;
   
    padding-top: 47px;
    padding-bottom: 13px;
   height: 64px; 
   font-size: 20px;
   
}
.middleImg{ 
margin-top:60px;
	background-image: url("<%=request.getContextPath() %>/resources/images/backTest.jpg");
	background-repeat: no-repeat;
 	background-size: 100% 230px; 
	height: 230px;
	opacity: 0.9; 
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
<%
//사용자 세션
Object ologin = session.getAttribute("login");
MemberDto member = null;
if(ologin != null) {
	  member = (MemberDto)ologin;
	  pageContext.setAttribute("memberid", member.getId());
}



pagingBean paging = (pagingBean)request.getAttribute("paging");

%>
<meta charset="UTF-8">
</head>
<body>

<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
<div class="middleImg">
<h1 class="middleTitle">커뮤니티</h1>
</div>
</div>

<div class="divAll">

<div class="main_title">
<h1>자유 게시판</h1>
</div>

<div id="divSub"  style="text-align: right; width: 100%">
<a href="bbsList.do"><b>자유게시판</b></a>&nbsp;&nbsp;|&nbsp;
<a href="meeting.do">참여게시판</a>
</div>


<div align="center" class="divList">
<form action="bbsUpdate.do">
<div id="divBack">
<table>
<col width="35%"><col width="65%">
<tr>
	<td>조회수</td>
	<td>${bbs.readcount }
	<input type="hidden" readonly="readonly" value="${bbs.readcount }" name="readcount">
	</td>
</tr>

<tr>
	<td>작성일</td>
	<td>20${fn:substring(bbs.wdate,0,2) }-${fn:substring(bbs.wdate,3,5) }-${fn:substring(bbs.wdate,6,8) }</td>
</tr>


<tr>
	<td>작성자</td>
	<td>
	${bbs.id }
		<input type="hidden" readonly="readonly" value="${bbs.id }" name="id">
	</td>
</tr>

<tr>
	<td>제목</td>
	<td>
	${bbs.title }
	<input type="hidden" readonly="readonly" value="${bbs.title }" name="title">
	</td>
</tr>

<tr>
	<td  style="height: 300px;">내용</td>
	<td>
	<textarea rows="20" cols="65" style="border: none;background-color:#fbfbfb;" readonly="readonly">${bbs.content }</textarea>
	<input type="hidden" readonly="readonly" value="${bbs.content }" name="content">
	</td>
</tr>


</table>
<c:if test="${memberid eq bbs.id }">
<br>
<table style="margin-left: 200px; padding-left: 150px;">
<col width="30%">
<tr>
<td style="border: none; padding-left: 180px;">
<input type="hidden" name="seq" value="${bbs.seq }">

<!-- 수정버튼 -->
<input type="image" value="수정" src="<%=request.getContextPath() %>/resources/images/meetUp.png">
</td>
</form>

<td style="border: none; padding-left: 10px">
<form action="bbsDelete.do">
<input type="hidden" value="${bbs.seq }" name="seq">
<!-- 삭제버튼 -->
<input type="image" value="삭제" src="<%=request.getContextPath() %>/resources/images/meetDel.png">
</c:if>
</form>
</td>
</tr>
</table>

</div>

</div>

<hr style="margin: 0;">
<div  class="answerDiv">
<table style="padding-left: 40px;">
<c:if test="${reply.size()>0 }">
<c:forEach items="${reply }" var="rlist">

<c:if test="${rlist.id ne memberid && rlist.lock_ == 1 }">
<tr>
	<!-- 비밀댓글 -->
	<td colspan="4" class="del_up_Area" style="padding-top: 20px; padding-bottom: 20px;">
	<c:if test="${rlist.step>0 }">
	<img alt="" src="<%=request.getContextPath() %>/resources/images/arrow.png" style="vertical-align: top; width: 21px;">
      <b><textarea rows="4" cols="64" readonly="readonly" style="color: black">비밀 댓글입니다.</textarea></b>
     </c:if> 
	 <c:if test="${rlist.step == 0 }">
      <b><textarea rows="4" cols="67" readonly="readonly" style="color: black">비밀 댓글입니다.</textarea></b>
     </c:if> 
	
	</td>
</tr>
</c:if>	
<c:if test="${rlist.del == 1 }">
<tr>	

	<!-- 삭제된댓글 -->
	<td colspan="4" class="del_up_Area" style="padding-top: 20px; padding-bottom: 20px;">
	<c:if test="${rlist.step>0 }">
	<img alt="" src="<%=request.getContextPath() %>/resources/images/arrow.png" style="vertical-align: top; width: 21px;">
      <b><textarea rows="4" cols="64" readonly="readonly">삭제된 댓글입니다.</textarea></b>
     </c:if> 
     <c:if test="${rlist.step == 0 }">
      <b><textarea rows="4" cols="67" readonly="readonly">삭제된 댓글입니다.</textarea></b>
     </c:if> 
	</td>
</tr>
</c:if>	
<c:if test="${(rlist.del != 1 && rlist.lock_ == 0) || (rlist.del != 1 && rlist.id eq memberid && rlist.lock_ == 1) }">
<form action="updateReply.do" method="post">
<tr>
	<td style="border-bottom: none; padding-bottom: 0px;padding-left: 20px; padding-top: 5px;">
	<c:if test="${rlist.step > 0 }">
	<img alt="" src="<%=request.getContextPath() %>/resources/images/arrow.png" style="vertical-align: top; width: 20px;">
	</c:if>
	${rlist.id }
	<font style="font-size: 13px;">${fn:substring(rlist.wdate,0,16) }</font>
	<c:if test="${rlist.del == 2 }">
	<font style="font-size: 14px;">
	(수정됨)
	</font>
	</c:if>
	<input type="hidden" readonly="readonly" value="${rlist.id }" size="5">
	<c:if test="${memberid == rlist.id }">
	<a onclick="writeAnswer(${rlist.seq})" style="  padding-right: 30px; float: right;">
	</c:if>
	<c:if test="${memberid != rlist.id }">
	<a onclick="writeAnswer(${rlist.seq})" style="  padding-right: 130px; float: right;">
	</c:if>
	<c:if test="${rlist.step == 0}">
	<font style="font-size: 16px; cursor: pointer;">답글달기</font>
	</c:if>
	</a>
	</td>
	</tr>
	<tr>
	<td style="padding-top: 0px;">
		<textarea rows="4" cols="67" readonly="readonly" name="content" class="content" id="reply${rlist.seq }">${rlist.content }</textarea>
	</td>
	
	<c:if test="${rlist.id eq memberid }">
		<td id="updateReply${rlist.seq }"  class="updateReply" valign="middle" style="padding-top: 3px;">
			<!-- 수정버튼 -->
			<img src="<%=request.getContextPath() %>/resources/images/meetReplyUp.png" onclick="updateReply(${rlist.seq})"style="cursor: pointer;">
         
		</td>
		<td id="deleteReply${rlist.seq }"  class="deleteReply"  valign="middle" >
			<!-- 삭제버튼 -->
		<%-- 	<input type="button" value="삭제" onclick="deleteReply(${rlist.seq },${rlist.pseq })"> --%>
			<img src="<%=request.getContextPath() %>/resources/images/meetReplyDel.png" onclick="deleteReply(${rlist.seq },${rlist.pseq })" style="cursor: pointer;">
         
		</td>
		<td style="display: none;"  id="canReply${rlist.seq}" class="stateReply"  valign="middle">
			<input type="hidden" id="originReply${rlist.seq }" value="${rlist.content }" class="originReply">
			<!-- 취소버튼 -->
			<img src="<%=request.getContextPath() %>/resources/images/meetReplyCancel.png" onclick="cancelReply(${rlist.seq})" style="cursor: pointer;">
		</td>
		
		<td style="display: none;" class="stateReply" id="subReply${rlist.seq}"  valign="middle">
			<input type="hidden" value="${rlist.pseq }" name="pseq">
			<input type="hidden" value="${rlist.seq }" name="seq">
			<!-- 완료버튼 -->
			<input type="image" value="완료" src="<%=request.getContextPath() %>/resources/images/meetReplyUpEnd.png" style="cursor: pointer;" onclick=" return emptyUp(${rlist.seq})">
		</td>
	
			</c:if>
</tr>

</form>

<!-- 답글달기 -->
<form action="bbsAnswer.do" method="post"> 
 <tr style="display: none;" class="answer${rlist.seq}">
 <td colspan="2" style="border: none;padding-left: 20px; padding-top: 10px;">
 ${memberid }
<input type="hidden" readonly="readonly" value="${memberid }" name="id" size="5">
</td>
</tr>
<tr style="display: none;" class="answer${rlist.seq}">
<td>
<textarea rows="4" cols="67" name="content" id="answerContent${rlist.seq }"></textarea>
</td>
<td  valign="middle">
<input type="hidden" value="${rlist.seq }" name="seq">
<input type="hidden" value="${rlist.pseq }" name="pseq">
<input type="hidden" value="${rlist.lock_ }" name="lock_">
<input type="hidden" value="${rlist.ref }" name="ref">
<!-- 완료버튼 -->
<input type="image" value="완료" onclick="return answerCommit(${rlist.seq})" src="<%=request.getContextPath() %>/resources/images/meetReplyUpEnd.png" style="cursor: pointer;">
</td>
	<td>
		</td>
</tr>
</tr> 
</form> 

	
</c:if>
</c:forEach>
</c:if>
</table>

<div align="center" class="reple_div">
<form action="bbsReply.do">
<table style="padding-left:65px; font-size: 19px;">
<tr style="vertical-align: bottom; padding-bottom: 5px;">
<td colspan="2" style="border-bottom: none; padding-left: 20px;">
${memberid }
<input type="hidden" readonly="readonly" value="${memberid }" name="id">
</td>
</tr>
<!-- <input type="text" name="content"> -->
<tr>
<td style=" border-bottom: none; padding-right: 0px;">
<textarea rows="4" cols="67" name="content" id="replyContent"></textarea>
</td>
<td style="vertical-align: top;  border-bottom: none; padding-top: 8px; padding-left: 0px;">
<input type="checkbox" name="lock_" value="0" id="secretChk" style="margin-right: 0;">
<font style="font-size: 14px; padding-left: 0;">비밀댓글</font>
<br><br>
<input type="hidden" value="${bbs.seq }" name="pseq">
<input type="image" value="댓글달기"  src="<%=request.getContextPath() %>/resources/images/meetReplyCommit.png" id="replyCommit">
</td>
</tr>
</table>
</form>
<br><br>
<jsp:include page="paging.jsp">
	<jsp:param name="actionPath" value="bbsDetail.do" />
	<jsp:param name="nowPage" value="<%=paging.getNowPage() %>" />
	<jsp:param name="totalCount" value="<%=paging.getTotalCount() %>" />
	<jsp:param name="countPerPage" value="<%=paging.getCountPerPage() %>" />
	<jsp:param name="blockCount" value="<%=paging.getBlockCount() %>" />
	<jsp:param name="pseq" value="<%=paging.getPseq() %>" />
	

</jsp:include>
 
</div>
</div>
</div>
<script type="text/javascript">


var i =0;
function updateReply( seq ) {
	
	
	//수정 누르면 모든 내용 read막았다가 해당글만 열어줌
	$(".content").attr("readonly",true); 	
	$("#reply"+seq).attr("readonly",false); 
	$("#reply"+seq).focus();

	
		//모든 삭제와 수정버튼을 보여주고 취소와 확인버튼을 숨겨요
	$(".updateReply").show();
	$(".deleteReply").show();
	$(".stateReply").hide(); 
	
	//해당 수정과 삭제만 숨기고 해당괴는 삭제와 확인은 다시 활성화
	$("#updateReply"+seq).hide();
	$("#deleteReply"+seq).hide();
	$("#canReply"+seq).show();
	$("#subReply"+seq).show();
	
	//다른댓글수정 누르면 그전에 확인안했던 값 그대로 원래 값으로 돌려줘야함
	if(i == 0){
		
		i = seq;
		
		$("#reply"+seq).val($("#originReply"+i).val());
		
	}
	else if(i != seq){
		$("#reply"+i).val($("#originReply"+i).val());
		
		i = seq;
	}

}


//취소 누르면 원래 값으로 돌려줌
function cancelReply( seq ) {
	
	//alert($("#originReply"+seq).val());
	//원래 값으로 돌려줌
	$("#reply"+seq).val($("#originReply"+seq).val());
	$("#reply"+seq).attr("readonly",true);
	
	//수정삭제 활성화 확인 취소 비활성화
	$("#updateReply"+seq).show();
	$("#deleteReply"+seq).show();
	$("#canReply"+seq).hide();
	$("#subReply"+seq).hide();
}

//댓글 수정 완료버튼누르면 값변경




// 비밀글일때 value값 변경

$("#secretChk").change(function () {
	if($("#secretChk").is(":checked")){
		$("#secretChk").val("1");
	//	alert("secretChk 바뀜");
	//	alert($("#secretChk").val());
	}
});


// 댓글삭제
function deleteReply( seq, pseq ) {
	
	location.href="deleteReply.do?seq="+seq+"&pseq="+pseq;
	
}


function writeAnswer( seq ) {
	
	$(".answer"+seq).show();
	
}

// 댓글 널값막기
$("#replyCommit").click(function () {
	//alert("클릭");
	if($("#replyContent").val().trim() == null || $("#replyContent").val().trim() == ""){
		alert("댓글을 입력해주십시오.");
		$("#replyContent").focus();
		return false;
	}
	
});

function answerCommit( seq ) {
	if($("#answerContent"+seq).val().trim() == null || $("#answerContent"+seq).val().trim() == ""){
		alert("답글을 입력해주십시오.");
		$("#answerContent"+seq).focus();
		return false;
	}
}

function emptyUp(seq) {
	if($("#reply"+seq).val().trim() == null || $("#reply"+seq).val().trim() == ""){
		alert("내용을 입력해주십시오.");
		$("#reply"+seq).focus();
		return false;
	}
}

</script>


</body>
</html>