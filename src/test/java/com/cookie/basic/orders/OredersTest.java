package com.cookie.basic.orders;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
@SpringBootTest
class OredersTest {
	
	@Autowired
	private OrdersMapper ordersMapper;
	

	
	//@Test
	public void orderInserttest() throws Exception{
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setNickname("name1");
		ordersVO.setOoTotal(123123);
		ordersVO.setPhone("010-1111-1111");
		ordersVO.setSsNum(1);
		ordersVO.setTakeOut(1);
		
		int result = ordersMapper.ordersInsert(ordersVO);
	}
	
	@Test
	public void orderUpdate()throws Exception{
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setOoNum(1);
		
		int result = ordersMapper.ordersUpdate(ordersVO);
		
	}
	
	

		


	
	
	
}
