package com.cookie.basic.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	
	//카트에 집어넣기 
	@GetMapping("cartInsert")
	public void cartInsert(CartVO cartVO)throws Exception {
		
	}
	
	
	
	
}
