<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/loc_fileup.css">
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/loc_button.css">
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/loclist_btn.css">
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/list.css">
   <link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/Location_list.css">
<script type="text/javascript"
   src="<%=request.getContextPath()%>/resources/js/loc_select.js"></script>
   <script type="text/javascript"
   src="<%=request.getContextPath()%>/resources/js/loc_fileup.js"></script>
   
<style>
   table {
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
   border: 0px;
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


   <div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
<div class="middleImg">
<h1 class="middleTitle">명소</h1>
</div>
</div>

<br>
<!-- <table class="gota" style="border: 0;">
<tr>
  <td> -->
     <div class="gota">
     <a class="black-text" href="location_attrac.do">지역명소</a>&nbsp;&nbsp;&nbsp;<a href="location_food.do" class="black-text">음식점</a>&nbsp;&nbsp;&nbsp;<a href="location_shop.do" class="black-text">쇼핑</a>
     </div>
<!--   </td>
 </tr>
</table> -->
<br>
<h1 style="margin-left: 15%;border: 2px;">글 쓰기 </h1>
<div style=" background-color: gray; width:1250px; margin:auto ; border : 1px solid gray"></div>

<form id="wfrm" enctype="multipart/form-data"
   action="location_food_writeAf.do" method="post"
   onsubmit="return sub()">
   <table id="writeT">
      <tr>
         <th>제목:</th>
         <td><input type="text" id="wtitle" name="title" style="border: 0; width: 500px; height: 30px;">
         </td>
      </tr>

      <tr>
         <th scope="row">아이디 :  </th>
         <td><input type="text" id="wid" name="id" style="border: 0; width: 200px; height: 30px;font-size: 16px;"
            value="${login.id }" readonly="readonly"></td>
      </tr>

      <tr>
         <th scope="row">지역 :</th>
         <td>
      <select id="wchoice" name="choice">
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
   <th scope="row">상세주소 : </th>
      <td>
         <input type="text" id="detadr"  style="border: 0; width: 500px; height: 30px;font-size: 16px;">
         <input type="hidden" id="_place" name="place" size="60">
         
      </td>
   
</tr>


<tr>

   <th scope="row">파일 : </th>
   <td>
   <div class="filebox bs3-primary preview-image">
    <input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">

    <label for="input_file">업로드</label> 
    <input type="file" id="input_file" multiple="multiple" class="upload-hidden" name="lFiles" > 
</div>
<!-- 
       <input class="upload-name" value="파일선택" disabled="disabled"><label for="wlFiles">업로드</label> 
      <input class="upload-name" multiple="multiple" type="file" id="wlFiles" name="lFiles" style="display: none;">
    -->
   </td>
   </div>
</tr>

<tr>
   <th scope="row">썸네일 : </th>
   <td>
      <div class="filebox bs3-primary preview-image">
       <input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
       <label for="wlThum">업로드</label> 
      <input type="file" name="lThum" id="wlThum" class="upload-hidden">
      </div>
   </td>
</tr>

<tr>
   <th>내용 : </th>
   <td>
      <textarea rows="40" cols="100" name="content" id="wcontent" style="resize: none;"></textarea>
   </td>
</tr>



<tr>
   <td style="text-align: right;">
      <input type="submit" class="button" id="wrtiebtn" value="저장">
   </td>
</tr>



</table>

<script>
   function sub() {
      
      if ($("#wid").val().trim() == null || $("#wid").val().trim() == "") {
         alert("로그인 후 이용해주세요.");
         return false;
      } else if ($("#wtitle").val().trim() == null
            || $("#wtitle").val().trim() == "") {
         alert("제목을 입력해 주세요.");
         return false;
      } else if ($("#wcontent").val().trim() == null
            || $("#wcontent").val().trim() == "") {
         alert("내용을 입력해 주세요.");
         return false;
      } else if ($("#detadr").val().trim() == null
            || $("#detadr").val().trim() == "") {
         alert("상세주소를 입력해 주세요.");
         return false;
      } else if ($("#input_file").val().trim() == null
            || $("#input_file").val().trim() == "") {
         alert("사진을 첨부해 주세요.");
         return false;
      } else if ($("#wlThum").val().trim() == null
            || $("#wlThum").val().trim() == "") {
         alert("썸네일을 첨부해 주세요.");
         return false;
      } 
      
         var p1 = $("#wchoice").prop("selected", true).val();
         var p2 = $("#detadr").val();
         var p = p1 + "/" + p2;
         
         
         if (p1 != null && p2 != null) {
            
            $("#_place").val(p);
         } else {
            alert("실패");
         }
         aelrt("p : " + p);
         return true;
      
   }

$('#wlThum').change(function(){
      
      const target = document.getElementsByName('lThum');
              
      var html = '';
      $.each(target[0].files, function(index, file){
         
          const fileName = file.name;
          const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
          if(fileEx != "jpg" && fileEx != "png" &&  fileEx != "gif" &&  fileEx != "bmp" && 
                fileEx != "wmv" && fileEx != "mp4" && fileEx != "avi"){
             
              alert("파일은 (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.");

            $("#wlThum").val("");
              return false;
          }
       });
   });
   
$('#input_file').change(function(){
      
      const target = document.getElementsByName('lFiles');
              
      var html = '';
      $.each(target[0].files, function(index, file){
         
          const fileName = file.name;
          const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
          if(fileEx != "jpg" && fileEx != "png" &&  fileEx != "gif" &&  fileEx != "bmp" && 
                fileEx != "wmv" && fileEx != "mp4" && fileEx != "avi"){
             
              alert("파일은 (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.");

            $("#input_file").val("");
              return false;
          }
       });
   });


</script>
</form>
