<%@page import="lala.com.a.hotel.pagingBean"%>
<%@page import="lala.com.a.model.MeetingDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath() %>/resources/css/memberDrop.css">
</head>
<body>

<%
List<MeetingDto> list =  (List<MeetingDto>)request.getAttribute("list");
pagingBean paging = (pagingBean)request.getAttribute("paging");
%>



<div class="main-container">
	<div class="main_top_menu">
		<span class="top_txt">내글 보기</span>
	</div>
	<div class="main_top_menu">
<ul class="nav nav-tabs">

  <li class="nav-item">
    <a class="nav-link" onclick = "MyWriteReview('<%=paging.getId() %>')" ><font color="#2c3e50"><b>축제 후기</b></font></a>
  </li>

  <li class="nav-item active" >
    <a class="nav-link" onclick = "MyWriteMeeting('<%=paging.getId()%>')"><font color="#2c3e50"><b>축제 미팅</b></font></a>
  </li>
  <li class="nav-item">
    <a class="nav-link" onclick = "MyWriteBbs('<%=paging.getId()%>')"><font color="#2c3e50"><b>자유게시판</b></font></a>
  </li>


</ul>
</div>
	<p class="pClear"></p>
	<hr id="hrBar">

<br><br>


<table class="table table-hover">
	<tr>
		<th>#</th><th>축제</th><th>제목</th><th>작성일</th>
	</tr>	
	<%if(list.size()==0){ %>
		<td></td>
		<td></td>
		<td>작성된 글이 없습니다.</td>
		<td></td>
	<%}else{ %>
	<%for(int i =0;i<list.size();i++){ 
		MeetingDto mlist = list.get(i);
	%>
	
	<tr>
		<td><%=i %></td>
	 	<td class="seqclick" seq=<%=mlist.getSeq() %>><%=mlist.getFtitle()%></td>
		<td><%=mlist.getTitle() %></td>
		<td><%=mlist.getWdate() %></td>
	</tr>

	<%}
}%>

</table>

<br>
<jsp:include page="paging.jsp">
	<jsp:param name="actionPath" value="MyWriteReview.do" />
	<jsp:param name="nowPage" value="${paging.nowPage }" />
	<jsp:param name="totalCount" value="${paging.totalCount }" />
	<jsp:param name="countPerPage" value="${paging.countPerPage }" />
	<jsp:param name="blockCount" value="${paging.blockCount }" />

	<jsp:param name="id" value="${login.id }" />
</jsp:include>


<form action="MyWriteReview.do" method="post" id="MyWriteReview_frm">
	<input type="hidden" id="rid" name="id" value="">
</form>

<form action="MyWriteMeeting.do" method="post" id="MyWriteMeeting_frm">
	<input type="hidden" value="" id="id" name=id>
</form>

<form action="MyWriteBbs.do" method="post" id="MyWriteBbs_frm">
	<input type="hidden" id="bid" name="id" value="">
</form>


</div>
<script type="text/javascript">
$(".seqclick").mousedown(function() {
	var id = "<%=paging.getId()%>";

	location.href = "meetDetail.do?seq=" + $(this).attr("seq")+"&id=<%=paging.getId()%>";
});

function MyWriteReview(id){
	$("#rid").val(id)
	$("#MyWriteReview_frm").submit();
}


function MyWriteMeeting(id){
	$("#id").val(id);
	$("#MyWriteMeeting_frm").submit();
}
function MyWriteBbs(id){
	$("#bid").val(id)
	$("#MyWriteBbs_frm").submit();
}
</script>

</body>
</html>