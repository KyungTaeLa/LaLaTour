<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="lala.com.a.model.ReplyDto"%>
<%@page import="lala.com.a.util.HotelUtil"%>
<%@page import="lala.com.a.util.Singleton"%>
<%@page import="lala.com.a.model.HotelDto"%>
<%@page import="lala.com.a.util.CalendarUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 아임포트 (결제창) -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 데이트피커 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- bar-rating -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/css/fontawesome-stars.css">

<style type="text/css">
.space {
	padding-left: 20px;
}

.layout {
	display: none;
}

.inputReply {
	display: none;
}

h4 {
	font-size: 13px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- slick slider -->
<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
<script type="text/javascript"
	src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>

<!-- local CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/star.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/hotelDetail.css?after">


<!-- 폰트  -->
<style type="text/css">
a:visited {
	text-decoration: none !important;
	color:black;
}
a:link {
	text-decoration: none !important;
	color:black ;
}
a:hover {
	text-decoration: none !important;
	color:black ;
}

</style>
</head>
<body>
<div>
<img alt="" src="<%=request.getContextPath() %>/resources/images/hotel_top.png" border="0" style="width: 100%; height: 230px;">
</div>
	<%!
int reloadChk = 0;
%>
	<%
	

	String strDate = "";
	Singleton s = Singleton.getInstance();
      
	System.out.println("s.Size : " + s.disDate.size());
	if(s.disDate.size() >= 1 && s.disDate != null){
		for(int i = 0; i < s.disDate.size(); i++){
			strDate += "'" + s.disDate.get(i) + "',";
		}
	strDate = strDate.substring(0,strDate.lastIndexOf(","));
	}	
%>
	<%
Calendar cal = Calendar.getInstance();
int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH) +1;
int tday = cal.get(Calendar.DATE);
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
int thour = cal.get(Calendar.HOUR_OF_DAY);

cal.set(Calendar.DATE, 1);			// 1일
HotelDto hotel = (HotelDto)request.getAttribute("hotel");
String syear = request.getParameter("year");
String smonth = request.getParameter("month");
System.out.println("JSP syear : " + syear);
System.out.println("JSP smonth : " + smonth);
int year = cal.get(Calendar.YEAR);
if(CalendarUtil.nvl(syear) == false){	// 파라미터가 넘어 온 경우
	year = Integer.parseInt(syear);
}
int month = cal.get(Calendar.MONTH) + 1;
if(CalendarUtil.nvl(smonth) == false){	// 파라미터가 넘어 온 경우
	month = Integer.parseInt(smonth);
}
if(month < 1){
	month = 12;
	year--;
}
if(month > 12){
	month = 1;
	year++;
}

cal.set(year, month - 1, 1);	// 연월일을 설정
// 요일
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
System.out.println("dayOfWeek:" + dayOfWeek);

String pp = String.format("<a href='%s?year=%d&month=%d&seq=%d'style='color:white' class='cal_point'>"
							+ "◀◀</a>", 
							"hoteldetail.do", year-1, month ,hotel.getSeq());
// <
String p = String.format("<a href='%s?year=%d&month=%d&seq=%d'style='color:white' class='cal_point'>"
							+ "◀</a>", 
							"hoteldetail.do", year, month-1 ,hotel.getSeq());
// >
String n = String.format("<a href='%s?year=%d&month=%d&seq=%d'style='color:white' class='cal_point'>"
							+ "▶</a>", 
							"hoteldetail.do", year, month+1 ,hotel.getSeq());

// >>
String nn = String.format("<a href='%s?year=%d&month=%d&seq=%d'style='color:white' class='cal_point'>"
							+ "▶▶</a>", 
							"hoteldetail.do", year+1, month ,hotel.getSeq());
%>

	<%

String cDate = String.format("%d년%2d", year, month);

String cYear = cDate.substring(0,cDate.indexOf("년"));
String cMonth = cDate.substring(cDate.indexOf("년")+2);
String[] arrMonth = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec"};
int mIndex = Integer.parseInt(cMonth) - 1;
System.out.println("mIndex : " + mIndex);
cMonth = arrMonth[mIndex];
%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<fmt:requestEncoding value="utf-8" />
	<form action="reserveAf.do" method="post" id="reserveFrm">

		<div class="main_container">
			<div class="sub-container">
				<div class="active" style="text-align: right;"><a href="hotellist.do" style="color:black">숙박 ></a>  <b> 호텔</b></div><br>
				<div class="top_section">
					<div class="screen">
						<div class="screen_left">
							<div class="main">
								<div class="slider slider-for">
									<c:forEach items="${pdsList }" var="pds" varStatus="vs">
										<div>
											<h3>
												<img
													src="<%=request.getContextPath() %>/upload/${pds.fileName_Af }"
													style="width: 470px; height: 300px">
											</h3>
										</div>
									</c:forEach>
								</div>
								<div class="slider slider-nav">
									<c:forEach items="${pdsList }" var="pds" varStatus="vs">
										<div>
											<h3>
												<img
													src="<%=request.getContextPath() %>/upload/${pds.fileName_Af }"
													style="width: 130px; height: 70px;">
											</h3>
										</div>
									</c:forEach>
								</div>
							</div>
							<!-- main 끝 -->

						</div>
						<!-- screen_left 끝 -->
						<div class="reserveInfo">
							<div class="black_bt">
								<span class="h_title">${hotel.title }</span>
								<div class="starArea">
									<c:set value="${hotel }" var="ho"></c:set>
									<%HotelDto h = (HotelDto)pageContext.getAttribute("ho"); %>
									<img alt="이미지없음"
										src="<%=request.getContextPath()%>/resources/images/star/star_<%=HotelUtil.xxx(h.getGrade())%>.png">
									<span class="star_text"><%=HotelUtil.xxx(h.getGrade()) %></span>
								</div>
							</div>

							<div class="rightExplain">
								<label>1일 숙박요금 </label> ${hotel.price } <input type="hidden"
									value="${hotel.price }" name="price">
							</div>
							<div class="rightExplain">
								<label>상세 주소 </label> ${hotel.place } <input type="hidden"
									value="${hotel.place }" name="place">
							</div>
							<div class="rightExplain">
								<label>시설 소개</label> <img
									src="<%=request.getContextPath() %>/resources/images/h_info.png">
							</div>

						</div><!-- reserveInfo 끝 -->
						
						<p class="pClear">&nbsp;</p> 
						<hr style="border: 1px gray solid;" />
						<label id="re_info_txt">* 객실예약 안내 </label>
						<div>
							<div class="cal_section">
								<h4>날짜를 선택해 주세요</h4>
								<div class="temp">
									<div>
										<label style="margin-right: 210px;">체크인 </label> <label>체크아웃</label>
									</div>
									<div>
										<img
											src="<%=request.getContextPath() %>/resources/images/calendar.png">
										<input type="text" id="from" name="sdate" readonly> <img
											id="s_cal_img"
											src="<%=request.getContextPath() %>/resources/images/calendar.png">
										<input type="text" id="to" name="edate" readonly>
									</div>
									<div class="re_main">
										<div class="cal_price">
											<label style="margin-right:20px;">결제 금액 </label> ￦<span id="totalPrice"></span>
										</div>
										<div class="re_div">
											<input type="hidden" id="re_price" name="re_price" value="">
											<input type="hidden" name="id" value="${login.id }">
											<input type="button" onclick="imp()" class="reserve_btn"
												value="예약하기"> <input type="hidden" name="pseq"
												value="${hotel.seq }"> <input type="hidden"
												name="merchant" id="merchant" value="">
										</div>
									</div><!-- re_main 끝 -->
								</div><!-- temp 끝 -->
							</div><!-- cal_section 끝 -->
							&nbsp;&nbsp;
							<div class="info_room_div">
								<textarea readonly rows="13" cols="78" id="re_info" style="resize: none;" id="info_room_txt">Triple (3인용실) 객실 예약에 따른 안내

반드시 3개의 침대가 있는 객실을 의미하지는 않으며, 객실당 3명의 숙박 허용을 의미 합니다.
				
				
Twin/Double 객실 예약에 따른 안내

2인실의 베드 타입(더블/트윈)은 체크인 시점의 객실 상황에 따라 임의 배정됩니다.
		
확정서상의 룸타입 더블, 트윈은 고객님의 Bedding Type 선호 사항을 의미하며 보장되지 않을 수 있습니다.
				
동남아 특정 지역/호텔 에서는 현지 여성의 동숙을 허용하지 않거나 별도의 추가요금을 현장에서 청구하는 경우가 있으나,
				
호텔패스는 방침상 이와 관련된 확인의 책임이나 의무가 없으며, 관련하여 발생하는 모든 문제에 관하여 책임이 없음을 알려드립니다.
							</textarea>
							</div>
						</div>
						<p class="pClear">&nbsp;</p>

					</div>
					<!-- screen 끝 -->
				</div>
				<!-- top_section 끝 -->
				<div class="bottom_section">
					<div class="cal_div">
						<table class="calendar_tb">
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="100">
							<tr height="70">
								<td colspan="7" align="center" id="ym_section">

									<div style="width: 100%; padding: 0px 10px 0px 10px;">
										<div style="float: left; padding-top: 49px;">
											<%=pp %>&nbsp;&nbsp;&nbsp;<%=p %>
										</div>
										<div style="float: right; padding-top: 49px;">
											<%=n %>&nbsp;&nbsp;&nbsp;<%=nn %>
										</div>
										<span style="font-size: 50px; font-weight: bold"><%=cMonth %></span><br>
										<span style="font-size: 25px; font-weight: bold"><%=cYear %></span>
									</div>
								</td>
							</tr>
							<tr height="70" id="cal_week">
								<td align="center">SUN</td>
								<td align="center">MON</td>
								<td align="center">TUE</td>
								<td align="center">WED</td>
								<td align="center">THU</td>
								<td align="center">FRI</td>
								<td align="center">SAT</td>
							</tr>

							<tr class="cal_day">
								<%
		// 윗쪽의 빈칸
		for(int i = 1;i < dayOfWeek; i++){
			%>
								<td>&nbsp;</td>
								<%
		}
		
		// 날짜
		for(int i = 1;i <= lastDay; i++){
			if(i == 1 ){
				System.out.println("들어옴?");
				s.disDate.clear();
			}
			%>
								<td style="padding-left: 10px"><%=CalendarUtil.callist(year, month, i) %>
									<%=CalendarUtil.makeTable(year, month, i,hotel.getMaxcount() ) %>
								</td>
								<%
			if((i + dayOfWeek - 1) % 7 == 0 && i != lastDay){
				%>
							</tr>
							<tr class="cal_day">
								<%
			}	
		}
		
		// 밑의 빈칸
		for(int i = 0; i < (7 - (dayOfWeek + lastDay - 1) % 7 ) % 7; i++){
			%>
								<td>&nbsp;</td>
								<%
		}
		
		%>
							</tr>
						</table>
					</div>
					<!-- cal_div 끝 -->

					<div class="cal_right">
						<div class="cal_right_top">호텔 시설</div>
						<div class="cal_right_title">일반사항</div>
						<div class="cal_right_content">에어컨</div>
						<div class="cal_right_title">편의시설</div>
						<div class="cal_right_content">수영장</div>
						<div class="cal_right_title">서비스</div>
						<div class="cal_right_content">24시간 리셉션, 컨퍼런스룸, 외국어 구사직원, 식사
							포함</div>
						<div class="cal_right_title">객실정보</div>
						<div class="cal_right_content">
							더블룸 : 2인기준(인원추가 불가)<br> 트윈룸(싱글+싱글): 2인기준(인원추가 불가) <br>
							트리플룸(싱글+싱글+싱글): 3인기준(인원추가 불가)
						</div>
						<div class="cal_right_title">주의사항</div>
						<div class="cal_right_content">금연, 화기물품 사용 금지</div>
						<div class="cal_right_title">체크인</div>
						<div class="cal_right_content">오후 2:00 이후</div>
						<div class="cal_right_title">체크아웃</div>
						<div class="cal_right_content"
							style="border-radius: 0 0 10px 10px">오후 12:00 이전</div>
					</div>
					<p class="pClear">&nbsp;</p>
				</div>
				<!-- bottom_seciotn 끝 -->
				<div class="bottom_content">
					<div id="info_main">호텔 소개</div>
					<pre id="info_content">${hotel.content }<input type="hidden"
							name="content" value="${hotel.content }">
					</pre>
				</div>
				<div class="map_txt_area">
					<p class="map_txt">지도</p>
				</div>
				<div class="map_area">
					${hotel.mapurl }
				</div>
				<!-- bottom_content 끝 -->
	</form>

	<div class="btn_div">
		<div class="btn_in">
			<form action="hotelupdate.do" method="post">
				<c:if test="${login.auth eq '1' }">
					<button type="submit" class="snip1535" title="수정">수정</button>
					<button type="button" class="snip1535" title="삭제"
						onclick="return delHotel()">삭제</button>
					<input type="hidden" value="${hotel.seq }" name="seq">
				</c:if>
				<button type="button" class="snip1535" title="글목록"
					onclick="location.href='hotellist.do'">글목록</button>
			</form>
		</div>
	</div>
	<!-- btn_div끝 -->
	<!-- TODO -->
	<p class="pClear">&nbsp;</p>
	<div class="reply_container">
		<p class="reply_category">고객후기</p>
		<div class="reply_container_in">
			<table class="replyTb" style="width: 100%">
				<c:if test="${empty reply }">
					<tr>
						<td colspan="2" style="text-align: center;">작성된 후기가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty reply }">
					<c:forEach items="${reply }" var="r" varStatus="vs">
						<c:if test="${r.del eq '1' }">
							<%ReplyDto re = (ReplyDto)pageContext.getAttribute("r"); %>
							<tr>
								<td></td>
								<td colspan="2"><font color="red"><%=HotelUtil.arrow(re.getStep()) %><b>작성자에
											의해 삭제된 후기입니다.</b></font>
							</tr>
						</c:if>
						<c:if test="${r.del eq'0' }">
							<tr>
								<td></td>
								<td style="padding-bottom: 30px;">
									<%ReplyDto re = (ReplyDto)pageContext.getAttribute("r"); %> <%=HotelUtil.arrow(re.getStep()) %><sapn>
									<font id="review_name">${r.name }</font> <font
										id="review_wdate">(${r.wdate })</font> </sapn> <span class="aRight">
										<c:if test="${r.step eq '0' }">
											<img alt="이미지없음" id="review_star_result"
												src="<%=request.getContextPath()%>/resources/images/star/star_<%=HotelUtil.xxx(re.getGrade())%>.png">
											<span id="reivew_star_txt"><%=HotelUtil.xxx(re.getGrade()) %>
											</span>
										</c:if>
										<div style="float: right">
											<c:if test="${r.step eq '0' && login.auth eq '1'}">
												<a class="btnReply review_coment" val1="${r.seq }">[코멘트 달기]</a>
											</c:if>
											<c:if test="${r.id eq login.id || login.auth eq 1}">
												<a id="delReply"
													href="delreply.do?seq=${r.seq }&pseq=${r.pseq}&id=${r.id}"
													class="review_coment">[삭제]</a>
											</c:if>
										</div>
								</span>
								</td>
							</tr>
							<p class="pClear"></p>
							<tr>
								<td></td>
								<td>
									<%re = (ReplyDto)pageContext.getAttribute("r"); %>
									<div class="<%=HotelUtil.nArrow(re.getStep()) %>">
										<%-- 	               <textarea id="showContent"readonly="readonly" rows="5" cols="90" style="border:none;height:auto;resize: none;" class="wrap">${r.content }</textarea> --%>
										<!-- 					<p class="triangle-right left"> -->
										<p id="content" name="content" class="bubble">${r.content }</p>
										<!-- 					</p> -->
									</div>
								</td>
							</tr>

						</c:if>
						<tr>
							<td colspan="2">
								<div id="${r.seq }" Class="inputReply" style="display: none">
									<form action="addRereply.do" method="post" id="addRep"
										onsubmit="return reNullchk02('${r.seq}')" class="replyFrm02">
										<input type="hidden" name="ref" id="ref" value="${r.ref }">
										<input type="hidden" name="step" id="step" value="${r.step }">
										<input type="hidden" name="pseq" id="pseq"
											value="${hotel.seq }"> <input type="hidden" name="id"
											id="id" value="${login.id }">
										<table class="inputReplyTb">
											<col width="*">
											<col width="20%">
											<tr>
												<td colspan="2" style="border-top: 1px solid #e9e9e9">
													<label id="admin_coment">관리자 코멘트</label>
												</td>
											</tr>
											<tr>
												<td style="padding: 20px 0 0 20px;"><textarea rows="5"
														cols="110" name="content" id="content"
														class="review_write_area"> </textarea></td>
												<td style="padding-left: 30px;"><input type="submit"
													value="댓글달기"
													class="btn btn-outline-primary btn-sm ver_bottm"> <input
													type="button" value="취소"
													class="btn btn-outline-warning btn-sm ver_bottom"
													onclick="cancelReply('${r.seq}')"></td>
											</tr>
										</table>
									</form>
								</div> <!--             <hr style="border: 1px solid #e8e8e8;"> -->
							</td>
						</tr>

					</c:forEach>
				</c:if>
			</table>

			<div class="paging_div">
				<jsp:include page="paging.jsp">
					<jsp:param name="actionPath" value="hoteldetail.do" />
					<jsp:param name="nowPage" value="${paging.nowPage }" />
					<jsp:param name="totalCount" value="${paging.totalCount }" />
					<jsp:param name="countPerPage" value="${paging.countPerPage }" />
					<jsp:param name="blockCount" value="${paging.blockCount }" />

					<jsp:param name="seq" value="${hotel.seq }" />
				</jsp:include>
			</div>
			<form action="addReply.do" method="post" class="replyFrm01"
				onsubmit="return reNullchk01()">

				<div class="review_write">
					<p id="review_write_txt">후기 작성</p>
					<input type="hidden" name="pseq" id="pseq" value="${hotel.seq }">
					<input type="hidden" name="id" value="${login.id }">
					<table class="inputReplyTb" style="margin: auto">
						<col width="*">
						<col width="20%">
						<c:if test="${empty login }">
				로그인 후 이용해주세요
			</c:if>
						<tr>
							<td><textarea rows="5" cols="100" name="content"
									id="content" class="review_write_area"></textarea></td>
							<td>
								<div class="review_write_submit">
									<div class="review_write_right">
										<label>평점 주기</label> <span class="star-input"
											style="padding: 0 0 0 0"> <span class="input">
												<input type="radio" name="star-input" value="0.5" id="p1">
												<label for="p1">0.5</label> <input type="radio"
												name="star-input" value="1.0" id="p2"> <label
												for="p2">1.0</label> <input type="radio" name="star-input"
												value="1.5" id="p3"> <label for="p3">1.5</label> <input
												type="radio" name="star-input" value="2.0" id="p4">
												<label for="p4">2.0</label> <input type="radio"
												name="star-input" value="2.5" id="p5"> <label
												for="p5">2.5</label> <input type="radio" name="star-input"
												value="3.0" id="p6"> <label for="p6">3.0</label> <input
												type="radio" name="star-input" value="3.5" id="p7">
												<label for="p7">3.5</label> <input type="radio"
												name="star-input" value="4.0" id="p8"> <label
												for="p8">4.0</label> <input type="radio" name="star-input"
												value="4.5" id="p9"> <label for="p9">4.5</label> <input
												type="radio" name="star-input" value="5.0" id="p10">
												<label for="p10">5.0</label>
										</span> <output for="star-input"
												style="font-weight:200; color:#00aef0; text-align:left;font-size:24px;padding-left:15px;">
											<b>0</b></output> <input type="hidden" id="grade" name="grade"
											value="0.0"> <input type="hidden" name="pseq"
											value="${hotel.seq }">
										</span>
										<script
											src="<%=request.getContextPath() %>/resources/js/star.js"></script>
									</div>
									<!-- review_write_right -->
									<input type="submit" value="댓글달기"
										class="btn btn-outline-primary">
								</div>
							</td>
						</tr>
					</table>
			</form>
		</div>
		<!-- review_write 끝 -->
		<div>
			<!-- reply_container_in 끝 -->
		</div>
		<!-- reply_container -->
	</div>
	<!-- sub-container 끝 -->
	</div>
	<!--  main_container 끝 -->

	<!-- TODO -->
	<script type="text/javascript">

$('.slider-for').slick({
	   slidesToShow: 1,
	   slidesToScroll: 1,
	   arrows: false,
	   fade: true,
	   asNavFor: '.slider-nav'
	 });
	 $('.slider-nav').slick({
	   slidesToShow: 5,
	   slidesToScroll: 1,
	   asNavFor: '.slider-for',
	   dots: true,
	   focusOnSelect: true
	 });

	 $('a[data-slide]').click(function(e) {
	   e.preventDefault();
	   var slideno = $(this).data('slide');
	   $('.slider-nav').slick('slickGoTo', slideno - 1);
	 });
var IMP = window.IMP;
/* 작은이미지 hover시 메인이미지띄우기 */
$(".pdsImg").hover(function () {
	var _path = $(this).attr("src");
	
	$("#pictureDetail").attr("src",_path);
});
var disableDays;
$(document).ready(function () {
	
	/* 총 금액에 콤마 붙이기 */
	
	var num = "${hotel.price}"
  	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	
  	num.toString().replace(regexp, ',');
	
	/* 페이지로드시 자동으로 새로고침한번 */
	if (location.href.indexOf('#reload') == -1){
	  location.href += '#reload'
	}
	
	IMP.init('imp00843069');
	/* 최초 로딩시 첫 이미지 메인이미지칸에 띄워주기 */
	var _path = $("#pds1").attr("src");
	$("#pictureDetail").attr("src",_path);
	 
	 /* 별점 결과 width */
	 var lWidth = <%=HotelUtil.xxx(h.getGrade()) %> * 30;
	 
	 $(".star-input.input").attr("width",lWidth);
	 
	 
});

/* 데이트피커 */
var rangeDate = 31; // set limit day
var setSdate, setEdate;
$("#from").datepicker({
    dateFormat: 'yy-mm-dd',
    minDate: 0,
    maxDate: new Date('<%=tyear+1%>-<%=tmonth%>-<%=tday%>'),
    beforeShowDay: disableAllTheseDays,
    onSelect: function(selectDate){
        var stxt = selectDate.split("-");
            stxt[1] = stxt[1] - 1;
        var sdate = new Date(stxt[0], stxt[1], stxt[2]);
        var edate = new Date(stxt[0], stxt[1], stxt[2]);
            edate.setDate(sdate.getDate() + rangeDate);
        
        $('#to').datepicker('option', {
            minDate: selectDate,
            maxDate: new Date('<%=tyear+1%>-<%=tmonth%>-<%=tday%>'),
            beforeShow : function () {
            setSdate = selectDate;
        }});
        //to 설정
    }
    //from 선택되었을 때
});

$("#to").datepicker({ 
    dateFormat: 'yy-mm-dd',
    minDate: 0,
    maxDate: new Date('<%=tyear+1%>-<%=tmonth%>-<%=tday%>'),
    beforeShowDay: disableAllTheseDays,
    onSelect : function(selectDate){
        setEdate = selectDate;
        /* 시작~ 종료 일 사이에 선택불가능한값이 포함되어있으면 막아주기 */
        var sDate = $("#from").val();
		sDate.replace('/', '-');
		
		var listDate = [];
		var disableDays = [<%=strDate%>];
		/* 시작날짜,끝날짜 를 listDate에 담아줌 */
	    getDateRange(sDate, selectDate, listDate);
	    for(i = 0 ; i <listDate.length; i ++){
	    	for ( j = 0 ; j<disableDays.length; j ++){
	    		console.log(listDate[i] +" == " + disableDays[j] + " : " + listDate[i] == disableDays[j] );
	    		if(listDate[i] == disableDays[j]){
	    			/* 시작날 ~ 끝날 중에 방이없는날 포함되어있으면 못하게함 */
	    			alert("예약이 불가능한 날짜가 포함되어 있습니다.");
	    			$("#to").val("");
	    			return;
	    		}
	    	}
	    }
	    var dCount = listDate.length -1;
	    if(dCount == 0){
	    	dCount = 1;
	    }
	    var tPrice = dCount * ${hotel.price};
	    $("#re_price").val(tPrice);
	    tPrice = addComma(tPrice);
	    $("#totalPrice").text(tPrice);
    }
});
/* 두날짜 사이값 가져오기 */
function getDateRange(startDate, endDate, listDate){
    var dateMove = new Date(startDate);
    var strDate = startDate;

    if (startDate == endDate){
        var strDate = dateMove.toISOString().slice(0,10);
        listDate.push(strDate);
    }else{
        while (strDate < endDate){
        	var strDate = dateMove.toISOString().slice(0, 10);
            listDate.push(strDate);
            dateMove.setDate(dateMove.getDate() + 1);
        }
    }
    return listDate;
};

//특정일 선택막기
function disableAllTheseDays(date) {
	var disableDays = [<%=strDate%>];
    var m = date.getMonth() +1;
    var d = date.getDate();
    var y = date.getFullYear();
    m = String(m)
    d = String(d)
    if(m.length<2){
 	   m = "0" + m;
    }
    if(d.length<2){
 	   d = "0" + d;
    }
    var toDate = y + '-' + m + '-' + d;
    for (i = 0; i < disableDays.length; i++) {
        if($.inArray(toDate,disableDays) != -1) {
            return [false];
        }
    }
    return [true];
}
/* 결제창 */
function imp(){
	if(${empty login}){
		alert("로그인 후 이용 가능합니다.");
		return false;
	}
	
	var sDate = $("#from").val();
	var eDate = $("#to").val();
	
	if(sDate == "" || sDate == null || eDate =="" || eDate == null){
		alert("날짜를 선택해 주세요");
		return false;
	}
	
	if(!confirm("해당 날짜로 예약하시겠습니까?")){
		return false;
	}
	/* 아임포트 응답 */
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : new Date().getTime(),
	    name : '${hotel.title}',
	    amount : $("#re_price").val(),
	    language: "ko",
	    buyer_email : '${login.email}',
	    buyer_name : '${login.id}',
	    buyer_tel : '${login.phone}',
	    buyer_addr : '${login.address}'
	    /* imp_uid(가맹점번호), merchant_uid(상품고유번호) imp_success(결제성공여부)*/
	}, function(rsp) {
	    if ( rsp.success ) {
	    	$("#merchant").val(rsp.merchant_uid);
			$("#reserveFrm").submit();
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	   		var msg = '결제가 완료되었습니다.';
	   		msg += '\n고유ID : ' + rsp.imp_uid;
	   		msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	   		msg += '\결제 금액 : ' + rsp.paid_amount;
    		msg += '카드 승인번호 : ' + rsp.apply_num;				
	    	
    		alert(msg);
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        alert(msg);
	    }
	});
}

/* 온서브밋 */
function _reserve(){
	return true;
}

//대댓글입력창
$(".btnReply").click(function() {
    $("#"+$(this).attr("val1")).show();
 });

//대댓글입력창 숨기기
function cancelReply( divid ){
   $($("#" + divid)).hide();
}

/* 댓글 널체크검사 */
function reNullchk01() {
	   if(${empty login}){
			alert("로그인 후 가능합니다");
			return false;
		}
	   if($("#grade").val()==0.0){
		   alert("평점을 등록해주세요");
		   return false;
	   }
	   if( $.trim($(".replyFrm01 #content").val())=="" || $.trim($(".replyFrm01 #content").val())==null){
	      alert("내용을 입력해 주세요");
	      return false;
	   }
	   return true;
}
function reNullchk02( id ) {
	   if(${empty login}){
			alert("로그인 후 가능합니다");
			return false;
		}
	   if( $.trim($("#" + id + " #content").val())=="" || $.trim($("#" + id + " #content").val())==null){
	      alert("내용을 입력해 주세요");
	      return false;
	   }
	   return true;
}
function delHotel(){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href='hoteldelete.do?seq=' + ${hotel.seq};
	}
}
/* 숫자에 콤마붙여주기 */
function addComma(num) {
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
	}
	
	
/* 수정버튼*/
$(".hover").mouseleave(
  function() {
    $(this).removeClass("hover");
  }
);
</script>
</body>
</html>