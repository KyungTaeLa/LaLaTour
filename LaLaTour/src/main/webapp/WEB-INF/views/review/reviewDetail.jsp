<%@page import="lala.com.a.util.pagingBean"%>
<%@page import="lala.com.a.model.ReplyDto"%>
<%@page import="lala.com.a.model.MemberDto"%>
<%@page import="lala.com.a.model.ReviewDto"%>
<%@page import="lala.com.a.model.PdsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.fDetail_all {
    position: relative;
    width: 100%;
    max-width: 1500px;
    /* margin: 0 auto; */
    padding: 0px 50px;
    min-height: 500px;
    margin-left:7%;
    margin-top:50px;
}

.fDetail_all .fDetail_left {
    position: relative;
    width: 800px;
    float: left;
    padding-right: 0px;
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
margin: 0 15% 0 15%;
}


.middleImg{ 
	margin-top:60px;
	background-repeat: no-repeat;
 	background-size: 100% 230px; 
	height: 230px;
	opacity: 0.9; 
	background-image: url("<%=request.getContextPath() %>/resources/images/DMZ5.JPG");
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

 <!-- img slide Link -->
 <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/festivalDetail.css">
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/resources/css/festivalDetail.css"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<%
String id = "";
int seq = 0;
int auth =0;

List<PdsDto> pdslist = (List<PdsDto>)request.getAttribute("pdslist"); 
ReviewDto revdto = (ReviewDto)request.getAttribute("revdto"); 
List<ReplyDto> rList = (List<ReplyDto>)request.getAttribute("rlist");
pagingBean paging = (pagingBean)request.getAttribute("paging");
List<PdsDto> list1 = (List<PdsDto>)request.getAttribute("list1");

Object object = session.getAttribute("login");
MemberDto member = null;
if(object!=null){
	member = (MemberDto)object;
	id=member.getId();
	auth=member.getAuth();
}
int pampletSeq = 0;
String pampletBf ="";
String pampletAf ="";

%>
<!-- 확인완료 -->
<%-- <h3><%=dto.toString() %></h3> --%>
<%for(int i =0;i<list1.size();i++){
	PdsDto pdto = list1.get(i);
	String CheckId = pdto.getFileName_Af().substring(pdto.getFileName_Af().lastIndexOf("."));	//팜플렛을 판단하기위한 과정
	//확인완료 System.out.println("check Id = "+CheckId);
	if(CheckId.equals(".pdf")||CheckId.equals(".pptx")){ // 만약 pds테이블안에서 팜플렛 파일이라면
		
		 pampletSeq = pdto.getSeq();
		 pampletBf = pdto.getFileName_Bf();
		 pampletAf = pdto.getFileName_Af();
	}
} 

%>


	<div class="middleAll">
		<div class="middleImg">
			<h1 class="middleTitle">축제후기</h1>
		</div>
	</div>


<div class="fDetail_all">
<p class="location-lst" style="margin-left: 5%">
	<span>라라투어</span>
	<span>축제&행사</span> 
	<span class="active">축제&행사 후기</span> 
</p>
	 <!-- left content -->
	<div class="fDetail_left" style="margin-left: 100px;width: 900px" >
		<h4><%=revdto.getTitle() %></h4>
		<br><br>
		<%for(int i =0; i<pdslist.size();i++){
			PdsDto pdsdto = pdslist.get(i);
		%>
			<img alt="사진없음" src="<%=request.getContextPath()%>/upload/<%=pdsdto.getFileName_Af()%>" title="" style="width:90%;height: 550px">
			<pre><font style="font-size: 20px"><%=pdsdto.getContent().trim() %></font></pre><br><br>
		<%
		} 
		%>
		
	</div>
	
	<!-- right Content -->
	<div class="fDetail_right">
		<div class="aside" style="width: auto; top: auto; height: 202px; bottom: 50px;"><!-- scroll fixed 추가 -->
			<div class="detail-box">
				<span style="margin-left: 30%">상세정보</span>		
		</div>
					<div class="right_content_inner">
						<dl class="detail-type">
							<dt> 후기 작성자</dt>
							<dd>
								<a href=# ><%=revdto.getId()%></a>
							</dd>
						</dl>
						
						
						<dl class="detail-type">
							<dt > 축제기간 </dt>
							<dd >
								<%=revdto.getSdate() %>~<%=revdto.getEdate() %>
							</dd>
						</dl>
						<dl class="detail-type">
							<dt> 장소 </dt>
							<dd>
								<%=revdto.getPlace()%><%=revdto.getFtitle()%>
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
							<dt> 작성자 평점 </dt>
							<dd>
		<%if(revdto.getScore()>4.5){ %>
			<img src="resources/images/star/star_5.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>4){ %>
			<img src="resources/images/star/star_4.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>3.5){ %>
			<img src="resources/images/star/star_4.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>3){ %>
			<img src="resources/images/star/star_3.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>2.5){ %>
			<img src="resources/images/star/star_3.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>2.0){ %>
			<img src="resources/images/star/star_2.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>1.5){ %>
			<img src="resources/images/star/star_2.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if((revdto.getScore()>1.5)){ %>
			<img src="resources/images/star/star_1.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if (revdto.getScore()>1.0){ %>
			<img src="resources/images/star/star_1.5.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>0.5){ %>
			<img src="resources/images/star/star_1.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else if(revdto.getScore()>0){ %>
			<img src="resources/images/star/star_1.0.png" alt="NO Picture" style="width:100px; height:20px;"><%=revdto.getScore()%>
		<%}else{ %>
			작성된 후기가 없습니다.
		<%} %>
							</dd>
						</dl>
						
						
						
						<dl class="detail-type">
							<dt> 축제 보러가기</dt>
							<dd>
								<a href=# onclick="locationFestival()"><%=revdto.getPlace()%><%=revdto.getFtitle()%></a>
							</dd>
						</dl>
						
						
						<dl class="detail-type">
						<%if(auth==1){ %>
							<dt> 관리자 메뉴</dt>
							<dd>
								<a href="#" onclick="reviewDel(<%=revdto.getSeq()%>)">삭제</a>&nbsp;&nbsp;

							</dd>
						<%} %>
						</dl>
						
						<dl class="detail-type">
						<%if(revdto.getId().equals(id)){ %>
							<dt>작성자 메뉴</dt>
							<dd>
								
								<a href="#" onclick="reviewDel(<%=revdto.getSeq()%>)">삭제</a>&nbsp;&nbsp;
								<a href="#" onclick="reviewUp()">수정</a>

							</dd>
						<%} %>
						</dl>
						
						<dl>
							<dt>뒤로가기</dt>
							<dd>
								<input type="button" class="btn btn-secondary" onclick="back_()" value="back">
							</dd>
						</dl>
					</div>
			</div>		
	</div>
</div>



<br><br><br><br><br><br><br><br><br>
	<!-- 댓글 리스트 -->
<div class="reply-div" style="display: inline-block;">
	<div class="reply-list">
	<%System.out.println("list.size"+rList.size()); %>
		<%if(rList==null||rList.size()==0){ %>
			<p style="margin-left: 43%"><font style="color: red;">작성된 댓글이 없습니다.</font> <p>
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
							&nbsp;&nbsp;&nbsp;&nbsp; <img alt="이미지없음" src="<%=request.getContextPath() %>/resources/images/enter.png">
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
					
					<%if(object!=null){ %>
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
	<br><br><br><br><br><br>
		<!-- page include------------------>
		<jsp:include page="paging.jsp">
			<jsp:param name="actionPath" value="reviewDetail.do" />
			<jsp:param name="nowPage" value="<%=String.valueOf(paging.getNowPage())%>" />
			<jsp:param name="totalCount" value="<%=String.valueOf(paging.getTotalCount())%>" />
			<jsp:param name="countPerPage" value="<%=String.valueOf(paging.getCountPerPage())%>" />
			<jsp:param name="blockCount" value="<%=String.valueOf(paging.getBlockCount())%>" />

			<jsp:param name="findWord" value="#{findWorld} }" />
			<jsp:param name="choice" value="#{choice}" />
		</jsp:include>
	
	
	<hr style="width:95%">
	<!-- 댓글 작성  -->
	<%if(member != null){ %>
<form action="reviewReplyInsert.do" method="post">	
	<div class="reply-write">
	<table>
		<col width="200"><col width="350"><col width="20">
		<tr>
			<td align="center">
				<input type="text" name="id" value="<%=id%>" readonly="readonly" size="100px" 
				style="background-color: #f2f2f2;border: 0;width:70% ">
			</td>
			<td>
				<textarea rows="4" cols="80" placeholder="댓글을 입력하세요"
				 name="content" id="content"></textarea>
			</td>
			<td>
				<input type="hidden" name="pseq" value="<%=revdto.getSeq()%>">
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
<form action="reviewUpdate.do" id="reviewUpdate_frm" method="post" >

<input type="hidden" name="seq" value="<%=revdto.getSeq()%>">
</form>

<!-- 축제 보러가기 폼 -->
<form action="festivalDetail.do" id="locationFestival_frm" method="post">

	<input type="hidden" name="seq" value="<%=revdto.getPseq()%>">
</form>


<!-- 답글폼 -->
<form action="reviewAnswerWrite.do" id="frm_" method="post">
	<input type="hidden" name="seq" id="seq_" value="">
	<input type="hidden" name="pseq" id="pseq_" value="">
	<input type="hidden" name="content" id="content_" value="">
	<input type="hidden" name="id" id="id_" value="<%=id%>">
</form> 

<!-- 댓글 수정 폼 -->
<form action="ReivewreplyUpdate.do" id="replyUpfrm" method="post">
	<input type="hidden" name="seq" id="seq___">
	<input type="hidden" name="pseq" id="pseq___">
	<input type="hidden" name="content" id="content___">
</form>


<!-- 댓글 삭제 폼 -->
<form action="ReviewanswerDel.do" id="delfrm" method="post">
	<input type="hidden" name="seq" id="seq__" value="">
	<input type="hidden" name="pseq" id="pseq__" value="">
</form>  

<!-- 글 삭제폼 -->
<form action="reviewDel.do" id="reviewDel_frm" method="post">
	<input type="hidden" id="_seq" name="seq" value="">
	<input type="hidden" name="score" id="score">
</form>
 <script type="text/javascript">
 
 var isS = true;
 var ssseq =0;
 var sscontent ="";

 var aisS = true;

 
function notLogin(){
	alert("로그인후 이용하실 수 있습니다.")
}
 
 
function reviewDel(seq){
	$("#_seq").val(seq);
	reviewDel_frm.submit();
}
 
function replyUpdate( seq ){
	
	
	
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
	
	
		isS = false;
		ssseq = seq;
		sscontent = $("#mainContent"+seq).val()
	}
	
}

function answerBack( seq ){
	var isS = confirm("수정 취소하시겠습니까?");
	if(isS){
		location.reload();
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

function answerBack_(){
	var isS = confirm("댓글작성을 종료하시겠습니까?");
	if(isS){
		location.reload();
	}
}

/* 댓글 수정 함수 */
function answerUpdate( seq,pseq ){
	
	var content = $("#hiddenContent_"+seq).val();
	$("#seq___").val(seq);
	$("#pseq___").val(pseq);
	$("#content___").val(content);
	$("#replyUpfrm").submit();
}

//댓글 삭제 함수
function answerDel(seq,pseq){
	$("#seq__").val(seq);
	$("#pseq__").val(pseq);
	$("#delfrm").submit();
	
}

//답글
function answerWrite( seq , pseq ){
	var content = $("#content"+seq).val();
	$("#seq_").val(seq);
	$("#pseq_").val(pseq);
	$("#content_").val(content);
	$("#frm_").submit();
}


function reviewUp(){
	
	$("#reviewUpdate_frm").submit();
}

function locationFestival(){
	
	$("#locationFestival_frm").submit();
	
}
function back_(){
	location.href="reviewList.do";
}
</script>


</body>
</html>

















