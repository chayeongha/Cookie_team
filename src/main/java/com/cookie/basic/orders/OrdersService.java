package com.cookie.basic.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cookie.basic.cart.OrderListVO;

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

	// ordersUpdate
	public int ordersUpdate(OrdersVO ordersVO) throws Exception {
		int result = ordersMapper.ordersUpdate(ordersVO);
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

}
