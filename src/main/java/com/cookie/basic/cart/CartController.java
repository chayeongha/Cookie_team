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

	// 카트에 집어넣기
	@ResponseBody
	@PostMapping("cartInsert")
	public int cartInsert(CartVO cartVO, HttpSession session) throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String nickname = memberVO.getNickname();
		System.out.println(nickname);
		
		System.out.println(cartVO.getMmNum());
		System.out.println(cartVO.getMmCount());
		
		if (nickname != null && nickname != "") {
			cartVO.setNickname(nickname);
		}
		int result = cartService.cartInsert(cartVO);

		
		
		return result;

	}

}
