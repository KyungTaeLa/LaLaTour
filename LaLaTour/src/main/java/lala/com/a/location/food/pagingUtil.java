package lala.com.a.location.food;

public class pagingUtil {
	
	public static pagingBean setPagingInfo(pagingBean bean, String command) {
		if(command.equals("location_food")) {
			bean.setCountPerPage(9);		// [1]	-> 10
		}else if(command.equals("location_food_reply")) {
			bean.setCountPerPage(20);
		}else {
			bean.setCountPerPage(10);
		}
		bean.setBlockCount(10);		// [1] ~ [10]
		
		bean.setStartNum( bean.getTotalCount() 
				- (bean.getNowPage()-1) * bean.getCountPerPage() );
		/*
			23 -> / 10	-> 2
			23 -> % 10 > 0 -> + 1	==> 3
			23 - (1 - 1) * 10 = 23 			23	 
			23 - (2 - 1) * 10 = 13			13
			23 - (3 - 1) * 10 = 3			3		
						
						[1][2][3]		
		*/
		return bean;
	}

}
