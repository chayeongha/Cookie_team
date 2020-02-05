package com.cookie.basic.cart;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

	@Autowired
	private CartMapper cartMapper;
	
	
	//카트 넣기
	@Transactional
	public int cartInsert(CartVO cartVO, CartOptionVO[] cartOptionVOs)throws Exception{
		
		int result = cartMapper.cartInsert(cartVO);
		
		for (CartOptionVO cartOptionVO : cartOptionVOs) {
			
			result = cartMapper.cartOptionInsert(cartOptionVO);
		}		
		
		
		return result;
	}
	

	
	
}
