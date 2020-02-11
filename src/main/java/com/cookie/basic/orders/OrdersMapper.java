package com.cookie.basic.orders;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cookie.basic.cart.OrderListVO;

@Repository
@Mapper
public interface OrdersMapper {

	public int ordersInsert(OrdersVO ordersVO)throws Exception;
	public int ordersUpdate(OrdersVO ordersVO)throws Exception;
	public OrdersVO ordersList(OrdersVO ordersVO)throws Exception;
	
	//오더리스트 매퍼
	public int orderListInsert(OrderListVO orderListVO)throws Exception;
	public List<OrderListVO> orderListList(OrdersVO ordersVO)throws Exception;
	public List<OrderListVO> orderListSS(OrdersVO ordersVO)throws Exception;
	public int orderListUpdate(OrderListVO orderListVO)throws Exception;
	public OrderListVO orderListSelectOne(OrderListVO orderListVO)throws Exception;
}
