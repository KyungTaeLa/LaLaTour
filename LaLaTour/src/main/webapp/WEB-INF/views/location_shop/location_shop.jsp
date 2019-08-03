<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/Location_list.css">
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/list.css">
   <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/list.js"></script>
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/loclist_btn.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/loc_select.js"></script>

<style>

select {
width: 100px;
padding: .6em .3em;
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
}

middleImg{ 
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
<br>

<table class="gota">
<tr>
  <td>
     <a class="black-text" href="location_attrac.do">지역명소</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="location_food.do" class="black-text">음식점</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="location_shop.do" class="black-text">쇼핑</a>
  </td>
 </tr>
</table>

<br>

<!-- <form action="location_attrac_selectlist.do"> -->
<div>
   <table class="st">
      <tr>
         <td style="padding-left: 5px">
         <div style="margin: auto;">
         <select name="choice" id="choice">
               <option value="title">제목</option>
               <option value="content">내용</option>
               <option value="place">주소</option>
         </select>
         </div>
         </td>
         <td style="padding-left: 5px"><input type="text" name="findWord"
            id="findWord" value="${paging.findWord }" style="width: 200px;height: 40px;">
         </td>
         <br>
         <td style="padding-left: 5px"><span class="button blue">
               <button type="submit" id="_btnSearch" onclick="_btnSearch()">검색</button>
         </span></td>
         <td>
            <c:if test="${login ne null &&  login.auth eq '1'}">
            <button type="button" id="wbtn" class="blue" onclick="gowrite()">글쓰기</button>
            </c:if>
         </td>
      </tr>
   </table>
</div>

<br>
   <hr style="border: solid 1px gray; margin-left: 15%;margin-right: 15%;">
   <br>

   
   <form id="attfrm" name="_attfrm">
      <input type="hidden" name="subname" value="food">

   <table class="lt">
      <tr>
         
         <c:forEach items="${attrlist }" var="attr" varStatus="status">
            <c:if test="${attr.del eq 0 }">
            <td>
               <figure class="snip1382">

                  <a class="ac" href="location_shop_detail.do?seq=${attr.seq }"> <img
                     alt="이미지없음"
                     src="<%=request.getContextPath() %>/upload/${attr.thumbnail }"
                     style="width: 260px; height: 260px" class="img-fluid "
                     alt="smaple image">
                     <figcaption>
                        <p class="white-text">${attr.title }</p>
                        
                        <hr>
                        <div class="icons">
                           <p class="white-text">${attr.place }</p>
                        </div>
                     </figcaption>
                     </a>
               </figure>
               </td>
               <c:if test="${status.count%3==0 }">
            
      </tr>
      <tr>
         </c:if>

         </c:if>
         </c:forEach>
      </tr>
      
      <tr>
            <td><input type="hidden" id="loginid" value="${login.id }">
               <input type="hidden" id="loginidauth" value="${login.auth }">
               </td>
         </tr>
   </table>
</form>


   <!-- 페이징 처리 -->
   <jsp:include page="paging.jsp">
      <jsp:param name="actionPath" value="location_shop.do" />
      <jsp:param name="nowPage" value="${paging.nowPage }" />
      <jsp:param name="totalCount" value="${paging.totalCount }" />
      <jsp:param name="countPerPage" value="${paging.countPerPage }" />
      <jsp:param name="blockCount" value="${paging.blockCount }" />

      <jsp:param name="findWord" value="${paging.findWord }" />
      <jsp:param name="choice" value="${paging.choice }" />

   </jsp:include>
</div>


<script type="text/javascript">
   function gowrite() {
      /* if ($("#loginid").val().trim() == null) {
         alert("로그인 후 이용해 주세요.");
         return false;
      } else if ($("#loginid").val().trim() != null
            && $("#loginid auth").val() != 1) {
         alert("관리자만 글 작성이 가능합니다.");
         return false;
      } else {

         
      } */
      
      location.href = "location_shop_write.do";
      
   }

   $(document).ready(function() {
      $("#choice").val('${paging.choice}').prop("selected", true);
   });

   function _btnSearch() {
      
      var findWord = $("#findWord").val();
      var choice = $("#choice").prop("selected", true).val();

      location.href = "location_shop.do?findWord=" + findWord + "&choice=" + choice;
   }
   

</script>
</script>