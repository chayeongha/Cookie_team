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
	public int cartInsert(CartVO cartVO)throws Exception{		
		return cartMapper.cartInsert(cartVO);
	}
	@Transactional
	public int cartInsert2(List<CartOptionVO> cartOptionVOs) throws Exception{
		int result = 0;
		for (CartOptionVO cartOptionVO : cartOptionVOs) {		
			result = cartMapper.cartOptionInsert(cartOptionVO);
		}		
		return result;
	}
	
	//카트 중복검사
	public CartVO cartOne(CartVO cartVO) throws Exception{
		return cartMapper.cartOne(cartVO);
	}

	//중복항목 추가
	public int cartAdd(CartVO cartVO) throws Exception{
		return cartMapper.cartAdd(cartVO);
	}
	
	
}
