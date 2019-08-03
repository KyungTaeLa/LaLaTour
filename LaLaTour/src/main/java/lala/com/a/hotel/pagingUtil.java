package lala.com.a.hotel;

public class pagingUtil {
	
	public static pagingBean setPagingInfo(pagingBean paging, String command) {
		if(command.equals("HotelList")) {
			paging.setCountPerPage(9);		// [1]	-> 10
		}else if(command.equals("replyList")) {
			paging.setCountPerPage(20);
		}else {
			paging.setCountPerPage(10);
		}
		paging.setBlockCount(10);		// [1] ~ [10]
		
		paging.setStartNum( paging.getTotalCount() 
				- (paging.getNowPage()-1) * paging.getCountPerPage() );
		/*
			23 -> / 10	-> 2
			23 -> % 10 > 0 -> + 1	==> 3
					 
			23 - (1 - 1) * 10 = 23 			23	 
			23 - (2 - 1) * 10 = 13			13
			23 - (3 - 1) * 10 = 3			3		
						
						[1][2][3]		
		*/
		return paging;
	}

}
