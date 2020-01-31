package com.cookie.basic.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

	@Autowired
	private CartMapper cartMapper;
	
	
	public int cartInsert(CartVO cartVO)throws Exception{
		return cartMapper.cartInsert(cartVO);
	}
	
	
	public int cartOptionInsert(CartOptionVO cartOptionVO)throws Exception{
		return cartMapper.cartOptionInsert(cartOptionVO);
	}
	
	
}
