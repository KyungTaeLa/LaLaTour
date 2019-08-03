<%@page import="java.util.List"%>
<%@page import="lala.com.a.model.ReplyDto"%>
<%@page import="lala.com.a.model.MemberDto"%>
<%@page import="lala.com.a.model.MeetingDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<style type="text/css">

body{
font-family: 'Nanum Gothic', sans-serif;
   font-size: 19px;
  /*  background-color:  #fbfbfb; */
  background-color: white;
   
}
.divList{
   padding-top: 100px;
   padding-bottom: 10%;
   width: 1250px;
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
.reple_div {
   /* height: 60px; */
   font-size: 15px;
   margin: auto;
    padding-right: 68px; 
    padding-left: 25px;

}
#divBack{
   padding-top:10px;
   padding-bottom: 50px;
   margin: auto;
   background-color:  #fbfbfb;
 
}
#divBack .progress{
   margin-top: 0px;
   
}
.answerDiv{

padding: 50px;
font-size: 19px;
margin:auto;
/* background-color:#F0F4FA; */
background-color:  #fbfbfb;
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
   padding-bottom: 20px;
   
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
.title{
padding-top:20px;
 border: none; 
  text-align: center;
  outline: none;
  font-size: 30px;
  font-weight: bold;
 background-color:  #fbfbfb;
  width: 1000px;
  color: #081932;
}
.meet_out .festival_title{

   padding-top: 10px;
}
.meet_out .festival_thumbnail{
 margin-top: 32px;
   margin: 0;
}
.meet_out .meet_memberCnt{
   width: 250px;

}
.gray{

   z-index: 99;
   max-height: 100%;
   overflow: hidden;
   /* background-color: #F0F4FA; */
   background-color:  #fbfbfb;
}
.meet_out .festival_thumbnail, .meet_out .festival_title{
    padding-top:70px; 
   margin-left: 440px;
}
.person_div img{

   width: 210px;

}
.main_title{
   padding-top: 20px;
   padding-bottom:0;
   padding-left:30px;
   margin-bottom: 0;
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


</head>

<%
//사용자 세션
Object ologin = session.getAttribute("login");
MemberDto member = null;
if(ologin != null) {
     member = (MemberDto)ologin;
}else{
   
   member.setId("guest");
}


%>
<%
MeetingDto dto = (MeetingDto)request.getAttribute("meetdetail");
 String joinID = (String)request.getAttribute("joinID");
 List<ReplyDto> reply = (List<ReplyDto>)request.getAttribute("reply");
 double percent =(double)dto.getUsercnt()/(double)dto.getMaxcnt()*100;
%> 

<body>
<!-- 중간이미지 -->
<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
<div class="middleImg">
<h1 class="middleTitle">커뮤니티</h1>
</div>
</div>



      
<div class="divAll">
<div class="main_title">
<h1>참여 게시판</h1>
</div>

<div id="divSub" style="text-align: right; width: 100%">
<a href="bbsList.do">자유게시판</a>&nbsp;&nbsp;|&nbsp;
<a href="meeting.do"><b>참여게시판</b></a>
</div>



<div class="divList" align="center">
<div id="divBack">
<form action="meetUpdate.do">

<div id="main_divList">
<div class="title">
<!-- 제목 -->
<input type="text" value="<%=dto.getTitle() %>" readonly="readonly" class="title" id="title" name="title" size="80" > 
</div>

         
      <input type="hidden" value="<%=dto.getUsercnt() %>/<%=dto.getMaxcnt() %>" >
         
         <div style=" position: relative;">
         <!-- 사람이미지 -->
    <div style="position: absolute;" class="person_div">

        <div style="position: relative; top: 85px; left: 165px;" id="grayPerson" class="gray"><img src="<%=request.getContextPath()%>/resources/images/grayPerson.png"></img></div>
    </div>

    <div style="position: absolute;" class="person_div">

        <div style="position: relative; top: 85px; left: 165px;"><img src="<%=request.getContextPath()%>/resources/images/colorPerson.png"></img></div>
    </div>
    <div style="position:absolute; top: 144px; left: 380px; padding-bottom: 20px; text-align: center; font-size: 20px; line-height: 33px; color:#143264;">
         <b>[모집인원]</b><br><%=dto.getUsercnt() %>/<%=dto.getMaxcnt() %><br><br>
          <b>[모집일]</b><br><%=dto.getEdate().substring(0,4) %>-<%=dto.getEdate().substring(4,6) %>-<%=dto.getEdate().substring(6,8) %>
      <input type="hidden" value="<%=dto.getEdate() %>">
      </div> 
</div>

     <div class="meet_out">
        <!-- 축제 정보 -->
           
            <div class="festival_thumbnail">
       <a href="festivalDetail.do?seq=<%=dto.getFseq() %>" >
               <img  src="<%=request.getContextPath()%>/upload/<%=dto.getFthumbnail()%>" style="width:420px;  margin-top: 32px; /*  margin-bottom: 30px; */">
              <input type="hidden" value="<%=dto.getFtitle() %>">
           <div class="festival_title" style="padding-top: 5px; margin-bottom: 30px;  text-align:center; color:#143264; font-size: 17px; margin-left:0px; ">
                
            <!--  <div class="festival_title" style="padding-top: 5px; /* margin-bottom: 30px; */ float:left; color:white; font-size: 17px;">
             --> <b><%=dto.getFtitle() %></b>
             </div>
         </a> 
           </div>
    
   
    
      
       </div>

  
<div >
<div>
      <!-- 내용 -->
     
   <textarea style="padding: 20px; " rows="11" cols="92" readonly="readonly" id="content" name="content"><%=dto.getContent() %></textarea>
 
</div>
<div style="text-align: right; padding-right: 200px;">
<!-- 아이디 -->
<%=dto.getId() %>
<input type="hidden" id="writerId" value="<%=dto.getId() %>" >
</div>
</div>
</div>



         

<div class="progress" >
<table style="width: 100px; padding-top: 30px;">
<tr align="center">
<td>
<a href="meeting.do">
<img src="<%=request.getContextPath() %>/resources/images/meetList.png" style="cursor: pointer;">
</a>
</td>
<%if(dto.getProgress() == 0 && member.getAuth() == 0 && dto.getId().equals(member.getId())) {%>
<td style="padding-bottom: 2px;">
 <img alt="" src="<%=request.getContextPath() %>/resources/images/meetUp.png" id="updateContent" style="cursor: pointer;">
<!-- <input type="button" value="글수정하기" id="updateContent"> -->
<input type="hidden" value="<%=dto.getSeq() %>" name="seq"> 
<input type="hidden" value="<%=dto.getId() %>" name="id"> 
<input type="image" id="updateContentAf" style="display: none;"src="<%=request.getContextPath() %>/resources/images/meetUpend.png">
<!-- <input type="submit" value="글수정완료" id="updateContentAf" style="display: none;"> -->
</td>
<%} %>
</form>

<!-- dto 가 작성된 글에 관함 member 로그인한사람 joinID = 참가여부 1 => 날짜가 지나거나 글작성자의 임의마감  2=> 인원이다차서-->
<%if(dto.getProgress() != 1 && member.getAuth() == 0) {
//참가자가 내가 아니면서, 작성자가 내가아니면 = 내가 참가안한 피티면,

if(!joinID.equals(member.getId()) && !dto.getId().equals(member.getId()) && dto.getProgress() != 2)  {%>
<form action="meetJoinAf.do">
<td >
<input type="hidden" id="memberId" value="<%=member.getId() %>" name="id">
<input type="hidden" value="<%=dto.getSeq() %>" name="seq">
<!-- 참가하기버튼 -->
<input type="image" src="<%=request.getContextPath() %>/resources/images/join.png" >
</td>
</form>
<%}else if(dto.getId().equals(member.getId()) && dto.getProgress() != 2 ){%>
<form action="meetEnd.do">
<td style="padding-bottom: 2px;">
<input type="hidden" value="<%=dto.getSeq() %>" name="seq">
<input type="hidden" value="<%=member.getId() %>" name="id">
<!-- 마감버튼 -->
<input type="image"  src="<%=request.getContextPath() %>/resources/images/meetEnd.png">
</td>
</form>

<form action="meetDelete.do">
<td style="padding-bottom: 2px;">
<input type="hidden" value="<%=dto.getSeq() %>" name="seq">
<input type="image"  src="<%=request.getContextPath() %>/resources/images/meetDel.png">
</td>
</form>

<%}else if(joinID.equals(member.getId()) && dto.getProgress() !=1 && !dto.getId().equals(member.getId())){
//내가 참가를 한거
//마감이 됐는데, 내가 참가를 했고, 날짜가 안지났어
%>
<td>
<form action="meetJoinDel.do">
<input type="hidden" value="<%=member.getId() %>" name="id">
<input type="hidden" value="<%=dto.getSeq() %>" name="seq">
<!-- 참가취소버튼 -->
<input type="image" src="<%=request.getContextPath() %>/resources/images/joinCancel.png">
</form>
</td>
<%} %>
<%}else if(member.getAuth() == 0 && dto.getProgress() != 0){%>
<td align="center">
<!-- 마감완료 -->
<img alt="" src="<%=request.getContextPath() %>/resources/images/meetAllEnd.png" >
</td>
<%} %>
</tr>
</table>
</div>
</div>



<hr style="margin: 0;">
<!-- 댓글보여주는곳 -->
<div  class="answerDiv">
<table>
<!-- <col width="3%"><col width="30%"><col width="10%"><col width="10%"><col width="10%"> -->
<%for(int i =0; i<reply.size(); i++){ 
   ReplyDto rlist = reply.get(i);
   //lock이 0이거나 댓글을 단사람과 로그인사람 같거나 작성자 본인이면 글 볼수있게함
   
   //삭제는 여기서 걸림
   if(rlist.getDel() == 1){
   %>
   
   <tr style="height: 5px; ">
   <td style="padding-top: 20px; " colspan="5" class="del_up_Area">
   <%if(rlist.getStep() > 0){ //여기에 48px짜리 빈이미지 하나 넣어주세요 %>
      <img alt="" src="<%=request.getContextPath() %>/resources/images/arrow.png" style="vertical-align: top; width: 21px;">
      <b><textarea rows="3" cols="67" readonly="readonly">삭제된 댓글입니다.</textarea></b>
      <%}else{ %>
      <!-- 대댓글아니면 textArea 크기 늘려줌 -->
      <b><textarea rows="3" cols="70" readonly="readonly">삭제된 댓글입니다.</textarea></b>
      <%} %>
   
   </td>
   </tr>
<%}
   else if((rlist.getLock_() > 0 && !dto.getId().equals(member.getId())) &&  (rlist.getLock_() > 0 && !rlist.getId().equals(member.getId()))){
%>   
   <!-- 비밀댓글 -->
   <tr style="height: 5px;">
   <td style="padding-top: 20px;" colspan="5" class="del_up_Area">
   <%if(rlist.getStep() > 0){ //여기에 48px짜리 빈이미지 하나 넣어주세요 %>
      <img alt="" src="<%=request.getContextPath() %>/resources/images/arrow.png" style="vertical-align: top; width: 20px;">
      <textarea rows="2" cols="64" readonly="readonly" style="color: black">비밀 댓글입니다.</textarea>
      <%}else{ %>
      <!-- 대댓글아니면 textArea 크기 늘려줌 -->
      <textarea rows="2" cols="66" readonly="readonly" style="color: black">비밀 댓글입니다.</textarea>
      <%} %>
   
   </td>
   
   </tr>
   <% 
}
   else{ %>
<tr style="height: 20px;">
   <td style="vertical-align: bottom; padding-left: 10px; border-bottom: none; padding-bottom: 0;">
   
   <%if(rlist.getStep() > 0){ //여기에 48px짜리 빈이미지 하나 넣어주세요 %>
      <img alt="" src="<%=request.getContextPath() %>/resources/images/duqor.png" style="vertical-align: top; height: 20px; width: 20px; ">
      <%} %>
      <%=rlist.getId() %>&nbsp;
      <font style="font-size: 12px;">
      <%=rlist.getWdate().substring(0,11) %>
      <%=rlist.getWdate().substring(11,19) %></font>
      <input type="hidden" value="<%=rlist.getWdate() %>" readonly="readonly" name="wdate">
      <input type="hidden" value="<%=rlist.getId() %>" readonly="readonly" name="id">
      <% if(rlist.getDel() == 2) {%>
      <font style="font-size: 14px;" >(수정됨)</font>
      <%} if(rlist.getStep() ==0){ %>
      <a onclick="answerChk(<%=rlist.getSeq() %>)" style="float: right; padding-right: 10px;"><font style="font-size: 16px; cursor: pointer;">답글달기</font></a>
   
   <%}%>
      
   </td>
   </tr>
   <tr >
   <td style="vertical-align: center; " >
<form action="meetReplyUpdate.do" id="meetReplyUpdate<%=rlist.getSeq() %>">
      <!-- 대댓글이면 들여쓰기 -->
      <%if(rlist.getStep() > 0){ %>
      <img alt="" src="<%=request.getContextPath() %>/resources/images/arrow.png" style="vertical-align: top; width: 20px;">
      <textarea rows="4" cols="68" id="upcontent<%=rlist.getSeq() %>" name="content" class="content" style="text-align: left; border: 2px solid #5D8CAE !important; " readonly="readonly"><%=rlist.getContent() %></textarea>
      <%}else{ %>
      <!-- 대댓글아니면 textArea 크기 늘려줌 -->
      <textarea rows="4" cols="70" id="upcontent<%=rlist.getSeq() %>" name="content" class="content" style="text-align: left; border: 2px solid #5D8CAE !important; " readonly="readonly"><%=rlist.getContent() %></textarea>
      <%} %>
      <input type="hidden" id="originReply<%=rlist.getSeq() %>" value="<%=rlist.getContent() %>">
      
          <input type="hidden" name="seq" value="<%=rlist.getSeq() %>">
         <input type="hidden" value="<%=dto.getSeq() %>" name="pseq">
         <input type="hidden" value="<%=member.getId() %>" name="id">
      </form>
   </td>
   
   
   <%if(rlist.getId().equals(member.getId()) && (rlist.getDel() != 1 || rlist.getDel() == 2) ){ %>   
      <td>
         <!-- 댓글수정버튼 -->
         <img src="<%=request.getContextPath() %>/resources/images/meetReplyUp.png" onclick="updateReply(<%=rlist.getSeq() %>)" id="upReply<%=rlist.getSeq() %>" class="upReply" style="cursor: pointer;">
         <%-- <input type="button" value="수정" onclick="updateReply(<%=rlist.getSeq() %>)" id="upReply<%=rlist.getSeq() %>" class="upReply"> --%>
         <input type="hidden" name="seq" value="<%=rlist.getSeq() %>">
         <input type="hidden" value="<%=dto.getSeq() %>" name="pseq">
         
         <!-- 댓글수정완료버튼 -->
       <%--   <input style="display: none;" type="image" value="수정완료" src="<%=request.getContextPath() %>/resources/images/meetReplyUpEnd.png" id="upReplyAf<%=rlist.getSeq() %>" class="stateReply" onclick="upReplyAf(<%=rlist.getSeq() %>)">
        --%>  
           <img  style="display: none;" src="<%=request.getContextPath() %>/resources/images/meetReplyUpEnd.png" id="upReplyAf<%=rlist.getSeq() %>" class="stateReply" onclick="upReplyAf(<%=rlist.getSeq() %>)">
        
        <br>
      <form action="meetReplyDelete.do">
          <!-- 수정취소버틍 -->
         <img style="display: none;" src="<%=request.getContextPath() %>/resources/images/meetReplyCancel.png" class="stateReply" value="취소" id="cancelReply<%=rlist.getSeq() %>" onclick="cancelReply(<%=rlist.getSeq() %>)">
         <input type="hidden" value="<%=rlist.getContent() %>" id="originReply<%=rlist.getSeq() %>">
         <input type="hidden" value="<%=dto.getSeq() %>" name="pseq">
         <input type="hidden" name="seq" value="<%=rlist.getSeq() %>">
         <input type="hidden" name="id" value="<%=member.getId() %>">
         <input type="image" src="<%=request.getContextPath() %>/resources/images/meetReplyDel.png" class="delReply" id="delReply<%=rlist.getSeq() %>"> 
         <%-- <input type="submit" value="삭제"  class="delReply" id="delReply<%=rlist.getSeq() %>"> --%>
      </form>
      </td>

<%}} %>
</tr>

<tr style="display: none; height: 20px; border-bottom: none;" id="answer<%=rlist.getSeq() %>">
   <td style="vertical-align: bottom; padding-left: 10px; border-bottom: none; padding-bottom: 0;">
<form action="answer.do">
   <%=member.getId() %></td>
   </tr>
   <tr style="display: none;" id="answer2<%=rlist.getSeq() %>">
   <td>
      <textarea rows="4" cols="70" name="content" id="AnswerContent<%=rlist.getSeq()%>"></textarea>
   </td>
   <td>
      <input type="image" value="답글달기" src="<%=request.getContextPath() %>/resources/images/meetReplyUpEnd.png" onclick="return Answer('<%=rlist.getSeq()%>')">
      <br>
      <!-- 답글달기취소버튼 -->
      <img src="<%=request.getContextPath() %>/resources/images/meetReplyCancel.png" onclick="foldAnswer(<%=rlist.getSeq() %>)" style="cursor: pointer;">
   
<input type="hidden" name="id" value="<%=member.getId() %>">
<input type="hidden" name="pseq" value="<%=dto.getSeq() %>">
<input type="hidden" name="ref" value="<%=rlist.getRef() %>">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
<input type="hidden" name="lock_" value="<%=rlist.getLock_() %>">
</form>
   </td>
</tr>

<%}%>

</table>
<br><br>

<!-- </div> -->

<form action="meetReply.do" method="get">
<div align="center" class="reple_div">
<table style="padding-left:65px; border-bottom: none;" >
<!-- <col width="60%"><col width="20%"> -->
<tr style="height:20px; padding-top: 10px; border-bottom: none;">
   <td align="left" valign="bottom" style=" font-size: 20px;border-bottom: none; padding-left:15px; padding-bottom: 0;" colspan="2">
   <%=member.getId() %>
   <input type="hidden" value="<%=member.getId() %>" name="id" >
   </td>
   </tr>
   <tr>
   <td style="border-bottom: none;">
   <textarea rows="4" cols="70" name="content" id="recontent"></textarea>
   </td>
   <td style="font-size: 14px; padding-left: 0; padding-right: 0;  vertical-align: top; border-bottom: none;">
   <input type="checkbox" id="secretChk" >비밀댓글
   <br><br>
   <!-- 댓글달기버튼 -->
   <input type="image" value="댓글달기" id="ttest" src="<%=request.getContextPath() %>/resources/images/meetReplyCommit.png">
   </td>
   
</tr>

</table>
<input type="hidden" value="<%=dto.getSeq() %>" name="pseq">
<input type="hidden"  name="lock_" id="lock_" value="0"> 
</div>
</form>
</div>
</div>
</div>


<script type="text/javascript">
//글수정막기
$("#updateContentAf").click(function () {
	if($("#content").val().trim() == null || $("#content").val().trim() ==""){
		alert("내용을 입력해 주십시오.");		
		$("#content").focus();
		return false;
	}
	
});

//댓글수정 보내기&& null막기
function upReplyAf( seq ) {
  
  if($("#upcontent"+seq).val().trim() ==null || $("#upcontent"+seq).val().trim() ==""){
	  alert("내용을 입력해 주십시오.");
	  $("#upcontent"+seq).focus();
  }else{
   $("#meetReplyUpdate"+seq).submit();
	}
}

//비밀댓글 value 바꾸기 1==> 비밀댓글on
$("#secretChk").change(function () {
   if($("#secretChk").is(":checked")){
      $("#lock_").val("1");
   }else{
      $("#lock_").val("0");
   }
});
      
// 댓글 null막기
$("#ttest").click(function () {
   //alert("클릭함");
    if($("#recontent").val().trim() == null ||$("#recontent").val().trim() == ""  ){
       
       alert("내용을 입력해 주십시오");
       return false;
    }
    
});
//답글 null막기
function Answer( seq ) {
	if($("#AnswerContent"+seq).val().trim() == null || $("#AnswerContent"+seq).val().trim() == ""){
		
		alert("내용을 입력해주세요");
		$("#AnswerContent"+seq).focus();
		return false;
	}
}    

// 답글창열기
function answerChk( num ){
   
//   alert("클릭함");
   $("#answer"+num).show(); 
   $("#answer2"+num).show(); 
   
};

//답글창 닫기
function foldAnswer( num ) {
   $("#answer"+num).hide(); 
   $("#answer2"+num).hide(); 
}

var i =0;
function updateReply( seq ){
   //alert("수정클릭");
   //alert(seq);
   //수정 누르면 모든 내용 read막았다가 해당글만 열어줌
   $(".content").attr("readonly",true); 
    $("#upcontent"+seq).attr("readonly",false); 
   $("#upcontent"+seq).focus();
 
   
   //모든 삭제와 수정버튼을 보여주고 취소와 확인버튼을 숨겨요
   $(".upReply").show();
   $(".delReply").show();
   $(".stateReply").hide(); 
   
   //해당 수정과 삭제만 숨기고 해당괴는 삭제와 확인은 다시 활성화
   $("#upReply"+seq).hide();
   $("#delReply"+seq).hide();
   $("#cancelReply"+seq).show();
   $("#upReplyAf"+seq).show();
   
   //다른댓글수정 누르면 그전에 확인안했던 값 그대로 원래 값으로 돌려줘야함
   if(i == 0){
      
      i = seq;
      
      $("#upcontent"+seq).val($("#originReply"+i).val());
      
   }
   else if(i != seq){
      $("#upcontent"+i).val($("#originReply"+i).val());
      
      i = seq;
   }
   
   
};


$("#updateContent").click(function () {
   //alert("글수정 클릭됨");
   $("#updateContent").hide();

   $("#content").attr("readonly",false); 
   $("#title").attr("readonly",false); 
   $("#title").focus();
   
   $("#updateContentAf").show();
   $("#cancelContent").show();
   
});


//취소 누르면 원래 값으로 돌려줌
function cancelReply( seq ) {
   alert("취소클릭");
   alert($("#originReply"+seq).val());
   //원래 값으로 돌려줌
   $("#upcontent"+seq).val($("#originReply"+seq).val());
   $("#upcontent"+seq).attr("readonly",true);
   
   //수정삭제 활성화 확인 취소 비활성화
   $("#upReply"+seq).show();
   $("#delReply"+seq).show();
   $("#cancelReply"+seq).hide();
   $("#upReplyAf"+seq).hide();
}
 //사람percnet 이미지
 $(document).ready(function () {
   var percent = <%=percent %>;
   var result =(100-percent)*2.3+28;
   //alert(result);
    $("#grayPerson").css("height", result+"px"); 
});
 
 
//로그인 안한 사람이 참가하기 버튼누르면
function guestChk( id ){
  
  if(id == 'guest'){
  alert("로그인 후 이용해 주십시오.");
  return false;
  }
  
}


</script>


</body>
</html>