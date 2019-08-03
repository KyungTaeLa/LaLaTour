<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/loc_detail_pds.css">
	<fmt:requestEncoding value="utf-8" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/loc_button.css">
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/loc_de_top.css">
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/loc_scroll.css">
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/list.css">
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/Location_list.css">
<%-- <script type="text/javascript"
	src="<%=request.getContextPath() %>/resources/js/loc_detail_pds.js"></script> --%>
<style type="text/css">
.wrapper{
	background-color: white;
}
.layout {
	display: none;
}

.inputReply {
	display: none;
}

  .solid {
        border-style: solid;
      }
      .aa {
      	height : 50px;
      }

      
      
   .ac a {
  link :  color: white; text-decoration: none;
  visited:  color: black; text-decoration: none;
  hover : color: blue; 
}

.gota {
	margin-left: 15%;
}

</style>
<div style="background-color: white; z-index: 1">
<!-- <script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> -->


<!-- detail -->

<div class="sub-detail-visual-wrap bg-fixed" id="skip-container" style="background-image: url(<%=request.getContextPath() %>/upload/${attdetail.thumbnail });">
	<div class="sub-detail-title-wrap">
		<div class="sub-detail-title-inner">
		<p class="small-text">명소</p>
		<p class="large-text" name="title">${attdetail.title }</p>
		</div>
	</div>
</div>


<table>
<tr>
<td>
	<p>    </p>
</td>
</tr>
</table>


 	<table class="gota">
<tr>
  <td>
  	<a class="black-text" href="location_attrac.do">지역명소</a>&nbsp;&nbsp;&nbsp;<a href="location_food.do" class="black-text">음식점</a>&nbsp;&nbsp;&nbsp;<a href="location_shop.do" class="black-text">쇼핑</a>
  </td>
 </tr>
</table>
 
	<br><br>
	<ul class="slides" id="soeasy">
		<c:forEach items="${plist }" var="pds" varStatus="ps">
			<input type="radio" name="radio-btn" id="img-${ps.count }" checked />
			<li class="slide-container">
				<div class="slide">
					<img
						src="<%=request.getContextPath() %>/upload/${pds.fileName_Af }" />
				</div>
				<div class="nav">
					<label for="img-${ps.count + 1 }" class="prev">&#x2039;</label> <label for="img-${ps.count - 1 }"
						class="next">&#x203a;</label>
				</div>
			</li>

		</c:forEach>

		<li class="nav-dots">
		<c:forEach items="${plist }" var="pds" varStatus="ps">
			<label for="img-${ps.count }" class="nav-dot" id="img-dot-${ps.count }"></label>
			</c:forEach>
		
			</form>
			</li>
	</ul>
	<br>
	<br>
	
	
	<div class="sub-detail-contents" id="sub-container">
		<div class="sub-detail-inner">
			<p class="location-lst">
				<span class="active">
					쇼핑
				</span>
			</p>
			
			<h4 class="sub-detail-title">기본 정보</h4>
			<div class="detail-cont">
				<pre>${attdetail.content }</pre>
			</div>
			
			<div class="aa">
			<aside class="right-content">
				<div class="aside" style="width: 300px; height: 150px; bottom: 600px; top: 600px; background-color: white;">
					<div class="detail-box">
						<span>정보</span>
					</div>
					<div class="right-content-inner">
						<dl class="detail-type">
							<dt>주소</dt>
							<dd>${attdetail.place }</dd>
						</dl>
					</div>
				</div>
			</aside>
			</div>
		</div>
	</div>

	<br>

	<form action="location_shop_update.do" id="detailfrm">
	<c:if test="${login.id eq attdetail.id || login.auth eq '1' }">
	<table class="ta">
	<tr>
		<td>
			<input type="hidden" name="seq" value="${attdetail.seq }">
			<input type="hidden" name="id" value="${attdetail.id }">
		<input type="hidden" name="title" value="${attdetail.title }">
		<input type="hidden" name="content" value="${attdetail.content }">
		<input type="hidden" name="place" value="${attdetail.place }">
		</td>
	</tr>
	<tr>
			<td>
				<input type="submit" id="attupdate" class="button" value="수정">&nbsp;&nbsp;
				<button type="button" id="_listdelete" class="button"  onclick="listdelete( ${attdetail.seq } )">삭제</button>
				
			</td>
		</tr>
	</table>
	</c:if> 

</form>
<br><br>

<div style="background-color: rgba(255,255,255,0.5); margin-left: 12%; margin-right: 12%">

<div id="easy"></div>



<!-- 댓글 쓰기 -->
<form action="location_shop_Reply.do" onsubmit="return writeRep()">
	<table style="margin-left: 29%">
	<col width="100"><col width="100">

		<tr>
			<td>
			<%-- <p name="id" id="Rid" value="${login.id }">${login.id }</p> --%>
			<input type="hidden" style="border: 0;" id="Rid" name="id" value="${login.id }"><input type="hidden" name="pseq" class="textar"
				value="${attdetail.seq }"></td>
		</tr>

		<tr>
			<th>댓글</th>
			<td><!-- <textarea id="Rcontent" name="content" rows="7" cols="90"></textarea> -->
				<input type="text" id="Rcontent" name="content" style="width: 400px; height: 100px; border-radius: 12px;outline: none; border-color: #5466;padding-left: 10px;">
			</td>
			<td><pre>    </pre></pre></td><td><input type="submit" class="myButton" id="rbtn" value="저장"></td>
		</tr>
		<tr>
			<td><p></p></td>
		</tr>

	</table>
</form>


<!-- 댓글/대댓글 출력 -->

<table style="margin-left: 465px;">
	<!--  삭제된 댓글 -->
	<c:forEach items="${rlist }" var="rep" varStatus="status">
		<c:if test="${rep.del eq '1'}">
			<c:if test="${rep.step eq '0' }">
				<tr>
					<td>
						<input type="hidden" id="did">
						<input type="hidden" id="seq" value="${rep.seq }">
					</td>
				</tr>
				<tr>
					<td colspan="4"><input type="text" name="content" class="gan" style="width: 400px; height: 100px; border-radius: 12px;outline: none; border-color: #5466; padding: 10px;"
						value="삭제된 댓글입니다." readonly="readonly"></td>
				</tr>
					
				
			</c:if>
		</c:if>
		

		<!-- 정상 댓글 -->
		<form action="location_shop_upreply.do">
			<c:if test="${rep.del eq '0'}">
				<c:if test="${rep.step eq '0' }">

					<tr>
						<td><input type="text" name="id" value="${rep.id }"
							readonly="readonly" style="border: 0;">
							
</td>
						<td><input type="hidden" name="seq" value="${rep.seq }"
							readonly="readonly" style="border: 0;"></td>
					</tr>

					<tr>
						<td><input type="text"  rows="7" cols="90" readonly="readonly" class="gan" style="width: 400px; height: 100px; border-radius: 12px;outline: none; border-color: #5466; 
						padding: 10px;" value="${rep.content }""> 
								</td>
						<td style="padding-left: 9px;">
							<input type="text" name="wdate" value="${rep.wdate }" readonly="readonly" style="border: 0;"><br>
							<button type="button" onclick="srbtn( ${rep.seq } )" class="myButton2">댓글달기</button>
							<c:if test="${login.id eq rep.id || login.auth eq '1' }">
								<button type="button" onclick="asc( ${rep.seq } )" class="myButton2">수정</button>
								<button type="button"
									onclick="deletebtn( ${rep.seq }, ${rep.pseq } )" class="myButton3">삭제</button>
							</c:if>
						</td>


					</tr>
				</c:if>
			</c:if>
			</form>
			

		<!-- 수정 후 댓글 -->
		<form action="location_shop_upreply.do">
			<c:if test="${rep.del eq '2'}">
				<c:if test="${rep.step eq '0' }">

					<tr>
						<td><input type="text" name="id" value="${rep.id }"
							readonly="readonly" style="border: 0;"> 
							<%-- <input type="text" name="wdate"
							value="${rep.wdate }" readonly="readonly" style="border: 0;"> --%></td>
						<td><input type="hidden" name="seq" value="${rep.seq }"
							readonly="readonly"></td>
						
					</tr>

					<tr>
						<td><input type="text" rows="7" cols="90" readonly="readonly" style="width: 400px; height: 100px; border-radius: 12px;outline: none; border-color: #5466; padding: 10px;"
								name="content" value="${rep.content }"></td>
						<td style="padding-left: 9px;">
							<input type="text"
							name="afterupdate" value="수정한 댓글 입니다." readonly="readonly"style="border: 0;" >
							<br>
							<input type="text" name="wdate" value="${rep.wdate }" readonly="readonly" style="border: 0;">
							<br>
							<button type="button" onclick="srbtn( ${rep.seq } )" class="myButton2">댓글달기</button>
							<c:if test="${login.id eq rep.id || login.auth eq '1' }">
								<button type="button" onclick="asc( ${rep.seq } )" class="myButton2">수정</button>
								<button type="button"
									onclick="deletebtn( ${rep.seq }, ${rep.pseq } )" class="myButton3">삭제</button>
							</c:if>
						</td>
					</tr>
				</c:if>
			</c:if>
		</form>
	

		<!-- 대댓글 쓰기 -->
		<form action="location_shop_SubreplyAf.do"
			onsubmit="return subwriterep()">
			<!-- <div class="inputReply"> -->
				<tr id="${rep.seq }" style="display: none">
					<td style="width: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;
					<img alt="이미지없음"
						src="<%=request.getContextPath()%>/resources/images/reply.JPG"
						style="width: 20px; height: 20px;">
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="SRcontent" name="content" style="width: 400px; height: 100px; border-radius: 12px;outline: none; border-color: #5466; padding: 10px;">
					<input type="hidden" id="SRid" name="id"
						value="${login.id }" readonly="readonly">
						<input
						type="hidden" name="pseq" value="${attdetail.seq }"> <input
						type="hidden" name="ref" value="${rep.ref }"></td>

					<!-- <td><input type="text" id="SRcontent" name="content" style="width: 400px; height: 100px; border-radius: 12px;outline: none; border-color: #5466; padding: 10px;"></td> -->

					<td> &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="myButton" id="resub" value="저장">
						<button type="button" onclick="cnc_( ${rep.seq } )" id="cnc" class="myButton3">취소</button>
					</td>
				</tr>
			</div>
		</form>

		<!-- 대댓글 출력 -->
		<!-- 정상 대댓글 -->
		<c:if test="${rep.del eq '0'}">
			<c:if test="${rep.step ne '0' }">
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp; <img alt="이미지없음"
						src="<%=request.getContextPath()%>/resources/images/reply.JPG"
						style="width: 20px; height: 20px;"> <input type="text"
						id="sid" value="${rep.id }" readonly="readonly" style="border: 0;"><br>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly" style="width: 400px; height: 100px; border-radius: 12px;outline: none; border-color: #5466; padding: 10px;" value="${rep.content }">
					</td>
					<td>
					&nbsp;&nbsp;<input type="text" name="wdate" value="${rep.wdate }" readonly="readonly" style="border: 0;"><br>
					&nbsp;&nbsp;<c:if test="${login.id eq rep.id || login.auth eq '1' }">
							<input type="button" name="update" 
								onclick="SubreplyupP(${rep.seq })" class="myButton2" value="수정">
							<button type="button"
								onclick="Subredelete( ${rep.seq }, ${rep.pseq } )" class="myButton3">삭제</button>
						</c:if></td>
				</tr>

			</c:if>
		</c:if>

		<!-- 수정 후 대댓글 -->
		<c:if test="${rep.del eq '2'}">
			<c:if test="${rep.step ne '0' }">
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp; <img alt="이미지없음"
						src="<%=request.getContextPath()%>/resources/images/reply.JPG"
						style="width: 20px; height: 20px;"> <input type="text"
						id="sid" value="${rep.id }" readonly="readonly" style="border: 0;"> <input
						type="text" id="atterupdate" value="수정된 댓글 입니다."
						readonly="readonly"> <br> &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width: 400px; height: 100px; border-radius: 12px;outline: none; border-color: #5466; padding: 10px;" 
							value="${rep.content }">
					</td>
					<td>&nbsp;&nbsp;<input type="text" name="wdate" value="${rep.wdate }" readonly="readonly" style="border: 0;"><br>
					<c:if test="${login.id eq rep.id || login.auth eq '1' }">
							&nbsp;&nbsp;<input type="button" name="update"
								onclick="SubreplyupP(${rep.seq })" class="myButton2" value="수정">
							<button type="button"
								onclick="Subredelete( ${rep.seq }, ${rep.pseq } )" class="myButton3">삭제</button>
						</c:if></td>
				</tr>

			</c:if>
		</c:if>

		<!-- 삭제 후 대댓글 -->
		<c:if test="${rep.del eq '1'}">
			<c:if test="${rep.step ne '0' }">
				<tr>
					<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; <img alt="이미지없음"
						src="<%=request.getContextPath()%>/resources/images/reply.JPG"
						style="width: 20px; height: 20px;"> <input type="text" style="width: 400px; height: 100px; border-radius: 12px;outline: none; border-color: #5466; padding: 10px;"
						name="content" value="삭제된  대댓글입니다." readonly="readonly"></td>
				</tr>
			</c:if>
		</c:if>
		
		
		<!-- 댓글 수정 -->
		<form action="location_shop_Replyupdate.do" onsubmit="return repupdate()">
		<div class="inputReply">
			<tr id="r${rep.seq }" style="display: none;">
				<td style="margin-top: 10px;">
					<input type="hidden" id="id" name="id" value="${rep.id }"
						readonly="readonly" style="border: 0;"> <input type="hidden" name="pseq"
						value="${attdetail.seq }"> <input type="hidden" name="ref"
						value="${rep.ref }"> <input type="hidden" name="step"
						value="${rep.step }"> <input type="hidden" name="seq"
						value="${rep.seq }"> <input type="hidden" name="tname"
						value="${rep.tname }">
						&nbsp;&nbsp;<input type="text" id="RUcontent"
							name="content" style="width: 400px; height: 100px;
							 border-radius: 12px;outline: none; border-color: #5466;
							  padding: 10px;margin-top: 10px;margin-bottom: 10px;" value="${rep.content }"></td>
				<td><input type="submit" id="rup" class="myButton" value="저장">
						<button type="button" onclick="Ucnc_( ${rep.seq } )" id="Ucnc" class="myButton3">취소</button>
			</tr>
		</div>
		</form>




		<!-- 대댓글 수정 -->
		<form action="location_shop_Subreplyup.do"
			onsubmit="return subreupdate()">
			<div class="inputReply">
				<tr id="p${rep.seq }" style="display: none">
					<td><input type="hidden" id="id" name="id" value="${rep.id }"
						readonly="readonly" style="border: 0;"> <input type="hidden" name="pseq"
						value="${attdetail.seq }"> <input type="hidden" name="ref"
						value="${rep.ref }"> <input type="hidden" name="step"
						value="${rep.step }"> <input type="hidden" name="seq"
						value="${rep.seq }"> <input type="hidden" name="tname"
						value="${rep.tname }"></td>

					<td><input type="text" id="SRUcontent"
							name="content" style="width: 400px; height: 100px; border-radius: 12px;outline: none; border-color: #5466; padding: 10px;" value="${rep.content }"></td>

					<td><input type="submit" id="resub" class="myButton" value="저장">
						<button type="button" onclick="Scnc_( ${rep.seq } )" id="Scnc" class="myButton3">취소</button>
					</td>
				</tr>

			</div>
		</form>



	</c:forEach>
</table>
</div>

<br><br>

<!-- 페이징 처리 -->
<jsp:include page="paging.jsp">
	<jsp:param name="actionPath" value="location_shop_detail.do" />
	<jsp:param name="nowPage" value="${paging.nowPage }" />
	<jsp:param name="totalCount" value="${paging.totalCount }" />
	<jsp:param name="countPerPage" value="${paging.countPerPage }" />
	<jsp:param name="blockCount" value="${paging.blockCount }" />

	<jsp:param name="pseq" value="${attdetail.seq }" />

</jsp:include>

</div>

<script>

	function listdelete( obj ) {
		alert("삭제되었습니다.")
		location.href="location_shop_listdelete.do?seq="+ obj;
	}
	// 댓글보이게
	/* $(".rebtn").click(function() {
	 alert("쥬같너");
	 $("#"+$(this).attr("val1")).show();
	 }); */
	function deletebtn(seq, pseq) {
		
		alert(seq);
		location.href = "location_shop_Redelete.do?seq=" + seq + "&pseq="
				+ pseq;
	}
	 
	 function Subredelete(seq, pseq) {
			
			
			location.href = "location_shop_Subredelete.do?seq=" + seq + "&pseq="
					+ pseq;
		}

	// 댓글 보이게
	/* $("#rebtn").click(function() {
		alert("쥬같너");
		$("#" + $("rebtn").val()).show();
	}); */
	/* function 
( obj ) {
			alert("댓");
			$("#" + obj).show();
	} */
	
	function srbtn( obj ) {
		
		$("#" + obj).show();
}
	function asc( obj ) {
		
		$("#r" + obj).show();
}
	
	function SubreplyupP( obj ) {
		
		$("#p" + obj).show();
	}
	
	/* $("#cnc").click(function() {
		alert("쥬같너?");
		$("#Rrep").hide();
	}); */
	function cnc_( obj ) {
		
		$("#" + obj).hide();
	}
	
	function Ucnc_( obj ) {
		
		$("#r" + obj).hide();
	}
	
	function Scnc_( obj ) {
		
		$("#p" + obj).hide();
	}
	// 댓글 막기
	function writeRep() {
		if ($("#Rid").val().trim() == null || $("#Rid").val().trim() == "") {
			alert("로그인 후 이용해주세요.");
			$("#Rcontent").val("");
			return false;
		}else if ($("#Rcontent").val().trim() == "" && $("#Rcontent").val().trim() != null){
			alert("내용을 입력해 주세요.");
			return false;
		}else {
			alert("저장되었습니다.");
			return true;
		}
		
		
	}
		// 대댓글막기
		function subwriterep() {
			if ($("#SRid").val().trim() == null || $("#Rid").val().trim() == "") {
				alert("로그인 후 이용해주세요.");
				$("#SRcontent").val("");
				return false;
			}else if ($("#SRcontent").val().trim() == null && $("#Rid").val().trim() != null){
				alert("내용을 입력해 주세요.");
				return false;
			}else {
				alert("저장되었습니다.");
				return ;
			}
	}
	
		function subreupdate() {
			if($("#SRUcontent").val().trim() == null) {
				alert("내용을 입력해주세요.");
				return false;
			} else {
				alert("저장되었습니다.");
				return true;
			}
			
		}
		

		var WindowH,BodyH,AsideW,AsideH,ScrTop,ScrBottom,StartScroll,fixBottom;
		$(window).bind('resize load',function(){
			WindowH = $(window).height();
			BodyH = $('body').height();
			AsideW = $('aside').width();
			AsideH = $('.aside').height();
			StartScrTop = $('header').height() + $('.sub-detail-visual-wrap').height()+45;
			if (AsideH < WindowH){
				isScroll = false;
			} else {
				isScroll = true;
			}
			if ($(window).width() < 1250){
				$('.aside').css({'position':'','width':'auto','height':'auto','bottom':'auto','top':'auto'});
			}
		})
		/* $(window).scroll(function(){
			try{
				$('#container > div.holder').css('position','relative');
				ScrTop = $(window).scrollTop();
				ScrBottom = BodyH - ScrTop - WindowH;
				StartScroll = (AsideH + StartScrTop) - (ScrTop + WindowH);
				if (WindowH < AsideH) {
					fixBottom = ($('.left-content').height() +StartScrTop) - ((ScrTop + AsideH) - (AsideH - WindowH)) - 50
				} else {
					fixBottom = ($('.left-content').height() +StartScrTop) - (ScrTop + AsideH) - 50
				}

				if ($(window).width() > 1250){
					if ($('.left-content').height() > $('.aside').height()){
						if (isScroll == true){
							if (StartScroll < 0){
								$('.aside').css({'position':'fixed','width':AsideW,'bottom':0});
								fixB();
							}else	{
								$('.aside').css({'position':'','width':'auto','bottom':'auto','top':'auto'});
								fixB();
							}
						}else	{
							if (ScrTop > StartScrTop){
								$('.aside').css({'position':'fixed','width':AsideW,'top':62});
								fixB();
							}else	{
								$('.aside').css({'position':'','width':'auto','top':'auto'});
								fixB();
							}
						}
					}
				}
			}catch(e){}
		});

		function fixB(){
			if (fixBottom < 0) {
				$('.aside').css({'position':'absolute','width':AsideW,'height':AsideH,'bottom':50,'top':'auto'});
			}
		} */
		
		
		/* $(document).ready(function(){
			//스크롤되면 함수시작
			   $(window).scroll(function () {   
			      //스크롤을 200px이상 하면 스크롤되게 바꾼다      
			    if($(window).scrollTop() >700) {
			       $('.aside').css('position','fixed');
			         //스크롤될때 고정할 위치
			       $('.aside').css('top','200'); 
			    }
			      //top에서 200px이하로 되면 스크롤기능을 죽임
			    else if ($(window).scrollTop() <= 700) {
			       $('.aside').css('position','');
			        //스크롤기능 사라질 때  고정할 위치
			       $('.aside').css('top','0');
			    }  
			      
			      //끝 위치를 동적으로 설정해놓을때 쓰는 함수 (나는 댓글 바로 위에다가 임시 div(footer)생성해놨음)
			       if ($('.aside').offset().top + $(".aside").height() > $("#easy").offset().top) {
			           $('.aside').css('top',-($(".aside").offset().top + $(".aside").height() - $("#easy").offset().top));
			       }
			   });
			   });
		 */
	
	
</script>