<%@page import="lala.com.a.model.FestivalDto"%>
<%@page import="lala.com.a.model.PdsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- bootstrapJS -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<style type="text/css">

.middleImg{ 
	margin-top:60px;
	background-repeat: no-repeat;
 	background-size: 100% 230px; 
	height: 230px;
	opacity: 0.9; 
	background-image: url("<%=request.getContextPath() %>/resources/images/Festival.jpg");
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

<!-- jQuery 기본 ui파일 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
 <!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
 <!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>   
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/resources/css/festivalList.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/festivalList.css"> 
</head>
<body>
<%List<PdsDto> list = (List<PdsDto>)request.getAttribute("list");
FestivalDto dto = (FestivalDto)request.getAttribute("dto");



%>


<%
int pampletSeq = 0;
String pampletBf = "";
String pampletAf = "";
int fileSeq = 0;
for(int i =0;i<list.size();i++){
   PdsDto pdto = list.get(i);
   String CheckId = pdto.getFileName_Af().substring(pdto.getFileName_Af().lastIndexOf("."));   //팜플렛을 판단하기위한 과정
   //확인완료 System.out.println("check Id = "+CheckId);
   if(CheckId.equals(".pdf")||CheckId.equals(".pptx")){ // 만약 pds테이블안에서 팜플렛 파일이라면
      
       pampletSeq = pdto.getSeq();
       pampletBf = pdto.getFileName_Bf();
       pampletAf = pdto.getFileName_Af();
   }
} 
   /* System.out.print("check PampletSeq : "+ pampletSeq);
   System.out.print("check pampletBf : "+ pampletBf);
   System.out.print("check pampletAf : "+ pampletAf); 
   확인완료*/
%>
 



<form action="FestivalUpdateAf.do" enctype="multipart/form-data"  method="post" onsubmit="return nullCheck()">
	<div class="middleAll"><!-- 텍스트랑 이미지묶는거 -->
		<div class="middleImg">
			<h1 class="middleTitle">축제 수정</h1>
		</div>
	</div>
<!-- <img src="resources/images/Festival.jpg" alt="NO Picture" style="width: 100%;height: 330px"> -->
<div style="margin-left: 5%" class="main">
<!-- 상단tag -->


<input type="hidden" value="${login.id }" name="id">
<div class="mainTable" style="width: 90%; margin-left: 9%">
<p class="location-lst" style="margin-left: 5%">
   <span>라라투어</span>
   <span>축제&행사</span> 
   <span>축제&행사 정보</span>
   <span class="active">관리자 글 수정</span> 
</p>
               <!-- <!-- 기존파일보기 ----- -->
   <div class="input-group-prepend " style="margin-left: 5%;">
      <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         ThumbNail기존파일
      </button>
      <div class="dropdown-menu">
         <a class="dropdown-item" name="ThumbnailBf" >
         <h id="thumbNailCheck"><%=dto.getThumbnail()%></h>
         </a>
      </div>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
 
 
       <!-- Pamphlet -->
   <div class="input-group-prepend">
      <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         Pamphlet기존파일
      </button>
      <div class="dropdown-menu">
         <a class="dropdown-item" >
            <h id="pamphletCheck"><%=pampletBf%></h>
         </a>
      </div>
   </div>
  &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
  
  
        <!-- MultiImg -->
   <div class="input-group-prepend">
      <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         MultiFile기존파일
      </button>
      <div class="dropdown-menu">
         <%for(int i =0 ; i<list.size();i++){ %>
            <%PdsDto pdto = list.get(i);
            String CheckId = pdto.getFileName_Af().substring(pdto.getFileName_Af().lastIndexOf("."));   //팜플렛을 판단하기위한 과정
            //확인완료 System.out.println("check Id = "+CheckId);
            if(CheckId.equals(".pdf")||CheckId.equals(".pptx")){ // 만약 pds테이블안에서 팜플렛 파일이라면
            continue;         
            }%>   
            <h id="multiCheck" name="qmultiCheck"><%=pdto.getFileName_Bf()%></h>
            <input type="hidden" name="multi_seq" value="<%=pdto.getSeq()%>">
            <% fileSeq = pdto.getSeq(); %>
            <input type="button" name="delBtn" value="삭제" onclick="detailDelete('<%=fileSeq%>')"><br>
         <%} %>
         </div>
      </div>
   </div>
         
   <div class="input-group mb-3" style="width:70%;margin-left: 5%">
      <div class="input-group-prepend">
         <span class="input-group-text" id="inputGroup-sizing-default">ThumbNail</span>
      </div>
      <input type="file" class="form-control" aria-label="Sizing example input" onchange="checkFile(this)"
      aria-describedby="inputGroup-sizing-default" style="border: 0" name="thumbfile" id="thumbnail">&nbsp;&nbsp;&nbsp;   <!-- Thumbnail -->
      <div class="input-group-prepend">
         <span class="input-group-text" id="inputGroup-sizing-default">Pamplet</span>
      </div>
      <input type="file" class="form-control" aria-label="Sizing example input"  onchange="pcheckFile(this)"
      aria-describedby="inputGroup-sizing-default" style="border: 0" name="pamplet" id="pamplet"> &nbsp;&nbsp;&nbsp;      <!-- Pamphlet -->    
      <div class="input-group-prepend">
         <span class="input-group-text" id="inputGroup-sizing-default">MultiImg</span>
      </div>
      <input type="file" class="form-control" aria-label="Sizing example input" onchange="McheckFile(this)"
      aria-describedby="inputGroup-sizing-default" style="border: 0" multiple="multiple" id="img_multi"  name="img_multi"> <!-- multiImg -->
   </div>
   <div class="input-group mb-3"  style="width: 60%; margin-left: 5%" >
        <div class="input-group-prepend">
          <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             <input name="place" id="place" value="<%=dto.getPlace() %>" style="border: 0"> <!-- place -->
            </button>
             <div class="dropdown-menu">
            <a class="dropdown-item" onclick="place('서울특별시')">서울특별시</a>
             <a class="dropdown-item" onclick="place('경기도')">경기도</a>
               <a class="dropdown-item" onclick="place('강원도')">강원도</a>
             <a class="dropdown-item" onclick="place('충청도')">충청도</a>
             <a class="dropdown-item" onclick="place('전라도')">전라도</a>
            <a class="dropdown-item" onclick="place('경상도')">경상도</a>
            <a class="dropdown-item" onclick="place('제주도')">제주도</a>
            </div>
        </div>
        <input type="text" name="title" id="title" class="form-control"         
       aria-label="Text input with dropdown button" placeholder="제목을 입력하세요" value="<%=dto.getTitle()%>"> <!-- title -->
   </div>
   
   
   <!-- 본문글 content -->

   <textarea rows="27" cols="180" placeholder="본문글을 입력하세요."
    style="margin-left: 5%" name="content" id="content"><%=dto.getContent() %></textarea> <!-- content -->
   
   <!-- 축제기간 -->
   <div class="input-group input-group-sm mb-3" style="width:50%;margin-left: 5%">
      <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroup-sizing-sm">축제기간</span>
         </div>
      <input type="text" class="form-control" aria-label="Sizing example input" readonly="readonly"
         aria-describedby="inputGroup-sizing-default" style="background-image: url(resources/images/search1.png);"
          value="<%=dto.getsDate()%>" id="sDate" name="sDate" <%=dto.getsDate()%>>~               <!-- sdate -->
       
      <input type="text" class="form-control" aria-label="Sizing example input"  readonly="readonly"
       aria-describedby="inputGroup-sizing-default" style="background-image: url(resources/images/search1.png);" 
       value="<%=dto.geteDate() %>" id="eDate" name="eDate" onchange="edateCheck()">               <!-- edate -->
       <input type="hidden" value="admin" name="id">
      <input type="hidden" name="seq" value="<%=dto.getSeq()%>">
      <input type="hidden" name="pampletSeq" value="<%=pampletSeq%>">
      <input type="hidden" name="pampletBf" value="<%=pampletBf%>">
      <input type="hidden" name="ThumbnailBf" value="<%=dto.getThumbnail()%>">
       
       &nbsp;<input type="button" value="뒤로가기" class="btn btn-outline-secondary" onclick="back_(<%=dto.getSeq()%>)">&nbsp;
       &nbsp;<input type="submit" value="글작성" class="btn btn-outline-secondary">
   </div>
</div>
</form>












<%-- 

<form action="FestivalUpdateAf.do" enctype="multipart/form-data"  method="post">

<table style="margin: auto ;" border="1px solid black">
<col width="300"> <col width="500">
<tr>
   <td>썸네일선택 </td>
   <td>   
      <font style="color: balck;font-size: 14px">기존파일</font>&nbsp;&nbsp;&nbsp;
      <input type="text" name="ThumbnailBf" readonly="readonly" value="<%=dto.getThumbnail()%>" style="border:0"><br>
      <input type="file" name="thumbfile" id="_thumbnail" onchange="checkFile(this)">      
   </td>
</tr>

<tr>
   <td>축제홍보 팜플랫</td>
   <td>
      <font style="color: black;font-size: 14px">기존파일</font>&nbsp;&nbsp;&nbsp;
      <input type="text" name="pampletBf" readonly="readonly" value="<%=pampletBf%>" style="border:0"><br>
      <input type="file" name="pamplet" onchange="pcheckFile(this)">
   </td>
</tr>

<tr>
   <td>사진선택 </td>ㅈㅈㅈ
   <td>
   <%for(int i =0 ; i<list.size();i++){ %>
      <%PdsDto pdto = list.get(i);
      String CheckId = pdto.getFileName_Af().substring(pdto.getFileName_Af().lastIndexOf("."));   //팜플렛을 판단하기위한 과정
      //확인완료 System.out.println("check Id = "+CheckId);
      
      if(CheckId.equals(".pdf")||CheckId.equals(".pptx")){ // 만약 pds테이블안에서 팜플렛 파일이라면
      continue;   
      
      
      }%>   
      <font style="color: balck;font-size: 14px">기존파일</font>&nbsp;&nbsp;&nbsp;
      <input type="text" name="img_multi_Bf" readonly="readonly" value="<%=pdto.getFileName_Bf()%>" style="border:0">
      <input type="hidden" name="multi_seq" value="<%=pdto.getSeq()%>">
      <% fileSeq = pdto.getSeq(); %>
      <input type="button" name="delBtn" value="삭제" onclick="detailDelete('<%=fileSeq%>')"><br>
   <%} %>
   
   
      <input type="file" multiple="multiple" name="img_multi" onchange="McheckFile(this)">
   </td>
</tr>


<tr>
   <td>
      축제이름 :
      <select name=place>
          <option value="서울특별시">서울특별시</option>
            <option value="경기도">경기도</option>
            <option value="강원도">강원도</option>
            <option value="충청도">충청도</option>
            <option value="전라도">전라도</option>
            <option value="경상도">경상도</option>
               <option value="제주도">제주도</option>   
      </select>
   </td>
   
   <td>
      <input type="text" placeholder="상세제목을 입력하세요" style=" width: 70%" name="title" value="<%=dto.getTitle()%>">
   </td>   
</tr>

<tr>
   <td>축제기간</td>
   <td>
      <input type="text" id="sDate" name="sDate" value="<%=dto.getsDate()%>"> ~ <input type="text" id="eDate" name="eDate" value="<%=dto.geteDate()%>">  
   </td>
</tr>


<tr>
   <td>내용</td>
   <td>
      <textarea rows="20" cols="50" placeholder="내용을 입력하시오" name="content"><%=dto.getContent() %></textarea>
   </td>   
</tr>


</table>
<input type="hidden" value="admin" name="id">
<input type="hidden" name="seq" value="<%=dto.getSeq()%>">
<input type="hidden" name="pampletSeq" value="<%=pampletSeq%>">
<input type="submit" value="글쓰기">

</form>


 --%>
<script type="text/javascript">


 
$(function() {
    $( "#sDate" ).datepicker({
       showButtonPanel: true,  
        currentText: '오늘 날짜', 
        closeText: '닫기', 
        dateFormat: "yy-mm-dd",
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
             dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             changeMonth: true, 
             changeYear: true,
             nextText: '다음 달',
             prevText: '이전 달',
           
    });
});

$(function() {
    $( "#eDate" ).datepicker({
       showButtonPanel: true,  
        currentText: '오늘 날짜', 
        closeText: '닫기', 
        dateFormat: "yy-mm-dd",
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
             dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             changeMonth: true, 
             changeYear: true,
             nextText: '다음 달',
             prevText: '이전 달' 
             
    });
}); 

/* $(function(){
   $("[name='delBtn']").click(function(){
      var isS = confirm("삭제하시겠습니까?");      
      if(isS){
         $("#frm_").submit();
      }
   });
}); */

function detailDelete( seq ){
   var isS = confirm("삭제하시겠습니까?");
   if(isS){
      $.ajax({
         type:"post",
         url:"detailDel.do?seq="+seq,      
         async:true,
         success:function(msg){      
            if(msg=="isS"){
               alert("삭제되었습니다.");
               location.reload();
            }
                  
         },
         error:function(){
            alert("error");   
         }      
      });
   }
}

function checkFile(f){
   var   file =f.files
   if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name))
      alert('이미지 파일만 선택해 주세요.\n현재 파일 : ' + file[0].name);
   else return;
   f.outerHTML = f.outerHTML;
}

function pcheckFile(f){
   var   file =f.files
   if(!/\.(pdf|pptx)$/i.test(file[0].name))
      alert('pdf 파일만 선택해 주세요.\n현재 파일 : ' + file[0].name);
   else return;
   f.outerHTML = f.outerHTML;
}

function McheckFile(f){
   var   file =f.files;
   
   for (var j = 0; j < file.length; j++) {
      if(!/\.(gif|jpg|jpeg|png)$/i.test(file[j].name)){
      alert('이미지 파일만 선택해 주세요.\n문제 파일 : ' + file[j].name);         
         f.outerHTML = f.outerHTML;    
      }else{      
      }
   }
}

function place( p ){
   
   $("#place").val(p);
}


 function nullCheck(){
    

    
    
    var len = $("[name='qmultiCheck']").length;
     var mlen =$("#img_multi").val();

   if(len==0&&mlen==''){
      alert("MultiFile을 한개이상 업로드하세요.")
      return false;
   }
   if($("#title").val()==''){
      alert("제목을 입력하세요");
      return false;
   }
   if($("#content").val().trim()==''){
      alert("내용을 입력하세요");
      return false;
   }
   if($("#sDate").val()==""){
      alert("시작일을 입력하세요")
      return false;
   }
   if($("#eDate").val()==""){
      alert("마감일을 입력하세요")
      return false;
   }
    
       
   return true;
   
   }
   
function edateCheck(){
   
var sdate=$("#sDate").val();
var edate=$("#eDate").val();

if(sdate>edate){
   alert("마감일이 시작일보다 빠릅니다.");
   $("#sDate").val("");
   edate=$("#eDate").val("");
   }
}

function back_(seq){
   location.href="festivalDetail.do?seq="+seq;
}

</script>



</body>
</html>