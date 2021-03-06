package com.cookie.basic.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cookie.basic.cart.CartVO;
import com.cookie.basic.cart.OrderListVO;
import com.cookie.basic.menu.MenuVO;

@Service
public class OrdersService {

	@Autowired
	private OrdersMapper ordersMapper;

	// orders
	// orders Insert
	public int ordersInsert(OrdersVO ordersVO) throws Exception {
		int result = ordersMapper.ordersInsert(ordersVO);
		return result;
	}

	// ordersUpdate  닉네임으로
	public int ordersUpdate(OrdersVO ordersVO) throws Exception {
		int result = ordersMapper.ordersUpdate(ordersVO);
		return result;
	}
	
	// ordersUpdate2
		public int ordersUpdate2(OrdersVO ordersVO) throws Exception {
			int result = ordersMapper.ordersUpdate2(ordersVO);
			return result;
		}

	// orders List
	public OrdersVO ordersList(OrdersVO ordersVO) throws Exception {
		return ordersMapper.ordersList(ordersVO);
	}

	// orderList
	// orderListList 고객이 확인할때 nickname을 ordersVO에 담아줘야 함!!
	public List<OrderListVO> orderListList(OrdersVO ordersVO) throws Exception {

		return ordersMapper.orderListList(ordersVO);
	}

	// orderListSS 점주가 확인할떄(대기)
	public List<OrderListVO> orderListSS(OrdersVO ordersVO) throws Exception {

		return ordersMapper.orderListSS(ordersVO);
	}

	// orderListSS 점주가 확인할떄(완료)
	public List<OrderListVO> orderListSSF(OrdersVO ordersVO) throws Exception {

		return ordersMapper.orderListSSF(ordersVO);
	}

	// orderListInsert
	public int orderListInsert(OrderListVO orderListVO) throws Exception {

		return ordersMapper.orderListInsert(orderListVO);
	}

	//지점별 총액
	public List<OrderListVO> orderMoney(OrdersVO ordersVO)throws Exception{
		return ordersMapper.orderMoney(ordersVO);
	}
	//orderList Update
	public int orderListUpdate(OrderListVO orderListVO)throws Exception{
		
		return ordersMapper.orderListUpdate(orderListVO);
	}
	//orderList SelectOne
	public OrderListVO orderListSelectOne(OrderListVO orderListVO)throws Exception{
		
		return ordersMapper.orderListSelectOne(orderListVO);
	}
	
	//카트 넘 찾기 
	public CartVO findcartNum(CartVO cartVO)throws Exception{
		return ordersMapper.findcartNum(cartVO);
	}
	
	//메뉴 넘 찾기 
	public MenuVO findmmCount(MenuVO menuVO)throws Exception{
		return ordersMapper.findmmCount(menuVO);
	}
	
	public int UpdateCount(MenuVO menuVO)throws Exception{
		return ordersMapper.UpdateCount(menuVO);
	}

}
