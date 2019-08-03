<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
    
<%
Calendar cal = Calendar.getInstance();

int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH) + 1;
int tday = cal.get(Calendar.DATE);
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- local CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/infoChange.css">

<style type="text/css">
body{
   /* font-family: 'Nanum Gothic', sans-serif; */
   /* font-size : 10px; */
/*    background-color: #f9f9f9; */
}
.tb_top01{
   margin: auto;
   width: 1100px;
}
.tb_top01 h3{
   margin-left:60px;
   margin-top:30px;
   margin-bottom:30px;
}
.center{
   margin: auto;
   text-align: center;
   border-top : 4px solid black;
   width: 1100px;
   background-color : #fff;
}
.tb_head01{
    width:1000px;
}

#page_board {
    clear: all;
    margin: 0;
    padding: 50px;
    z-index: 1;
    text-align: left;
    font-size: 10pt;
}

#page_mark{
    margin:1rem 1rem 1rem 0;
}
/*유앤아이 소식지*/
.tb_Head01 {width:100%;}
.tb_Head01 table {width:100%;}
.tb_Head01 table th{text-align: left;font-size: 10pt;font-weight: bold; padding: 8px 0;border-bottom: 2px dotted #e8e3e3;}
.tb_Head01 table thead td {height:33px;font-size:12px;font-weight:normal;border-top: 2px dotted #e8e3e3;border-bottom:2px dotted #e8e3e3;}
.tb_Head01 table tbody td{text-align: left;padding: 17px 0;border-bottom: 2px dotted #e8e3e3; font-size:10pt;}
#top_info{
	font-size: 30px;
	padding-left:20px;
	margin:30px 0px;
	font-weight: bold;
}
</style>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//cdn.poesis.kr/post/popup.min.js" charset="UTF-8"></script>

<title>라라투어 - 내 정보 수정</title>
</head>

<body>

<!-- 상단이미지 -->


<div style="width:1250px; margin:50px;">

<p id="top_info">내 정보 수정</p>

<form action="myInfoChangeAf.do" method="post" onsubmit="return check()">
<table class="basic colline padding10">
<colgroup>
   <col width="250px"><col width="850px">
</colgroup>

<tbody>
<tr>
   <th>아이디</th>
   <td>
      <input type="text" name="id" id="id" class="join_input n_border" value="${member.id }" readonly>
   </td>
</tr>
<tr>
   <th>비밀번호</th>
   <td>
      <input type="password" name="pwd" id="pwd" class="join_input" >
      <span>( 3~20자, 영문, 숫자만 가능합니다. )</span>
   </td>
</tr>
<tr>
   <th>비밀번호 재확인</th>
   <td>
      <input type="password" name="pwd2" id="pwd2" class="join_input">
      <span id="pwdChk"></span>
   </td>
</tr>
<tr>
   <th>이름</th>
   <td>
      <input type="text" name="name" id="name" class="join_input" value="${member.name }">
   </td>
</tr>
<tr>
   <th>이메일</th>
   <td>
      <input type="text" name="email1" id="email1" class="join_input">&nbsp;@&nbsp;
      <input type="text" name="email2" id="email2" class="join_input" style="width: 150px;">&nbsp;
      <select id="email3" class="select_email">
         <option selected="selected">직접입력</option>
         <option value="naver.com">naver.com</option>
         <option value="hanmail.net">hanmail.net</option>
         <option value="gmail.com">gmail.com</option>
      </select>
      <input type="hidden" name="email" id="email" size="20" value="">
   </td>
</tr>
<tr>
   <th>연락처</th>
   <td>
      <select id="phone1" class="select_phone">
         <option value="010" selected="selected">010</option>
         <option value="011">011</option>
      </select>-
      <input type="text" id="phone2" class="join_input width100">-
      <input type="text" id="phone3" class="join_input width100">
      <input type="hidden" name="phone" id="phone" size="20" value="">
   </td>
</tr>
<tr>
   <th>비밀번호 질문</th>
   <td>
      <select id="question" name="question" class="select_answer">
         <c:forEach items="${question}" var="que" varStatus="i">
            <option value="${que.seq}">${que.title}</option>
         </c:forEach>
      </select>
   </td>
</tr>
<tr>
   <th>질문 답변</th>
   <td>
      <input type="text" name="answer" id="_answer" class="join_input width400">
   </td>
</tr>
<tr>
   <th>주소</th>
   <td>
      <div>
          <p>
              <label>우편번호&nbsp;</label><input type="text" size="4" class="postcodify_postcode6_1 join_input width100" id="post1" readonly="readonly" /> &ndash;
              <label></label><input type="text" size="4" class="postcodify_postcode6_2 join_input width100" id="post2" readonly="readonly" /> &nbsp;
              <input type="button" value="검색" id="postcodify_search_button" class="join_smBtn" style="vertical-align: bottom;">
          </p>
          <p><label style="padding-left:30px">주소&nbsp;</label><input type="text" class="postcodify_address join_input width500" id="address1" readonly="readonly"/></p>
          <p><label>상세주소&nbsp;</label><input type="text" class="postcodify_details join_input width500" id="address2"/></p>
      </div>
      <input type="hidden" name="address" id="address" size="20" value="">
   </td>
</tr>
</tbody>
</table><br>

<div id="joinBtnDiv" style="text-align: center;">
   <!-- <input type="image" src="./images/main/join_btn.gif" id="submitBtn" disabled="disabled"> -->
   <button type="submit" id="submitBtn" class="join_btn opacity" >수정하기</button>
</div>

</form>
</div> <!-- end div1100 -->

<script type="text/javascript">
$("#pwd2").focusout(function() {
	var pwd1 = $("#pwd").val();
	var pwd2 = $("#pwd2").val();
	var msg = "";
	if(pwd1 != pwd2){
		msg = "비밀번호가 일치하지 않습니다.";
		$("#pwdChk").addClass("red");
		$("#pwdChk").removeClass("blue");
	}else{
		msg = "비밀번호가 일치합니다"
		$("#pwdChk").addClass("blue");
		$("#pwdChk").removeClass("red");
	}
		$("#pwdChk").text(msg);
});
var idck = false;
var wid = "";

$(document).ready(function() {
	var email = "${member.email}";
	
	var eIndex = email.indexOf("@");
	
	var email1 = email.substr(0, eIndex);
	var email2 = email.substr(eIndex+1);
	$("#email1").val(email1);
	$("#email2").val(email2);
	
	var phone = "${member.phone}"
	var phone1 = phone.split("-");
	
	$("#phone2").val(phone1[1]);
	$("#phone3").val(phone1[2]);
	
	var answer = '${member.answer}';
	
	$("#_answer").val(answer);
	
	var address = '${member.address}';
	var arrAddress = address.split("-");
	var post1 = arrAddress[0].substr(1);
	var post2 = arrAddress[1].substr(0,arrAddress[1].lastIndexOf("]"));
	$("#post1").val(post1);
	$("#post2").val(post2);
	var address1 = arrAddress[1].substr(arrAddress[1].indexOf("]")+1);
	var address2 = arrAddress[2];
	$("#address1").val(address1);
	$("#address2").val(address2);
	
   $("#postcodify_search_button").postcodifyPopUp();
   
	var question = "${member.question}";
	$("#question").val(question).prop("selected",true);
	
   $("#id").on("focus", function() {
      $("#submitBtn").attr("disabled", true);
      $("#submitBtn").addClass("opacity");
   });
   
   $("#email3").change(function() {
      $("#email2").val($("#email3").val());
   });
   
});

function check() {
   if($("#id").val().trim()=="") {
      alert("ID를 입력해야 합니다.");
      $("#id").focus();
      return false;
   }
   if($("#pwd").val().trim()=="") {
      alert("비밀번호를 입력해야 합니다.");
      $("#pwd").focus();
      return false;
   }
   if( $("#pwd").val().trim() != $("#pwd2").val().trim() ) {
      alert("비밀번호가 서로 다릅니다.");
      $("#pwd").val("");
      $("#pwd").val("");
      return false;
   }
   if($("#name").val().trim()=="") {
      alert("이름을 입력해야 합니다.");
      $("#name").focus();
      return false;
   }
   if($("#email1").val().trim()=="" || $("#email2").val().trim()=="") {
      alert("이메일을 입력해야 합니다.");
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
   if($("#_answer").val().trim()=="") {
      alert("답변을 입력해야 합니다.");
      $("#_answer").focus();
      return false;
   }
   
   if( !($("#id").val().trim()==wid) ) {
      idck = false;
   }
   
   $("#email").val( $("#email1").val() + "@" + $("#email2").val() );
   $("#phone").val( $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val() );
   var adrs = "["+$("#post1").val()+"-"+$("#post2").val()+"] " + $("#address1").val() + "-" + $("#address2").val();
   $("#address").val(adrs);
   
   if(valcPwd()==false || valcName()==false || valcEmail()==false || valcPhone()==false) {
      return false;
   }
   
   idck = false;
   return true;
}

function valcPhone() {
   var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
   if( regPhone.test($("phone").val())==false ) {
      alert("잘못된 연락처입니다");
      return false;
   }
}

function valcId() {
   var regSpace = /\s/g;
   if( regSpace.test($("#id").val().trim())==true ) {
      alert("ID에 공백이 있습니다");
      return false;
   }
   
   var regId = /^[a-z0-9_]{3,15}$/;
   if( regId.test($("#id").val())==false ) {
      alert("ID 형식이 잘못되었습니다");
      return false;
   }
   
   return true;
}

function valcPwd() {
   var regSpace = /\s/g;
   if( regSpace.test($("#pwd").val().trim())==true ) {
      alert("비밀번호에 공백이 있습니다");
      return false;
   }
   
   var regId = /^[a-z0-9_]{3,15}$/;
   if( regId.test($("#pwd").val())==false ) {
      alert("비밀번호 형식이 잘못되었습니다");
      return false;
   }
   
   return true;
}

function valcName() {
   var regName = /\s/g;
   if( regSpace.test($("#name").val().trim())==true ) {
      alert("이름에 공백이 있습니다");
      return false;
   }
   return true;
}

function valcEmail() {
   var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
   if( regEmail.test($("#email").val().trim())==false ) {
      alert("잘못된 이메일 형식입니다");
      return false;
   }
   return true;
}
</script>

</body>
</html>