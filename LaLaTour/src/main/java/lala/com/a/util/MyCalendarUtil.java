package lala.com.a.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import lala.com.a.model.CalendarDto;


public class MyCalendarUtil {
	
	public static boolean nvl(String msg) {
		return msg == null || msg.trim().equals("")?true:false;
	}
	

	// 날짜를 클릭하면, 그날의 일정이 모두 보이도록 하는 callist.jsp로 이동시키는 함수
	public static String callist(int year, int month, int day) {
		String s = "";
		
		s = "<font>";
		s += String.format("%2d", day);
		s += "</font>";
		
		return s;		
	}
	
	
	// 1 -> 01
	public static String two(String msg) {
		return msg.trim().length()<2?"0"+msg.trim():msg.trim();
	}
	
	// 각 날짜별로 테이블을 생성하는 함수
	public static String makeTable(int year, int month, int day, List<CalendarDto> list,String id)throws Exception {
		
		String s = "";
		String dates = (year + "") + two(month + "") + two(day + ""); // "20190301"
		
		s += "<table>";
		s += "<col width='98'>";
		
		for(CalendarDto dto : list) {			
			if(dto.getTname().equals("HOTEL")) {
				String hotelSdate= dto.getSdate().replace("-", "");
				String hotelEdate= dto.getEdate().replace("-", "");
				
				//int sdate= Integer.parseInt(hotelSdate);
				//int edate = Integer.parseInt(hotelEdate);
				
				//dto.setEdate(hotelSdate);
				Calendar cal = Calendar.getInstance();

				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
				 Date beginDate = formatter.parse(hotelSdate);
				 Date endDate = formatter.parse(hotelEdate);

				    long diff = endDate.getTime() - beginDate.getTime();
				    long diffDays = diff / (24 * 60 * 60 * 1000);
			
				
				//얘를 edate와 sdate 사이 만큼 반복해야해 ㅠㅠ
				//sdate로 시작해서 edate랑 날짜 차이만큼 반복하는데 setEdate를 하루씩더해야해
				    
				  
				    cal.setTime(beginDate);
				   for(long i = 0; i<=diffDays; i++) {
					   
					
					   String sDate = formatter.format(cal.getTime());
				    
					   dto.setEdate(sDate);
				 if(dto.getEdate().substring(0, 8).equals(dates)) { 
				 s += "<tr bgcolor='#388BCC'>";
					s += "<td>";
					
					//참가여부때문에 로그인한 id 필요함
					
					
					s += "<a href='hoteldetail.do?seq=" + dto.getSeq() + "'>";
					s += "<font style='font-size:13px; color:white'>";
					s += dot3( dto.getTitle() );
					s += "</font>";
					s += "</a>";
					
					s += "</td>";
					s += "</tr>";
				 }
				   cal.add(Calendar.DATE, +1);
				    }
				}
			
			if(dto.getTname().equals("MEETING")) {
			if(dto.getEdate().substring(0, 8).equals(dates)) { // 20190301 == dates
				
				s += "<tr bgcolor='green'>";
				s += "<td>";
				
				//참가여부때문에 로그인한 id 필요함
				
				s += "<a href='meetDetail.do?seq=" + dto.getSeq() + "&id=" + id + "'>";
				s += "<font style='font-size:3; color:white'>";
				s += dot3( dto.getTitle() );
				s += "</font>";
				s += "</a>";
				
				s += "</td>";
				s += "</tr>";
			}
			}			
		}	
		s += "</table>";
		
		return s;
		}
	
	
	// 제목이 너무 길면, ...으로 처리할 함수		예) 데이트약속...
	public static String dot3(String msg) {
		String s = "";
		if(msg.length() >= 5) {
			s = msg.substring(0, 5);
			s += "...";
		}else {
			s = msg.trim();
		}	
		return s;
	}
	

}





