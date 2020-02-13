package com.cookie.basic.orders;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
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
import com.cookie.basic.cart.CartVO;
import com.cookie.basic.cart.OrderListVO;
import com.cookie.basic.member.MemberService;
import com.cookie.basic.member.MemberVO;
import com.cookie.basic.menu.MenuVO;
import com.cookie.basic.store.StoreVO;

@Controller
@RequestMapping("/orders/**")
public class OrdersController {

	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberService memberService;

	// orders
	// ordersUpdate
	@PostMapping("ordersUpdate")
	public ModelAndView ordersUpdate(String ooNum, String ssNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		//System.out.println(ooNum);
		//System.out.println(ssNum);
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setOoNum(Integer.parseInt(ooNum));
		ordersVO.setSsNum(Integer.parseInt(ssNum));

		int result = ordersService.ordersUpdate2(ordersVO);
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
	
	//orderList insert
	@PostMapping("orderListInsert")
	public ModelAndView orderListInsert(OrderListVO orderListVO, HttpSession session, String cartTotalPrice, String sname, String [] cartNum, int tocheck)throws Exception{
		//1단계 orders 생성
		ModelAndView mv = new ModelAndView();
		//System.out.println("length"+cartNum.length);
		//System.out.println(cartNum[0]);
		 
		OrdersVO ordersVO = new OrdersVO();
		MemberVO memberVO = new MemberVO();
		StoreVO storeVO = (StoreVO)session.getAttribute("store");
		
		memberVO = (MemberVO)session.getAttribute("member");
		ordersVO.setNickname(memberVO.getNickname());
		ordersVO.setPhone(memberVO.getPhone());
		String[] sarray = sname.split(",");
		//System.out.println(sarray[0]);
		ordersVO.setSsNum(Integer.parseInt(sarray[0]));
		//ooTotal 값 넘어오는거 받아서 넣어주기
		String[] parray = cartTotalPrice.split(",");
		ordersVO.setOoTotal(Integer.parseInt(parray[0]));
		ordersVO.setTakeOut(tocheck);
		ordersService.ordersInsert(ordersVO);
		//2단계 orderSelect로 ooNum 가져오기
		OrdersVO ordersVO2 = new OrdersVO();
		ordersVO2.setNickname(memberVO.getNickname());
		ordersVO2 = ordersService.ordersList(ordersVO);
		//System.out.println("ooNum :" + ordersVO2.getOoNum());
		//ooStatus 1로 Update
		OrdersVO ordersVO4 = new OrdersVO();
		ordersVO4.setNickname(memberVO.getNickname());
		ordersService.ordersUpdate(ordersVO4);
		//3단계 orderList생성
		orderListVO.setOoNum(ordersVO2.getOoNum());
		ordersService.orderListInsert(orderListVO);
		
		//4단계 orderList Select후 Update(olNum=ocNum)
		OrderListVO orderListVO2 = new OrderListVO();
		orderListVO2.setOoNum(ordersVO2.getOoNum());
		orderListVO2 = ordersService.orderListSelectOne(orderListVO2);
		//System.out.println("olNum :"+orderListVO2.getOlNum());
		//System.out.println("ooNum2 :" +orderListVO2.getOoNum());
		OrderListVO orderListVO3 = new OrderListVO();
		orderListVO3.setOlNum(orderListVO2.getOlNum());
		orderListVO3.setOcNum(orderListVO2.getOlNum());
		//System.out.println(orderListVO3.getOcNum());
		ordersService.orderListUpdate(orderListVO3);
		
		//해당되는 카트의 ocNum도 같게 업데이트
		//cartStatus 1로 Update
		for(int i=0;i<cartNum.length;i++) {
			CartVO cartVO = new CartVO();
			cartVO.setCartNum(Integer.parseInt(cartNum[i]));
			cartVO.setOcNum(orderListVO3.getOcNum());
			cartService.cartUpdate2(cartVO);
			//카트넘 찾기 
			CartVO cartVO2 = new CartVO();
			cartVO2 = ordersService.findcartNum(cartVO);
			
			MenuVO menuVO = new MenuVO();
			menuVO.setMmNum(cartVO2.getMmNum());
			menuVO = ordersService.findmmCount(menuVO);
			int mCount = menuVO.getMmCount();
			int cCount = cartVO2.getMmCount();
			//System.out.println(mCount);
			//System.out.println(cCount);
			menuVO.setMmCount(mCount-cCount);
			ordersService.UpdateCount(menuVO);
		}
		//고객별 사용금액 업데이트
		//적립금 업데이트
		MemberVO memberVO2 = memberService.memPointSelect(memberVO);
		int memTotal = Integer.parseInt(parray[0]);
		double perp = 0.0;
		if(memberVO2.getMemTotal()<= 100000) {
			perp = 0.01;
		}else if(100000 < memberVO2.getMemTotal() && memberVO2.getMemTotal() <=500000) {
			perp = 0.02;
		}else {
			perp = 0.03;
		}
		
		memberVO2.setMemTotal(memberVO2.getMemTotal()+memTotal);
		System.out.println(memberVO2.getMemPoint());
		System.out.println(memberVO2.getMemTotal());
		
		int memPoint = (int) (memTotal*perp) ;
		memberVO2.setMemPoint(memberVO2.getMemPoint()+memPoint);
		memberService.memTotalUpdate(memberVO2);
		memberService.memPointUpdate(memberVO2);
		
		session.setAttribute("member", memberVO2);
		
		mv.setViewName("member/memberMypage");
		return mv;
	}

	// orderList List 고객이 확인할떄
	@GetMapping("orderListList")
	public ModelAndView orderListList(OrdersVO ordersVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<OrderListVO> ar = ordersService.orderListList(ordersVO);
		CartOptionVO cartOptionVO = new CartOptionVO();
		List<CartOptionVO> ar3 = new ArrayList<CartOptionVO>();
		for(int i=0; i<ar.size();i++) {
			//System.out.println("arsize1 :"+ar.size());
			//System.out.println("arsize2 :"+ar.get(i).getCartVOs().size());
			List<CartOptionVO> ar2;
			for(int j=0; j<ar.get(i).getCartVOs().size();j++) {
				cartOptionVO.setCartNum(ar.get(i).getCartVOs().get(j).getCartNum());
				//System.out.println("cartNUm :"+cartOptionVO.getCartNum());
				//System.out.println("안쪽 size : " + ar.get(i).getCartVOs().size());
				//System.out.println("J : "+j );
				ar2 = cartService.coptSelect(cartOptionVO);
				if(ar2.size() == 0){
					break;
				}
				for(int k=0; k<ar2.size(); k++) {
					System.out.println(ar2.get(k).getMoptVOs());
					ar3.add(ar2.get(k));
				}
				
				}
		}
		mv.addObject("lists2", ar3);
		mv.addObject("lists", ar);
		mv.setViewName("orders/orderListList");

		return mv;
	}

	// orderList List 점주가 확인할떄 ssNum으로 확인(제조대기)
	@GetMapping("orderListSS")
	public ModelAndView orderListSS(OrdersVO ordersVO) throws Exception {
		
		ordersVO.setOoStatus(1);
		
		ModelAndView mv = new ModelAndView();
		List<OrderListVO> ar = ordersService.orderListSS(ordersVO);
		CartOptionVO cartOptionVO = new CartOptionVO();
		List<CartOptionVO> ar3 = new ArrayList<CartOptionVO>();
		for(int i=0; i<ar.size();i++) {
			//System.out.println("arsize1 :"+ar.size());
			//System.out.println("arsize2 :"+ar.get(i).getCartVOs().size());
			List<CartOptionVO> ar2;
			for(int j=0; j<ar.get(i).getCartVOs().size();j++) {
				cartOptionVO.setCartNum(ar.get(i).getCartVOs().get(j).getCartNum());
				//System.out.println("cartNUm :"+cartOptionVO.getCartNum());
				//System.out.println("안쪽 size : " + ar.get(i).getCartVOs().size());
				//System.out.println("J : "+j );
				ar2 = cartService.coptSelect(cartOptionVO);
				if(ar2.size() == 0){
					break;
				}
				for(int k=0; k<ar2.size(); k++) {
					System.out.println(ar2.get(k).getMoptVOs());
					ar3.add(ar2.get(k));
				}
				
				}
		}
		//System.out.println("ar3:"+ar3.size());
		//ar2 = cartService.coptSelect(cartOptionVO);
		mv.addObject("lists2", ar3);
		mv.addObject("lists", ar);
		mv.setViewName("orders/orderListSS");
		

		return mv;
	}
	
	@GetMapping("orderListSSF")
	public ModelAndView orderListSSF(OrdersVO ordersVO) throws Exception {
		
		//
		//System.out.println("스토어:"+ordersVO.getSsNum());
		ordersVO.setOoStatus(2);
		
		ModelAndView mv = new ModelAndView();
		List<OrderListVO> ar = ordersService.orderListSSF(ordersVO);
		//System.out.println(ar.size());
		CartOptionVO cartOptionVO = new CartOptionVO();
		List<CartOptionVO> ar3 = new ArrayList<CartOptionVO>();
		
		for(int i=0; i<ar.size();i++) {
			//System.out.println("arsize1 :"+ar.size());
			//System.out.println("arsize2 :"+ar.get(i).getCartVOs().size());
			List<CartOptionVO> ar2;
			for(int j=0; j<ar.get(i).getCartVOs().size();j++) {
				cartOptionVO.setCartNum(ar.get(i).getCartVOs().get(j).getCartNum());
				//System.out.println("cartNUm :"+cartOptionVO.getCartNum());
				//System.out.println("안쪽 size : " + ar.get(i).getCartVOs().size());
				//System.out.println("J : "+j );
				ar2 = cartService.coptSelect(cartOptionVO);
				if(ar2.size() == 0){
					break;
				}
				for(int k=0; k<ar2.size(); k++) {
					System.out.println(ar2.get(k).getMoptVOs());
					ar3.add(ar2.get(k));
				}
				
				}
		}
		//System.out.println("ar3:"+ar3.size());
		//ar2 = cartService.coptSelect(cartOptionVO);
		mv.addObject("lists2", ar3);
		mv.addObject("lists", ar);
		mv.setViewName("orders/orderListSSF");


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
