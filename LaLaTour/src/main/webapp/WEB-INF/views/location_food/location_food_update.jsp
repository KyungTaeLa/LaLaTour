<%@page import="lala.com.a.model.PdsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/list.css">
<style>
table {
 border-bottom: 1px solid #ddd;
   margin: auto;
}
th, td {
  border-bottom: 1px solid #ddd;
    padding-top: 10px;
    padding-bottom: 10px;
}


select {
width: 200px;
padding: .8em .5em;
border: 1px solid #999;
font-family: inherit;
background: url('<%=request.getContextPath()%>/resources/images/arrow.jpg') no-repeat 95% 50%;
border-radius: 0px;
-webkit-appearance: none;
-moz-appearance: none;
appearance: none;
}

.ac a {
  link :  color: white; text-decoration: none;
  visited:  color: black; text-decoration: none;
  hover : color: blue; 
}

.gota {
   margin-left: 15%;
   border: 0;
}


</style>
<style type="text/css">
.Ofile{
   display: none;
}
.Cfile{
   display: none;
}
.middleImg{ 
margin-top:60px;
	background-image: url("<%=request.getContextPath()%>/resources/images/loc_E.png");
	background-repeat: no-repeat;
 	background-size: 100% 230px; 
	height: 230px;
	opacity: 0.9; 
}
.middleTitle{
	color: black;
	text-align: center;
padding-top: 85px;
font-size: 45px;

}
.middleAll{
margin-top: 100px;
}

</style>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/loc_fileup.css">
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/loc_button.css">
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/loclist_btn.css">
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/Location_list.css">
<script type="text/javascript"
   src="<%=request.getContextPath()%>/resources/js/loc_select.js"></script>
   <script type="text/javascript"
   src="<%=request.getContextPath()%>/resources/js/loc_fileup.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/loc_checkbox.css">


   <div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
<div class="middleImg">
<h1 class="middleTitle">명소</h1>
</div>
</div>
<br>
<table class="gota">
<tr>
  <td>
     <a class="black-text" href="location_attrac.do">지역명소</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="location_food.do" class="black-text">음식점</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="location_shop.do" class="black-text">쇼핑</a>
  </td>
 </tr>
</table>
<br>
<h1 style="margin-left: 15%;border: 2px;">글 수정 </h1>
<div style=" background-color: gray; width:1250px; margin:auto ; border : 1px solid gray"></div>

<form id="wfrm" enctype="multipart/form-data" action="location_food_updateAf.do?seq=${attupdate.seq }&subname=${attupdate.subname }" method="post" onsubmit="return sub()">
<table id="writeT">
<tr>
   <th>제목 : </th>
   <td>
      <input type="text" id="wtitle" name="title" style="border: 0; width: 500px; height: 30px;" value="${attupdate.title }">
   </td>
</tr>

<tr>
   <th>아이디 : </th>
   <td>
      <input type="text" id="wid" name="id" style="border: 0; width: 200px; height: 30px;font-size: 16px;" value="${attupdate.id }" readonly="readonly">
   </td>
</tr>

<tr>
   <th>지역</th>
   <td>
      <select id="place1" name="choice">
         <option value="서울특별시">서울특별시</option>
           <option value="경기도">경기도</option>
            <option value="강원도">강원도</option>
            <option value="충청도">충청도</option>
            <option value="전라도">전라도</option>
            <option value="경상도">경상도</option>
            <option value="제주도">제주도</option>
      </select>
   </td>
</tr>

<tr>
   <th>상세주소 : </th>
      <td>
         <input type="text" id="place2" style="border: 0; width: 500px; height: 30px;font-size: 16px;">
         <input type="hidden" id="_place" name="place" size="60">
         
      </td>
   
</tr>

   <c:forEach items="${pdslist }" var="pds" varStatus="staus">
   <tr>
   <th>원본 파일 : </th>
   <td>
      <input type="hidden" id="pdsseq" value="${pds.seq}">
      <%-- <input type="text" id="bfile" name="bfile" value="${pds.fileName_Bf }" readonly="readonly"> --%>
      <img alt="이미지없음" src="<%=request.getContextPath()%>/upload/${pds.fileName_Af }" style="width: 200px;height: 200px;">
<%--       <button type="button" id="dbtn" onclick="_deleteFile( '${pds.seq}' )">삭제</button> --%>
      <%-- <button type="button" id="dbtn" onclick="_deleteFile( this )" value="${pds.seq}">삭제</button> --%>
         <%-- <input type="checkbox" value="${pds.seq }" name="delPds">삭제 --%>
         <div class="checks etrans">
              <input type="checkbox" id="ex_chk3${pds.seq }" name="delPds" value="${pds.seq }"> 
              <label for="ex_chk3${pds.seq }">삭제</label> 
         </div>
      
   </td>
   </tr>
   </c:forEach>
   
   <tr>
      <th>파일 : </th>
      <td>
         <div class="filebox bs3-primary preview-image">
         <input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
         <label for="wlFiles">업로드</label>
         <input multiple="multiple" type="file" id="wlFiles" name="lFiles" class="upload-hidden">
         </div>
      </td>
   </tr>
   
<tr class="Ofile">
   <th>썸네일 원본 : </th>
   <td><img alt="이미지없음"  src="<%=request.getContextPath()%>/upload/${attupdate.thumbnail }" style="width: 200px;height: 200px;"> 
       <input type="hidden" id="tum" name="OUlThum" value="${attupdate.thumbnail }" > 
      <%-- <img alt="이미지없음" src="<%=request.getContextPath()%>/upload/${attupdate.thumbnail }" id="tum" name="OUlThum"> --%>
      <input type="button" name="changefile"  onclick="changeT()" id="changefile" class="myButton5" value="변경">
   </td>
</tr>

<tr class="Cfile">
   <th>썸네일 파일 : </th>
   <td>
      <div class="filebox bs3-primary preview-image">
      <input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
      <label for="wlThum">업로드</label> 
      <input type="file" id="wlThum" name="lThum" class="upload-hidden">
      <button type="button" id="esc()" class="myButton4" onclick="esc()">취소</button>
      </div>
   </td>
</tr>

<!-- <tr>
   <th>썸네일 : </th>
   <td>
      <input type="file" id="wlThum" name="lThum" >
   </td>
</tr> -->

<tr>
   <th>내용 : </th>
   <td>
      <textarea rows="40" cols="100" id="wcontent" style="resize: none;" name="content">${attupdate.content }</textarea>
   </td>
</tr>



<tr>
   <td>
      <input type="hidden" name="pseq" value="${attupdate.seq }">
      <input type="submit" id="wrtiebtn" class="button" value="저장">
   </td>
</tr>



</table>

<script>
function changeT() {
   $(".Ofile").hide();
   $(".Cfile").show();
}

function esc() {
   $(".Ofile").show();
   $(".Cfile").hide();
   $("#wlThum").val("");
}

function sub() {
   
   var p1 = $("#place1").prop("selected",true).val();
   var p2 = $("#place2").val();
   var p = p1 + "/" + p2;
   
   if(p1 != null && p2 != null) {
      
      $("#_place").val(p);
   }else {
      alert("실패");
   }
   
   if($("#wid").val().trim() == null || $("#wid").val().trim() == "") {
      alert("로그인 후 이용해주세요.");
      return false;
   }else if($("#wtitle").val().trim() == null || $("#wtitle").val().trim() == "") {
      alert("제목을 입력해 주세요.");
      return false;
   }else if($("#wcontent").val().trim() == null || $("#wcontent").val().trim() == "") {
      alert("내용을 입력해 주세요.");
      return false;
   }else if($("#place2").val().trim() == null || $("#place2").val().trim() == "") {
      alert("상세주소를 입력해 주세요.");
      return false;
   }
   
   var chk = 0;
   $('input:checkbox[name="delPds"]').each(function() {
      
      
       if(this.checked){//checked 처리된 항목의 값
            chk += 1;
       }
   });
   
   var chkPoint = $("input[name='delPds']").length;
   if(chk == chkPoint){
      if(( $("#wlFiles").val() == "" || $("#wlFiles").val() == null)){
         alert("사진을 하나이상 첨부해주세요");
         return false;
      }
   }
   
   return true;
}


   
   $(document).ready(function () {
       var place = "${attupdate.place}";
      
      var pIndex = place.indexOf("/");
      place1 = place.substr(0,pIndex);
      
      
      place2 = place.substr(pIndex+1);
      $(".Ofile").show();
      $("#place1").prop("selected",true).val(place1);
      $("#place2").val(place2);

   });
   

 /* function _deleteFile( obj ) {
   var str = $("#bfile").val();
   alert("function :" + obj.value);

   $.ajax ({
      url : "location_attrac_Filedelete.do",
      type:"post",
      //dataType:"text",
      data: {seq: obj.value},
         
      success:function(data){
         alert("성공");
         location.reload();
        }, error:function(r, s, err) {
         alert("실패");
         alert("r = " + r + ", s = " + s + ", err = " + err);
        }
   }); */

/* function _deleteFile( seq ) {
   //alert("tlqkf");
} */

$('#wlThum')
.change(
      function() {
         const target = document.getElementsByName('lThum');

         var html = '';
         $
               .each(
                     target[0].files,
                     function(index, file) {

                        const fileName = file.name;
                        const fileEx = fileName.slice(
                              fileName.indexOf(".") + 1)
                              .toLowerCase();
                        if (fileEx != "jpg"
                              && fileEx != "png"
                              && fileEx != "gif"
                              && fileEx != "bmp"
                              && fileEx != "wmv"
                              && fileEx != "mp4"
                              && fileEx != "avi") {

                           alert("파일은 (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.");

                           $("#wlThum").val("");
                           return false;
                        }
                     });
      });

$('#wlFiles')
.change(
      function() {
         const target = document.getElementsByName('lFiles');

         var html = '';
         $
               .each(
                     target[0].files,
                     function(index, file) {

                        const fileName = file.name;
                        const fileEx = fileName.slice(
                              fileName.indexOf(".") + 1)
                              .toLowerCase();
                        if (fileEx != "jpg"
                              && fileEx != "png"
                              && fileEx != "gif"
                              && fileEx != "bmp"
                              && fileEx != "wmv"
                              && fileEx != "mp4"
                              && fileEx != "avi") {

                           alert("파일은 (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.");

                           $("#wlFiles").val("");
                           return false;
                        }
                     });
      });


</script>
</form>
