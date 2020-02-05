package com.cookie.basic.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cookie.basic.cart.OrderListVO;

@Controller
@RequestMapping("/orders/**")
public class OrdersController {

	@Autowired
	private OrdersService ordersService;
	
	//orderList List 고객이 확인할떄
	@GetMapping("orderListList")
	public ModelAndView orderListList(OrdersVO ordersVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<OrderListVO> ar = ordersService.orderListList(ordersVO);
		
		
		mv.addObject("lists", ar);
		mv.setViewName("orders/orderListList");
		
		return mv;
	}
	
	//orderList List 점주가 확인할떄  ssNum으로 확인
		@GetMapping("orderListSS")
		public ModelAndView orderListSS(OrdersVO ordersVO) throws Exception{
			ModelAndView mv = new ModelAndView();
			List<OrderListVO> ar = ordersService.orderListSS(ordersVO);
			
			
			mv.addObject("lists", ar);
			mv.setViewName("orders/orderListSS");
			
			return mv;
		}
	
}
