
<%@page import="lala.com.a.model.HotelDto"%>
<%@page import="lala.com.a.model.MemberDto"%>
<%@page import="lala.com.a.util.pagingBean"%>
<%@page import="lala.com.a.model.ReplyDto"%>
<%@page import="java.util.List"%>
<%@page import="lala.com.a.model.PdsDto"%>
<%@page import="lala.com.a.model.FestivalDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<style type="text/css">
bx-wrapper,
.bx-viewport,
.bx-wrapper img {
    width:100%;
    height:600px !important;
} 
.fDetail_all {
    position: relative;
    width: 100%;
    max-width: 1500px;
    /* margin: 0 auto; */
    padding: 0px 50px;
    min-height: 500px;
    margin:0 7%;
}

.fDetail_all .fDetail_left {
    position: relative;
    width: 800px;
    float: left;
    padding-right: 70px;
}

.fDetail_all .fDetail_right {
    width: 320px;
    float: right;
    padding-top: 30px;
}

.fDetail_all .fDetail_right .detail-box {
    position: relative;
    width: 100%;
    height: 60px;
    background-color: #333;
}

.fDetail_all .fDetail_right .detail-box span {
    position: absolute;
    left: 10px;
    bottom: 5px;
    z-index: 1;
    font-size: 25px;
    color: #fff;
}
.fDetail_all .fDetail_right .right_content_inner {
    position: relative;
    padding: 0px 10px;
}
.fDetail_all .fDetail_right .right_content_inner .detail-type dt {
    font-size: 14px;
    color: #333333;
    font-weight: 600;
}
.fDetail_all .fDetail_right .right_content_inner .detail-type dd {
	position: relative;
    margin-top: 10px;
    font-size: 14px;
    color: #555555;
    line-height: 18px;
    /* height: 100%; */
    font-weight: 300;
} 
.reply-div{
background-color: #f2f2f2;
border-radius: 25px;
border: 2px solid #f2f2f2;
width: 1300px;
padding: 50px;
margin:0 15% 0 15%;

}


</style>

 <!-- img slide Link -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/festivalDetail.css"> 

</head>

<body>


<%FestivalDto dto = (FestivalDto)request.getAttribute("dto"); 
List<PdsDto> list = (List<PdsDto>)request.getAttribute("list");
List<ReplyDto> rList = (List<ReplyDto>)request.getAttribute("rList");
List<HotelDto> hList = (List<HotelDto>)request.getAttribute("hList");
System.out.println("JSPJSPJSP");
pagingBean paging = (pagingBean)request.getAttribute("paging");
Object ologin = session.getAttribute("login");
MemberDto member = null;
String id = "";//nullpoint 방지
int auth = -1; //nullpoint 방지
if(ologin != null) {
	  member = (MemberDto)ologin;
	  id = member.getId();
	  auth = member.getAuth();
}

int pampletSeq = 0;
String pampletBf ="";
String pampletAf ="";

%>
<!-- 확인완료 -->
<%-- <h3><%=dto.toString() %></h3> --%>
<%for(int i =0;i<list.size();i++){
	PdsDto pdto = list.get(i);
	String CheckId = pdto.getFileName_Af().substring(pdto.getFileName_Af().lastIndexOf("."));	//팜플렛을 판단하기위한 과정
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

<div style="width: 75%;margin-left: 130px;margin-top:90px" >
	<ul class="bxslider" style="height: 1500px">
		<%for(int i =0; i<list.size();i++){ 
		PdsDto pdsdto = list.get(i);		
 		if(i==0){
			continue;
		} 
		%>
		<li>
			<img alt="사진없음" src="<%=request.getContextPath()%>/upload/<%=pdsdto.getFileName_Af()%>" title="">
			
		</li>
		
		<%} %>
	</ul>	
</div>

<div class="fDetail_all">
<p class="location-lst" style="margin-left: 5%">
	<span>라라투어</span>
	<span>축제&행사</span> 
	<span class="active">축제&행사 정보</span> 
</p>
	 <!-- left content -->
	<div class="fDetail_left" style="margin-left: 100px;width: 900px" >
		<h4>기본정보</h4>
		<pre><%=dto.getContent() %></pre>
	</div>

	
	<!-- right Content -->
	<div class="fDetail_right">
		<div class="aside" style="width: auto; top: auto; height: 202px; bottom: 50px;"><!-- scroll fixed 추가 -->
			<div class="detail-box">
				<span style="margin-left: 30%">상세정보</span>		
		</div>
					<div class="right_content_inner">
						<dl class="detail-type">
							<dt > 축제기간 </dt>
							<dd >
								<%=dto.getsDate()%> ~ <%=dto.geteDate() %>
							</dd>
						</dl>
						<dl class="detail-type">
							<dt> 장소 </dt>
							<dd>
								<%=dto.getPlace()%> <%=dto.getTitle() %>
							</dd>
						</dl>
						<dl class="detail-type">
							<dt> 축제 소개 팜플렛 다운로드 </dt>
							<dd>
								<form action="PampletDown.do" method="post">
									<input type="hidden" name="pampletBf" value="<%=pampletBf%>">
									<input type="hidden" name="pampletAf" value="<%=pampletAf%>">
									<input type="hidden" name="pampletSeq" value="<%=pampletSeq%>">
									<input type="submit" value="파일다운로드">&nbsp;&nbsp;
									<br>
								</form>
							</dd>
						</dl>
						
						<dl class="detail-type">
							<dt> 해당 축제 평점 </dt>
							<dd>
										<%if(dto.getScore()>4.5){ %>
			<img src="resources/images/star/star_5.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=dto.getScore()%>
		<%}else if(dto.getScore()>4){ %>
			<img src="resources/images/star/star_4.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=dto.getScore()%>
		<%}else if(dto.getScore()>3.5){ %>
			<img src="resources/images/star/star_4.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=dto.getScore()%>
		<%}else if(dto.getScore()>3){ %>
			<img src="resources/images/star/star_3.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=dto.getScore()%>
		<%}else if(dto.getScore()>2.5){ %>
			<img src="resources/images/star/star_3.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=dto.getScore()%>
		<%}else if(dto.getScore()>2.0){ %>
			<img src="resources/images/star/star_2.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=dto.getScore()%>
		<%}else if((dto.getScore()>1.5)){ %>
			<img src="resources/images/star/star_2.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=dto.getScore()%>
		<%}else if((dto.getScore()>1.5)){ %>
			<img src="resources/images/star/star_1.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=dto.getScore()%>
		<%}else if (dto.getScore()>1.0){ %>
			<img src="resources/images/star/star_1.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=dto.getScore()%>
		<%}else if(dto.getScore()>0.5){ %>
			<img src="resources/images/star/star_1.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=dto.getScore()%>
		<%}else if(dto.getScore()>0){ %>
			<img src="resources/images/star/star_1.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=dto.getScore()%>
		<%}else{ %>
			작성된 후기가 없습니다.
		<%} %>
							</dd>
						</dl>
						
						<dl class="detail-type">
							<dt > 축제 후기</dt>
							<dd>
							<%if(member!=null){ %>
								<a href=# onclick="fReviewWrite()">리뷰 쓰기</a>
								<%} %>
								
								<a href=# onclick="goReviewList('<%=dto.getTitle()%>','<%=dto.getPlace()%>')">리뷰 보기</a>
							</dd>
						</dl>
						
						
						<dl class="detail-type">
						<c:if test="${login.auth eq 1 }">
							<dt> 관리자 메뉴</dt>
							<dd>
								<!-- <input type="button" id="festivalDelete" value="삭제"> -->
								<a href="#" id="festivalDelete">삭제</a>&nbsp;&nbsp;
								<a href="#" id="festivalUpdate">수정</a>

							</dd>
						</c:if>
						</dl>

					</div>
			</div>		
	</div>
</div>

<!-- 글삭제 폼 -->
<form action="festivalDelete.do" id="_festivalDelete" method="post">
	<input type="hidden" name="seq" value="<%=dto.getSeq()%>">
	<input type="hidden" name="id" value="<%=dto.getId() %>">
</form>
<br><br><br><br><br>


<%if(hList==null||hList.size()==0){ 
%>
<script>

</script>
<%}else{ %>



<!-- 관리자 추천 호텔목록 -->
<div class="reply-div" style="display: inline-block;">
<a href="" style="margin-left: 30%">[<%=dto.getPlace() %>]에 있는 고객 만족도가 높은 관리자 추천 호텔입니다.</a>
	<div class="reply-list">
	<div class="container-inner">
		<ul class="lst-type-card  active">
	<%for(int i =0;i<hList.size();i++){ 
		if(i==3){
			break;
		}
	%>
				<li>
					<a href="hoteldetail.do?seq=<%=hList.get(i).getSeq()%>">
						<div class="img-cont">
							<img src="<%=request.getContextPath()%>/upload/<%=hList.get(i).getThumbnail()%>" alt="">
						</div>
						<div class="lst-infor-wrap">
							<div class="lst-infor-title"><%=hList.get(i).getTitle() %></div>
							<div class="lst-infor-text">
								<div class="lst-infor-text-inner"><%=hList.get(i).getPlace() %></div>
									<%if(hList.get(i).getGrade()>4.5){ %>
									<img src="resources/images/star/star_5.0.png" style="width:100px; height:20px; alt="NO Picture"><%=hList.get(i).getGrade()%>
								<%}else if(hList.get(i).getGrade()>4){ %>
									<img src="resources/images/star/star_4.5.png" style="width:100px; height:20px; alt="NO Picture"><%=hList.get(i).getGrade()%>
								<%}else if(hList.get(i).getGrade()>3.5){ %>
									<img src="resources/images/star/star_4.0.png" style="width:100px; height:20px; alt="NO Picture"><%=hList.get(i).getGrade()%>
								<%}else if(hList.get(i).getGrade()>3){ %>
									<img src="resources/images/star/star_3.5.png" style="width:100px; height:20px; alt="NO Picture"><%=hList.get(i).getGrade()%>
								<%}else if(hList.get(i).getGrade()>2.5){ %>
									<img src="resources/images/star/star_3.0.png" style="width:100px; height:20px; alt="NO Picture"><%=hList.get(i).getGrade()%>
								<%}else if(hList.get(i).getGrade()>2.0){ %>
									<img src="resources/images/star/star_2.5.png" style="width:100px; height:20px; alt="NO Picture"><%=hList.get(i).getGrade()%>
								<%}else if(hList.get(i).getGrade()>1.5){ %>
									<img src="resources/images/star/star_2.0.png" style="width:100px; height:20px; alt="NO Picture"><%=hList.get(i).getGrade()%>
								<%}else if(hList.get(i).getGrade()>1.0){ %>
									<img src="resources/images/star/star_1.5.png" style="width:100px; height:20px; alt="NO Picture"><%=hList.get(i).getGrade()%>
								<%}else if(hList.get(i).getGrade()>0.5){ %>
									<img src="resources/images/star/star_1.0.png" style="width:100px; height:20px; alt="NO Picture"><%=hList.get(i).getGrade()%>
								<%}else{ %>
									<img src="resources/images/star/star_0.5.png" style="width:100px; height:20px; alt="NO Picture"><%=hList.get(i).getGrade()%>
								<%}%>
								
							
							</div>
							<div class="lst-infor-link" style="height: 35px">
								자세히 보기
							</div>
						</div>
						<div class="ico-arrow"><span></span></div>
					</a>
	<%} %>
				</li>
			</ul>
		</div>
	</div>

</div>
<%} %>

	<!-- 댓글 리스트 -->
<div>
<hr style="width:95%" style="display: inline-block;">
<div class="reply-div" style="display: inline-block;">
	<div class="reply-list">
	<%System.out.println("list.size"+rList.size()); %>
		<%if(rList==null||rList.size()==0){ %>
			작성된 댓글이 없습니다.
		<%}%>	
		
	
		<form action="" id="replyfrm" name="replyfrm" method="post">

			<table>
			<col width="190"><col width="400"><col width="150"><col width="80"><col width="50">
				<%for(int i =0;i<rList.size();i++){ 
					ReplyDto rdto = rList.get(i);
					String wdate = rdto.getWdate().substring(0, 16);		
					
				%>
				<tr>
					<td>	<!-- 아이디부분 -->
						<%if(rdto.getStep()>0) {%>
							<img alt="이미지없음" src="<%=request.getContextPath() %>/resources/images/enter.png">
						<%
						}
						%>
						<%=rdto.getId() %>
						<input type="hidden" name="id" id="id_" value="<%=rdto.getId() %>"
						style="background-color: #f2f2f2;border: 0;"> 
					</td>
			
					<td id="mainContent<%=rdto.getSeq()%>" class="showClass">
						<%=rdto.getContent().trim() %>					
					</td>						
						<!-- 댓글수정 입력창 숨김 -->
					<td style="display: none;" id="hiddenContent<%=rdto.getSeq()%>" class="hiddenClass">
						<textarea rows="4" cols="80" id="hiddenContent_<%=rdto.getSeq()%>"><%=rdto.getContent().trim() %></textarea>
					</td>
			
					<td id="asnwerUpAndDel<%=rdto.getSeq()%>" class="showClass">
						<%=wdate %>
					</td>
					
					<!-- 댓글 수정취소 숨김버튼 -->
					<td id="asnwerUp<%=rdto.getSeq()%>" style="display: none;" class="hiddenClass">
						<a onclick="answerUpdate(<%=rdto.getSeq()%>,<%=rdto.getPseq()%>)">수정하기</a>
					</td>
					<%if(ologin!=null){ %>
					<td id="asnwerUpAndDel2<%=rdto.getSeq()%>" class="showClass">
						<a onclick="answer(<%=rdto.getSeq()%>)" >답글</a>
					<%} %>
						
						<%if(id.trim().equals(rdto.getId().trim())|| auth==1){ %>
							<a onclick="answerDel(<%=rdto.getSeq()%>,<%=rdto.getPseq() %>)">삭제</a>
						<%} %>
						

					</td>
			
						<!-- 댓글 수정 수정취소버튼 -->
					<td id="answerBackTd<%=rdto.getSeq()%>" style="display: none;" class="hiddenClass">
						<a onclick="answerBack(<%=rdto.getSeq() %>)" >수정취소</a>
					</td>
					
					
					<%if(id.trim().equals(rdto.getId())){ %>
					<td id="replyUpdateButton<%=rdto.getSeq()%>" class="showClass">
						<input type="button" onclick="replyUpdate(<%=rdto.getSeq() %>)" value="수정">
					</td>
					<%} %>
		
				</tr>
				<!-- 숨김-->
				<tr id="hidden<%=rdto.getSeq()%>" style="display: none;" class="delTr">
					<td>
						<!-- 아이디에 세션넣기 -->
						<img alt="이미지없음" src="<%=request.getContextPath() %>/resources/images/enter.png">
					</td>
					<td>
						 <textarea rows="4" cols="80" placeholder="답글을 입력하세요" 
						 id="content<%=rdto.getSeq() %>" 
						 class="delContent"></textarea>						 
					</td>
					<td>
						

						<input type="button" onclick="answerWrite(<%=rdto.getSeq() %>,<%=rdto.getPseq() %>)" value="작성">
					</td>
					<td>
						<input type="button" value="취소" onclick="answerBack_()">
												
					</td>
					
				</tr>

				<%} %>
			
				
			</table>
			</form>	

	</div>

<br><br>
	<!-- page include------------------>
		<jsp:include page="paging.jsp">
			<jsp:param name="actionPath" value="festivalDetail.do" />
			<jsp:param name="nowPage" value="<%=String.valueOf(paging.getNowPage())%>" />
			<jsp:param name="totalCount" value="<%=String.valueOf(paging.getTotalCount())%>" />
			<jsp:param name="countPerPage" value="<%=String.valueOf(paging.getCountPerPage())%>" />
			<jsp:param name="blockCount" value="<%=String.valueOf(paging.getBlockCount())%>" />

			<jsp:param name="findWord" value="#{findWord} }" />
			<jsp:param name="choice" value="#{choice}" />
		</jsp:include>
	
	
	
	
	
	
	<hr style="width:95%">
	<!-- 댓글 작성  -->
	<%if(member != null){ %>
<form action="festivalReplyInsert.do" method="post">	
	<div class="reply-write">
	<table>
		<col width="200"><col width="350"><col width="20">
		<tr>
			<td align="center">
				<input type="text" name="id" value="<%=id%>" readonly="readonly" size="100px" 
				style="background-color: #f2f2f2;border: 0;width:70% ">
			</td>
			<td>
				<textarea rows="4" cols="80" placeholder="댓글을 입력하세요" style="resize: none;"
				 name="content" id="content"></textarea>
			</td>
			<td>
				<input type="hidden" name="pseq" value="<%=dto.getSeq()%>">
				<input type="submit" value="댓글입력" >

			</td>
		</tr>
	</table>
	
	
	
	</div>
</form>
<%}else{
	%>
	<table>
		<col width="200"><col width="350"><col width="20">
			<tr>
				<td align="center">
					<input type="text" name="id" value="손님" readonly="readonly" size="100px" 
					style="background-color: #f2f2f2;border: 0;width:70% ">
				</td>
				<td>
					<textarea rows="4" cols="80" placeholder="로그인후 이용이 가능합니다."
					 name="content" id="content"></textarea>
				</td>
				<td>
					<input type="button" value="댓글입력" onclick="notLogin()">
				</td>
			</tr>
	</table>
<%	
} 
%>

</div>



<!-- 본문글 수정 폼 -->
<form action="festivalUpdate.do" method="post" id="festivalUpdate_frm">
	<input type="hidden" name="seq" value="<%=dto.getSeq()%>">
	<input type="hidden" name="content" value="<%=dto.getContent()%>">
	<input type="hidden" name="place" value="<%=dto.getPlace()%>">
	<input type="hidden" name="title" value="<%=dto.getTitle()%>">
	<input type="hidden" name="sDate" value="<%=dto.getsDate()%>">
	<input type="hidden" name="eDate" value="<%=dto.geteDate()%>">
	<input type="hidden" name="id" value="<%=dto.getId()%>">
</form>
<!-- 답글폼 -->
<form action="answerWrite.do" id="frm_" method="post">
	<input type="hidden" name="seq" id="seq_" value="">
	<input type="hidden" name="pseq" id="pseq_" value="">
	<input type="hidden" name="content" id="content_" value="">
	<input type="hidden" name="id" id="id_" value="<%=id%>">
</form> 
<!-- 댓글 삭제폼 -->
<form action="answerDel.do" id="delfrm" method="post">
	<input type="hidden" name="seq" id="seq__" value="">
	<input type="hidden" name="pseq" id="pseq__" value="">
</form>  
<!-- 댓글 수정폼 -->
<form action="replyUpdate.do" id="replyUpfrm" method="post">
	<input type="hidden" name="seq" id="seq___">
	<input type="hidden" name="pseq" id="pseq___">
	<input type="hidden" name="content" id="content___">
</form>
<!-- startCss -->

<!-- 리뷰쓰기 폼 -->
<form action="reivewWrite.do" method="post" id="reviewWrite_frm">
	<input type="hidden" name="seq" value="<%=dto.getSeq()%>">
	<input type="hidden" name="place" value="<%=dto.getPlace()%>">
	<input type="hidden" name="title" value="<%=dto.getTitle()%>">	
</form>

<!-- 해당 리뷰 보기 -->

<form action="SearchreviewList.do" id="reviewList_frm" method="post">
	<input type="hidden" name="findWord" id="findWord">
	<input type="hidden" name="choice" id="choice">
</form>

<script type="text/javascript">
var isS = true;
var ssseq =0;
var sscontent ="";

var aisS = true;

var judgment = true; 

$("#festivalDelete").click(function(){
	$("#_festivalDelete").submit();
});
$("#festivalUpdate").click(function(){
	$("#festivalUpdate_frm").submit();
});

$(document).ready(function(){
  $('.bxslider').bxSlider({
	  auto: true,	//자동 애니메이션 시작
  	  speed: 500,	//에니메이션 속도
  	  pause: 5000,	//에니메이션 유지시간 (1/1000)
  	  mode: 'horizontal',//슬라이드 모드(fade,vertical,horizontal)
	  autoControls: true, //시작 및 중지버튼 보여줌
	  pager: true, // 페이지 표시 보여줌
	  captions: true//이미지위에 텍스트를 넣을 수 있음
	  /* responsive: false */
  });
});

	/* 댓글수정 취소를 눌렀을 때 */




function answerWrite( seq , pseq ){
	var content = $("#content"+seq).val();
	$("#seq_").val(seq);
	$("#pseq_").val(pseq);
	$("#content_").val(content);
	$("#frm_").submit();
}
function answerDel(seq,pseq){
	$("#seq__").val(seq);
	$("#pseq__").val(pseq);
	$("#delfrm").submit();
	
}
function replyUpdate( seq ){
	//alert("replyUpdate 진입")
	
	
	/* 맨처음으로 리셋하기 */
	if(isS==false){ 
		var qqq = confirm("작성하시던 글을 종료하시겠습니까?")
		/* 답글 초기값 */
		if(qqq){		
		$(".showClass").show(); 
		$(".hiddenClass").hide();
		$("#hiddenContent"+ssseq).val(sscontent);			
 
		isS = true;
		}
	}
	
	if(isS==true){
	/* 메인창 숨기고 서브창 노출*/
	
	$("#mainContent"+seq).hide();
	$("#hiddenContent"+seq).show();
	$("#asnwerUpAndDel"+seq).hide();
	$("#asnwerUpAndDel2"+seq).hide();
	$("#asnwerUp"+seq).show();
	$("#replyUpdateButton"+seq).hide();
	$("#answerBackTd"+seq).show();
	
	//	alert(isS);
		isS = false;
		ssseq = seq;
		sscontent = $("#mainContent"+seq).val()
	}
	
}
function answer( seq ){
	
	if(aisS==false){
		var qqq = confirm("작성하시던 글을 종료하시겠습니까?")
		/* 답글 초기값 */
		if(qqq){			
		$(".delTr").hide();
		$(".delContent").val("");		
		aisS=true;
		}
	}
	
	/* 서브답글 */
	if(aisS==true){
	$("#hidden"+seq).show();
		aisS=false
	}
	
	
	
}


function answerBack( seq ){
	var isS = confirm("수정 취소하시겠습니까?");
	if(isS){
		location.reload();
	}
}

function answerBack_(){
	var isS = confirm("댓글작성을 종료하시겠습니까?");
	if(isS){
		location.reload();
	}
}
/* 댓글 수정 함수 */
function answerUpdate( seq,pseq ){
	/* alert("함수진입"+seq+pseq); */
	var content = $("#hiddenContent_"+seq).val();
	$("#seq___").val(seq);
	$("#pseq___").val(pseq);
	$("#content___").val(content);
	$("#replyUpfrm").submit();
}
function notLogin(){
	alert("로그인 후 이용이 가능합니다.")
}


function fReviewWrite(){
	$("#reviewWrite_frm").submit();	
}
function goReviewList(title,choice){
	
	$("#findWord").val(title);
	$("#choice").val(choice)
	$("#reviewList_frm").submit();
}


</script>


</body>
</html>

