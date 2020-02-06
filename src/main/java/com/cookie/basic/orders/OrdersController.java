package com.cookie.basic.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cookie.basic.cart.OrderListVO;

@Controller
@RequestMapping("/orders/**")
public class OrdersController {

	@Autowired
	private OrdersService ordersService;

	// orders
	// ordersUpdate
	@PostMapping("ordersUpdate")
	public ModelAndView ordersUpdate(String ooNum, String ssNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(ooNum);
		System.out.println(ssNum);
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setOoNum(Integer.parseInt(ooNum));
		ordersVO.setSsNum(Integer.parseInt(ssNum));

		int result = ordersService.ordersUpdate(ordersVO);
		String message = "Update fail";
		String path = "./orderListSS?ssNum=" + ordersVO.getSsNum();
		if (result > 0) {
			message = "Update Success";
		}
		mv.setViewName("common/result2");
		mv.addObject("msg", message);
		mv.addObject("path", path);
		return mv;

	}

	// orderList

	// orderList List 고객이 확인할떄
	@GetMapping("orderListList")
	public ModelAndView orderListList(OrdersVO ordersVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<OrderListVO> ar = ordersService.orderListList(ordersVO);

		mv.addObject("lists", ar);
		mv.setViewName("orders/orderListList");

		return mv;
	}

	// orderList List 점주가 확인할떄 ssNum으로 확인(제조대기)
	@GetMapping("orderListSS")
	public ModelAndView orderListSS(OrdersVO ordersVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<OrderListVO> ar = ordersService.orderListSS(ordersVO);
		mv.addObject("lists", ar);
		mv.setViewName("orders/orderListSS");


		return mv;
	}
	
	
	// orderList List 점주가 확인할떄 ssNum으로 확인(제조완료)
		@GetMapping("orderListSSF")
		public ModelAndView orderListSSF(OrdersVO ordersVO) throws Exception {
			ModelAndView mv = new ModelAndView();
			List<OrderListVO> ar = ordersService.orderListSSF(ordersVO);
			mv.addObject("lists", ar);
			mv.setViewName("orders/orderListSSF");


			return mv;
		}
	
		//총액 불러오기
		@GetMapping("orderMoney")
		public ModelAndView orderMoney(OrdersVO ordersVO)throws Exception{
			ModelAndView mv = new ModelAndView();
			List<OrderListVO> ar = ordersService.orderMoney(ordersVO);
			mv.addObject("money", ar);
			mv.setViewName("orders/orderMoney");
			
			return mv;
		}
		
		
		
		
		

	

}
