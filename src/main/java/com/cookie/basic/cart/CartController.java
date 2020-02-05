package com.cookie.basic.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cookie.basic.member.MemberVO;

@Controller
@RequestMapping("/cart/**")
public class CartController {

	@Autowired
	private CartService cartService;

	//카트 중복 검사
	public void cartSelect(CartVO cartVO, CartOptionVO[] cartOptionVO) throws Exception {
		 
		
	}
	
	
	
	
	
	// 카트에 집어넣기
	@ResponseBody
	@PostMapping("cartInsert")
	public int cartInsert(String mmNum, String mmCount,String[] optNum, String[] optCount, HttpSession session) throws Exception {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String nickname = memberVO.getNickname();
		CartVO cartVO = new CartVO();
		cartVO.setNickname(nickname);
		cartVO.setMmNum(Integer.parseInt(mmNum));
		cartVO.setMmCount(Integer.parseInt(mmCount));
		List<CartOptionVO> cartOptionVOs = new ArrayList<>();
		String lot ="";
		for(int i=0; i<optNum.length;i++) {
			CartOptionVO cartOptionVO = new CartOptionVO();
			cartOptionVO.setCartNum(cartVO.getCartNum());
			cartOptionVO.setOptNum(Integer.parseInt(optNum[i]));
			cartOptionVO.setOptCount(Integer.parseInt(optCount[i]));
			
			cartOptionVOs.add(cartOptionVO);
			lot = lot + optNum[i]+optCount[i];
		}
		
		cartVO.setLot(lot);
		int result= 0;
		if(cartService.cartOne(cartVO)==null) {
			result = cartService.cartInsert(cartVO);
			cartVO = cartService.cartOne(cartVO);
			result = cartService.cartInsert2(cartOptionVOs);
		}else {
			cartVO = cartService.cartOne(cartVO);
			int count = cartVO.getMmCount();
			cartVO.setMmCount(count+Integer.parseInt(mmCount));
			cartService.cartAdd(cartVO);
		}
		
		return result;
	}


	
	
	

}
