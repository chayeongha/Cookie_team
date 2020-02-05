package com.cookie.basic.cart;

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
	public int cartInsert(CartVO cartVO, String[] optNum/*CartOptionVO[] cartOptionVOs*/, HttpSession session) throws Exception {
		System.out.println("들어와자식아");
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		//String nickname = memberVO.getNickname();
		String nickname = "a1";
		int result = 0;
		
		//System.out.println(cartOptionVOs[0].getOptNum());
		System.out.println(optNum[0]);
		
		if (nickname != null && nickname != "" && cartVO != null) {
			cartVO.setNickname(nickname);
			//result = cartService.cartInsert(cartVO, cartOptionVOs);
		}
		
		return result;
	}


	
	
	

}
