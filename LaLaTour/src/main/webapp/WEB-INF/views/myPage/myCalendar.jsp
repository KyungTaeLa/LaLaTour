<%@page import="lala.com.a.model.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="lala.com.a.model.MemberDto"%>
<%@page import="lala.com.a.util.MyCalendarUtil"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%
	Calendar cal = Calendar.getInstance();
cal.set(Calendar.DATE, 1);			// 1일

MemberDto member = (MemberDto)session.getAttribute("login");

String syear = request.getParameter("year");
String smonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
if(MyCalendarUtil.nvl(syear) == false){	// 파라미터가 넘어 온 경우
	year = Integer.parseInt(syear);
}

int month = cal.get(Calendar.MONTH) + 1;
if(MyCalendarUtil.nvl(smonth) == false){	// 파라미터가 넘어 온 경우
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

// <<
String pp = String.format("<a href='%s?year=%d&month=%d&id=%s' class='cal_point' style='color:white'>"
					+ "◀◀</a>", 
					"myCalendar.do", year-1, month,member.getId());
// <
String p = String.format("<a href='%s?year=%d&month=%d&id=%s' class='cal_point' style='color:white'>"
					+ "◀</a>", 
					"myCalendar.do", year, month-1,member.getId());
// >
String n = String.format("<a href='%s?year=%d&month=%d&id=%s' class='cal_point' style='color:white'>"
					+ "▶</a>", 
					"myCalendar.do", year, month+1,member.getId());

// >>
String nn = String.format("<a href='%s?year=%d&month=%d&id=%s' class='cal_point' style='color:white'>"
					+ "▶▶</a>", 
					"myCalendar.do", year+1, month,member.getId());


List<CalendarDto> list = (List<CalendarDto>)request.getAttribute("calendar");
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
<style>
.main-container{
	width:100%;
 	margin:50px;
}
/* 칼린더  */
.cal_div{
	float:left;
}
.calendar_tb{
	border-radius: 50px !important;
	border-collapse: collapse;
	font-family: 'Montaga', serif;
	margin-top:40px;
}
#ym_section{
	border-bottom:6px solid #3378AF;
	background-color: #388BCC;
	color:white !important;
}
.cal_point{
	color:white;
	font-weight: bold;
}
.cal_point:link{text-decoration: none;}
.cal_point:visited{text-decoration: none;}
.cal_point:active{text-decoration: none;}
.cal_point:hover{text-decoration: none;}
#cal_week{
	background-color: #EFEFEF;
	font-weight: bold;
}
.cal_day{
	text-align:center;
	font-weight: bold;
	text-align: left;
	height:95px;
	valign:top;
	border-bottom:1px solid #EFEFEF;
}
#top_info{
	font-size: 30px;
	padding-left:20px;
	margin:30px 0px;
	font-weight: bold;
}
</style>
</head>
<body>
<div class="main-container">
<p id="top_info">캘린더</p>
<hr style="border:1px solid gray">

<div align="center">
<div class="cal_div">
<table id="calendar" class="calendar_tb">
<col width="100"><col width="100"><col width="100"><col width="100">
<col width="100"><col width="100"><col width="100">

<tr height="70">
	<td colspan="7" align="center" id="ym_section">
		<div style="width: 100%; padding: 0px 10px 0px 10px;">
			<div style="float: left; padding-top: 49px;">
				<%=pp %>&nbsp;&nbsp;&nbsp;<%=p %>
			</div>
			<div style="float: right; padding-top: 49px; margin-right:30px;">
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
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		for(int i = 1;i <= lastDay; i++){
		%>
	<td><%=MyCalendarUtil.callist(year, month, i)%>
		<%=MyCalendarUtil.makeTable(year, month, i, list,member.getId())%>
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
</div><!-- cal_div -->
<p style="clear:both">&nbsp;</p>
</div>
</div><!-- main-container -->







</body>
</html>