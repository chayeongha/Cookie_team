package com.cookie.basic.board;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cookie.basic.board.review.ReviewMapper;
import com.cookie.basic.cart.OrderListVO;

@SpringBootTest
class ReviewTest {

	@Autowired
	private ReviewMapper reviewMapper;
	
	@Test
	void selectTest() throws Exception {
		OrderListVO orderListVO = new OrderListVO();
		orderListVO.setOlNum(68);
		orderListVO = reviewMapper.orderSelect(orderListVO);
		
		assertNotNull(orderListVO);
	}

}
