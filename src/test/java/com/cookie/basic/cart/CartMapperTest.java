package com.cookie.basic.cart;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
@SpringBootTest
class CartMapperTest {
	
	@Autowired
	private CartMapper cartMapper;
	
	@Test
	public void cartInsertTest() throws Exception{
		CartVO cartVO = new CartVO();
		cartVO.setListNum(1);
		cartVO.setMmCount(1);
		cartVO.setMmNum(1);
		cartVO.setOptCount(1);
		cartVO.setOptNum(1);
		
		int result = cartMapper.cartInsert(cartVO);
		
		assertEquals(result, 1);
		
	}
	
	
	
	
}
