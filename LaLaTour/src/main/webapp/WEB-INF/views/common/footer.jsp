<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/top_footer1.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/top_footer2.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/top_base4.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/top_footer3.css">
<style>
.pt {
	padding-top: 10px;
	color: white;
}
li {
	list-style: none;
}

a{
	text-decoration: none;
}
</style>


<div class="wrapper">

<footer>
	<div class="footer-inner">
		<ul class="footer-menu">
			<li><a href="#">축제</a>
				<ul>
					<li><a href="festivalList.do">목록</a></li>
					<li><a href="reviewList.do">후기</a></li>
				</ul></li>
			<li><a href="#">명소추천</a>
				<ul>
					<li><a href="location_attrac.do">지역명소</a></li>
					<li><a href="location_food.do">음식점</a></li>
					<li><a href="location_shop.do">쇼핑</a></li>
				</ul></li>
				
			<li><a href="/travel-info-kr">커뮤니티</a>
				<ul>
					<li><a href="bbsList.do">공지사항</a></li>
					<li><a href="meeting.do">참여게시판</a></li>
					<li><a href="bbsList.do">자유게시판</a></li>
				</ul></li>
				
			<li><a href="#">부가서비스</a>
				<ul>
					<li><a href="hotellist.do">호텔</a></li>
					<li><a href="productlist.do">특산품</a></li>
				</ul></li>
		</ul>
		<div class="footer-other">
			<!--  -->
			<div class="other-element e1">
				<p class="other-title">제공</p>
				<a href="http://www.seoul.go.kr/" target="_blank"
					title="서울특별시 페이지로 새창열림">
				</a>
				<p class="copyright-text1"> 서울특별시 강남구 테헤란로14길 6<br> 남도빌딩 2F</p>
				<!-- <ul class="terms-menu">
					<li><a href="https://www.seoul.go.kr/member/rule/rule.do"
						target="_blank" title="새창열림">회원약관</a></li>
					<li><a href="http://www.seoul.go.kr/v2007/help/privacy.html"
						target="_blank" title="새창열림">개인정보처리방침</a></li>
				</ul> -->
			</div>
			<div class="other-element e2">
				<p class="other-title">운영</p>
				<a href="#" target="_blank"
					title="서울관광재단 페이지로 새창열림"><!-- http://www.sto.or.kr -->
				</a>
				<ul class="copyright-text1">
					<li><img alt="" src="<%=request.getContextPath() %>/resources/images/clock.jpg">월~금, 오전 10시~오후 7시</li>
					<li><img alt="" src="<%=request.getContextPath() %>/resources/images/msm.jpg"></span>qsdfc12@naver.com</li>
					<li><img alt="" src="<%=request.getContextPath() %>/resources/images/cool.jpg">02-0110-8188(한국어)</li>
				</ul>
			</div>
			<div class="other-element e3">
				<p class="other-lank">
					<a href="#"
						title="새창열림" target="_blank">일반 관광 문의<span></span></a>
						<!-- http://kto.visitkorea.or.kr/kor/customer/call/1330.kto -->
				</p>
				<p class="other-1330">
					<a href="#"
						target="_blank" title="관광통역안내전화 1330 페이지로 새창열림"><img
						src="<%=request.getContextPath() %>/resources/images/phone.png"
						alt="이미지없음">
						
					</a>
					<!-- http://kto.visitkorea.or.kr/kor/customer/call/1330.kto -->
				</p>
				<!-- <p class="other-lank">
					<a
						href="http://korean.visitseoul.net/essential-Info-article/%EA%B4%80%EA%B4%91%EB%B6%88%ED%8E%B8%EC%B2%98%EB%A6%AC%EC%84%BC%ED%84%B0_/18940"
						target="_blank" title="관광불편처리센터 페이지로 새창열림">관광불편처리센터<span></span></a>
				</p>
				<p class="other-lank">
					<a
						href="https://www.tripadvisor.co.kr/Tourism-g294197-Seoul-Vacations.html"
						target="_blank" title="새창열림">서울여행리뷰TripAdvisor<span></span></a>
				</p> -->
			</div>
			<!-- <div class="other-element e4">
				<p class="other-title">iTourSeoul 모바일 앱</p>
				<p class="other-btn">
					<a
						href="https://play.google.com/store/apps/details?id=com.sto.android.client.itourseoul"
						target="_blank" title="새창열림"><img
						src="/humanframe/theme/visitseoul/assets/images/2018/img-googleplay.png"
						alt="google play"></a> <a
						href="https://itunes.apple.com/app/i-tour-seoul/id360156429"
						target="_blank" title="새창열림"><img
						src="/humanframe/theme/visitseoul/assets/images/2018/img-appstore.png"
						alt="app store"></a>
				</p>
			</div> -->
		</div>
	</div>
	<div class="copyright">© 2018 Seoul Metropolitan Government. All
		rights reserved</div>
</footer>
</div>
