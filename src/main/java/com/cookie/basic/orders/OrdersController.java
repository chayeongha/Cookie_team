package com.cookie.basic.orders;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cookie.basic.cart.CartOptionVO;
import com.cookie.basic.cart.CartService;
import com.cookie.basic.cart.OrderListVO;

@Controller
@RequestMapping("/orders/**")
public class OrdersController {

	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private CartService cartService;

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

	// orderList List 점주가 확인할떄 ssNum으로 확인
	@GetMapping("orderListSS")
	public ModelAndView orderListSS(OrdersVO ordersVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<OrderListVO> ar = ordersService.orderListSS(ordersVO);
		CartOptionVO cartOptionVO = new CartOptionVO();
		System.out.println(ar.get(0).getCartVO().getCartNum());
		cartOptionVO.setCartNum(ar.get(0).getCartVO().getCartNum());
		List<CartOptionVO> ar2 = cartService.coptSelect(cartOptionVO);
		mv.addObject("lists2", ar2);
		mv.addObject("lists", ar);
		mv.setViewName("orders/orderListSS");

		return mv;
	}
	
	//인증번호보내기
		@ResponseBody 
		@RequestMapping("sendOrder")
		 public void sendOrder(String receiver) { 
			System.out.println(receiver);
			
			//보내는 번호의 하이푼(특수문자)을 제거
			receiver = receiver.replaceAll("-", "");
			
			// 문자 보내기 
			String hostname = "api.bluehouselab.com"; 
			String url = "https://" + hostname + "/smscenter/v1.0/sendsms";
			
			CredentialsProvider credsProvider = new BasicCredentialsProvider(); 
			credsProvider.setCredentials(new AuthScope(hostname, 443, AuthScope.ANY_REALM), 

			// 청기와랩에 등록한 Application Id 와 API key 를 입력합니다. 
			new UsernamePasswordCredentials("qodmstn1", "c34b235047e511ea81cd0cc47a1fcfae")); 

			AuthCache authCache = new BasicAuthCache(); 
			authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme()); 
			
			HttpClientContext context = HttpClientContext.create(); context.setCredentialsProvider(credsProvider); 
			context.setAuthCache(authCache); 

			DefaultHttpClient client = new DefaultHttpClient(); 

			try { HttpPost httpPost = new HttpPost(url); httpPost.setHeader("Content-type", "application/json; charset=utf-8");

			 //문자에 대한 정보 
			String json = "{\"sender\":\"01071738910\",\"receivers\":[\"" + receiver + "\"],\"content\":\"쿠키 오더입니다. 고객님의 음료가 준비되었습니다.\"}"; 

			StringEntity se = new StringEntity(json, "UTF-8");
			 httpPost.setEntity(se); 

			HttpResponse httpResponse = client.execute(httpPost, context);

			 InputStream inputStream = httpResponse.getEntity().getContent(); 

			if (inputStream != null) { 
				BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
				String line = ""; 
				while ((line = bufferedReader.readLine()) != null) 
					System.out.println(line);
				inputStream.close(); 
			}
			} catch (Exception e) { 
					System.err.println("Error: " + e.getLocalizedMessage()); 
			} finally {
					client.getConnectionManager().shutdown();
			}
		} 

}
