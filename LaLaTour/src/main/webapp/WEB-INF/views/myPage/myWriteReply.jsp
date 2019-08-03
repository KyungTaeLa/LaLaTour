
<%@page import="lala.com.a.hotel.pagingBean"%>
<%@page import="lala.com.a.model.ReplyDto"%>
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
List<ReplyDto> list = (List<ReplyDto>)request.getAttribute("list");
pagingBean paging = (pagingBean)request.getAttribute("paging");
%>

<div class="main-container">
   <p class="top_txt">내가 쓴 댓글</p>
   <hr id="hrBar">
   <table class="table">
   <col width=600px><col width=104px><col width=125px>
      <tr class="table_top_tr">
         <th>
            <input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll()"> 댓글
         </th>
         <th class="table_last_th">작성일</th>
         <th></th>
      </tr>
      <%if(list.size()==0||list==null){ %>
         <td colspan="4">작성된 댓글이 없습니다.</td>
      <%}else{ %>   
      <%for(int i =0;i<list.size();i++){
      ReplyDto rdto = list.get(i);   
      %>
   <form action="MyWriteReplyDel.do" method="post">
      <tr>      
            <td><input type="checkbox" name="checkRow" value="<%=rdto.getSeq()%>">
            <%= rdto.getContent()%>
         </td>
         <td class="table_last_th">
            <%=rdto.getWdate() %>
         </td>
         <td>
            <a href="#" id="reply_detail" onclick="TnameCheck(<%=rdto.getSeq()%>,<%=rdto.getPseq()%>,'<%=rdto.getTname()%>','<%=rdto.getId()%>')">원문보기▶</a>
         </td>
      </tr>
      
      <%
      }
   }
      %>
   </table>
<input type="hidden" name="id" value="<%=paging.getId()%>">
<input type="submit" class="btn btn-secondary" value="댓글 삭제"  style="margin-left: 87%">
</form>
<!-- </form> -->
<jsp:include page="paging.jsp">
   <jsp:param name="actionPath" value="MyWriteReply.do" />
   <jsp:param name="nowPage" value="${paging.nowPage }" />
   <jsp:param name="totalCount" value="${paging.totalCount }" />
   <jsp:param name="countPerPage" value="${paging.countPerPage }" />
   <jsp:param name="blockCount" value="${paging.blockCount }" />

   <jsp:param name="id" value="${login.id }" />
</jsp:include>
</div>

<script type="text/javascript">
function TnameCheck(seq , pseq , tname , id){
   alert("들어옴\n"+seq+" , "+pseq+"   ,  "+tname+" , @"+id)
   //Festival
   if(tname=="FESTIVAL"){
      location.href="festivalDetail.do?seq="+pseq
    //reivew
   }else if(tname=="REVIEW"){
      location.href="reviewDetail.do?seq="+pseq
   }
   //location attrac
   if(tname=="attrac"){
      location.href="location_attrac_detail.do?seq="+pseq+"&subname=attrac"
   }
   //location shop
   if(tname=="shop"){
      location.href="location_attrac_detail.do?seq="+pseq+"&subname=shop"
   }
   //location food
   if(tname=="food"){
      location.href="location_attrac_detail.do?seq="+pseq+"&subname=food"
   }
   if(tname=="HOTEL"){
      location.href="hoteldetail.do?seq="+pseq
   }
   if(tname=="MEETING"){
      location.href="meetDetail.do?seq="+pseq+"&id="+id
   }
   if(tname=="PRODUCT"){
      location.href="productdetail.do?product_seq="+pseq
   }
   if(tname="bbs"){
      location.href="bbsDetail.do?seq="+pseq
   }
}

function checkAll(){
   alert("함수진입")
    if( $("#th_checkAll").is(':checked') ){
      $("input[name=checkRow]").prop("checked", true);
    }else{
      $("input[name=checkRow]").prop("checked", false);
    }
}



</script>







</body>
</html>