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
import org.springframework.web.servlet.ModelAndView;

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
	public int cartInsert(String mmNum, String mmCount,String[] optNum, String[] optCount, String cartTotal, String cn, HttpSession session) throws Exception {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		int ct = Integer.parseInt(cartTotal);
		int ssNum = Integer.parseInt(cn);
		
		String lot ="";
		String nickname = memberVO.getNickname();
		CartVO cartVO = new CartVO();
		cartVO.setNickname(nickname);
		cartVO.setMmNum(Integer.parseInt(mmNum));
		cartVO.setMmCount(Integer.parseInt(mmCount));
		cartVO.setCartTotal(ct);
		cartVO.setSsNum(ssNum);
		if(optNum==null) {
			lot = mmNum;
			cartVO.setLot(lot);
			if(cartService.cartOne(cartVO)==null) {
				cartService.cartOptNo(cartVO);
			}else {
				cartVO = cartService.cartOne(cartVO);
				int count = cartVO.getMmCount();
				
				cartVO.setCartTotal(cartVO.getCartTotal()+ct);
				cartVO.setMmCount(count+Integer.parseInt(mmCount));
				cartService.cartAdd(cartVO);
			}
		}
		
		
		int result= 0;
		List<CartOptionVO> cartOptionVOs = new ArrayList<>();
		if(optNum!=null) {
			for(int i=0; i<optNum.length;i++) {
				CartOptionVO cartOptionVO = new CartOptionVO();
				cartOptionVO.setCartNum(cartVO.getCartNum());
				cartOptionVO.setOptNum(Integer.parseInt(optNum[i]));
				cartOptionVO.setOptCount(Integer.parseInt(optCount[i]));
				
				cartOptionVOs.add(cartOptionVO);
				lot = lot + optNum[i]+optCount[i];
			}
			cartVO.setLot(lot);
			
			if(cartService.cartOne(cartVO)==null) {
				result = cartService.cartInsert(cartVO);
				cartVO = cartService.cartOne(cartVO);
				for(CartOptionVO caropt: cartOptionVOs) {
					caropt.setCartNum(cartVO.getCartNum());
				}
				result = cartService.cartInsert2(cartOptionVOs);
			}else {
				cartVO = cartService.cartOne(cartVO);
				int count = cartVO.getMmCount();
				cartVO.setCartTotal(cartVO.getCartTotal()+ct);
				cartVO.setMmCount(count+Integer.parseInt(mmCount));
				cartService.cartAdd(cartVO);
			}
		}
		
		return result;
	}


	@GetMapping("cartList")
	public ModelAndView storeDetail(HttpSession session,int ssNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		CartVO cartVO = new CartVO();
		cartVO.setSsNum(ssNum);
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		cartVO.setNickname(memberVO.getNickname());
		
		List<CartVO> ar = cartService.cartList(cartVO);
		mv.addObject("cartList", ar);
		mv.addObject("memberVO",memberVO);
		mv.addObject("point", memberVO.getMemPoint());
		return mv;
	}
	
	@ResponseBody
	@PostMapping("cartDelete")
	public int cartDelete(String[] list) throws Exception{
		int result = 0;
		for (String ar : list) {
			CartVO cartVO = new CartVO();
			cartVO.setCartNum(Integer.parseInt(ar));
			result = cartService.cartDelete(cartVO);
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("cartDelete2")
	public int cartDelete2(String cnn) throws Exception{
		int result = 0;
		
		CartVO cartVO = new CartVO();
		cartVO.setCartNum(Integer.parseInt(cnn));
		result = cartService.cartDelete(cartVO);
			
		return result;
	}
	
	@ResponseBody
	@PostMapping("cartUpdate")
	public int cartUpdate(String cart_amount, String cart_num,String cart_price) throws Exception{
		int result= 0;
		
		CartVO cartVO = new CartVO();
		cartVO.setCartNum(Integer.parseInt(cart_num));
		cartVO.setMmCount(Integer.parseInt(cart_amount));
		cartVO.setCartTotal(Integer.parseInt(cart_price));
		
		result = cartService.cartUpdate(cartVO);
		return result;
	}
	
	

}
