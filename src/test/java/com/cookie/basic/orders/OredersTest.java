package com.cookie.basic.orders;


import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cookie.basic.cart.OrderListVO;
@SpringBootTest
class OredersTest {
	
	@Autowired
	private OrdersMapper ordersMapper;
	

	
	//@Test
	public void orderInserttest() throws Exception{
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setNickname("관리자");
		ordersVO.setOoTotal(123123);
		ordersVO.setPhone("010-7173-8910");
		ordersVO.setSsNum(2);
		ordersVO.setTakeOut(1);
		
		int result = ordersMapper.ordersInsert(ordersVO);
	}
	
	//@Test
	public void orderUpdate()throws Exception{
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setOoNum(1);
		
		int result = ordersMapper.ordersUpdate(ordersVO);
		
	}
	
	//@Test
	public void orderListInsert()throws Exception{
		OrderListVO orderListVO = new OrderListVO();
		orderListVO.setCartNum(2);
		orderListVO.setOoNum(2);
		
		int result = ordersMapper.orderListInsert(orderListVO);
	}
	
	//@Test
	public void orderListSelectList()throws Exception{
		OrderListVO orderListVO = new OrderListVO();
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setNickname("name1");
		
		List<OrderListVO> listVOs = ordersMapper.orderListList(ordersVO);
		
		for(int i=0; i<listVOs.size();i++) {
		System.out.println(listVOs.get(i).getCartVO().getMmNum())	;
			System.out.println(listVOs.get(i).getOrdersVO().getPhone());
			
		}
		
	}
	
	//@Test
		public void orderListSS()throws Exception{
			OrderListVO orderListVO = new OrderListVO();
			OrdersVO ordersVO = new OrdersVO();
			ordersVO.setSsNum(1);
			
			List<OrderListVO> listVOs = ordersMapper.orderListSS(ordersVO);
			
			for(int i=0; i<listVOs.size();i++) {
			System.out.println(listVOs.get(i).getCartVO().getMmNum())	;
				System.out.println(listVOs.get(i).getOrdersVO().getPhone());
				
			}
			
		}
		


	
	
	
}
