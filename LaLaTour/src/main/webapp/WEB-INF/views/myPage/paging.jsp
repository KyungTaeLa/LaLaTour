<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String actionPath = request.getParameter("actionPath");	// actionPath:bbslist.jsp

String sNowPage = request.getParameter("nowPage");		// 현재 페이지
String sTotalCount = request.getParameter("totalCount");// 올린 글수
String sCountPerPage = request.getParameter("countPerPage");	// 10
String sBlockCount = request.getParameter("blockCount");		// 10
// String seq = request.getParameter("seq");

int nowPage = (sNowPage == null || sNowPage.trim().equals(""))?1:Integer.parseInt(sNowPage);
int totalCount = (sTotalCount == null || sTotalCount.trim().equals(""))?1:Integer.parseInt(sTotalCount);
int countPerPage = (sCountPerPage == null || sCountPerPage.trim().equals(""))?1:Integer.parseInt(sCountPerPage);
int countPerBlock = (sBlockCount == null || sBlockCount.trim().equals(""))?1:Integer.parseInt(sBlockCount);

String findWord = request.getParameter("findWord");
String choice = request.getParameter("choice");
// String place = request.getParameter("place");
String id = request.getParameter("id");


// total page
int totalPage = (int)((totalCount - 1) / countPerPage) + 1;
//		3     =			(23        - 1  / 10)  

int totalBlock = (int)((totalPage - 1) / countPerBlock);
//							3          /      10    -> 0   [1] ~ [10] [11] ~ [20]
int nowBlock = (int)((nowPage - 1) / countPerBlock);
// nowBlock : 0 -> [1] ~ [10]
// nowBlock : 1 -> [11] ~ [20]		

int firstPage = 0;	
int prevPage = 0;	// [첫번째페이지][이전페이지][1][2][3][다음페이지][끝페이지]
int nextPage = 0;
int lastPage = 0;

if(nowBlock > 0){
	firstPage = 1;
}
if(nowPage > 1){
	prevPage = nowPage - 1;
}

int startPage = nowBlock * countPerBlock + 1;
//    1		 0		 *		10       + 1
int endPage = countPerBlock * (nowBlock + 1);
//	10				10		* (	 0      + 1)	


// 최대 페이지보다 끝페이지가 큰경우
if(endPage > totalPage) endPage = totalPage;

if(nowPage < totalPage){
	nextPage = nowPage + 1;
}
if(nowBlock < totalBlock){	// 0(1 ~ 10) 1(11 ~ 20) 2
	lastPage = totalPage;
}
%>

<%
System.out.println("paging.jsp");
System.out.println("actionpath : " + actionPath);
%>

<form action="<%=actionPath %>" name="frmPaging" method="get" id="frmPaging">
	<input type="hidden" name="nowPage" id="nowPage">
<%-- 	<input type="hidden" name="findWord" value="<%=findWord %>"> --%>
	<input type="hidden" name="findWord" value="<%=findWord %>">
	<input type="hidden" name="choice" value="<%=choice %>">
<%-- 	<input type="hidden" name="place" value="<%=place%>"> --%>
<%-- 	<input type="hidden" name="seq" value="<%=seq%>"> --%>
<input type="hidden" name="id" value="<%=id %>">
	
	<div class="paging">
		<nav class="btPage" aria-label="Page navigation example">
  			<ul class="pagination justify-content-center">
	    		<li class="page-item">	
			<!-- 첫페이지로 (총 글수가 100개 이상일 시에 보임)-->
			<%if(firstPage > 0){ %>
				<a href="#" aria-label="Previous" class="page-link" onclick="gotoPage('<%=firstPage %>')">
					<<
				</a>
			<%} %>
				</li>
				
			<!-- 이전페이지로 -->
			<%if(prevPage > 0){ %>
			<li class="page-item">	
				<a href="#" class="page-link" aria-label="Next" onclick="gotoPage('<%=prevPage %>')"><</a>
			</li>
			<%} %>
			
			<!-- [1][2][3]4[5][6] --> 
			<%
			for(int i = startPage; i <= endPage; i++){
				if(i == nowPage){	
				%>
				<li class="page-item active" aria-current="page">
					<div class="page-link">
						<%=i %><span class="sr-only">(current)</span>
					</div>
				</li>
				<%	
				}else{
				%>
				<li class="page-item">
					<a href="#" class="page-link" onclick="gotoPage('<%=i %>')"><%=i %></a>
				</li>
				<%
				}			
			}		
			%>
			<!-- 다음 페이지 -->
			<%if(nextPage > 0){ %>
			<li class="page-item">
				<a href="#" class="page-link" aria-label="Next" onclick="gotoPage('<%=nextPage %>')">></a>
			</li>
			<%} %>
			
			<!-- 끝페이지 (총 글수가 100개 이상일 시에 보임)-->
			<%if(lastPage > 0){ %>
				<li class="page-item">
					<a href="#" class="page-link" aria-label="Next" onclick="gotoPage('<%=lastPage %>')">
						>>
					</a>
				</li>
			<%} %>
			</ul>
		</nav>
	</div>
</form>
<script type="text/javascript">
function gotoPage(pageNum) {
	$("#nowPage").val(pageNum);

	var now = $("#nowPage").val();
	$("#frmPaging").submit();
}

</script>

