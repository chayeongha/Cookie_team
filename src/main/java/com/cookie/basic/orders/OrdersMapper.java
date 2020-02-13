package com.cookie.basic.orders;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cookie.basic.cart.CartVO;
import com.cookie.basic.cart.OrderListVO;
import com.cookie.basic.menu.MenuVO;

@Repository
@Mapper
public interface OrdersMapper {

	public int ordersInsert(OrdersVO ordersVO)throws Exception;
	public int ordersUpdate(OrdersVO ordersVO)throws Exception;
	public int ordersUpdate2(OrdersVO ordersVO)throws Exception;
	public OrdersVO ordersList(OrdersVO ordersVO)throws Exception;
	
	//오더리스트 매퍼
	public int orderListInsert(OrderListVO orderListVO)throws Exception;
	public List<OrderListVO> orderListList(OrdersVO ordersVO)throws Exception;
	public List<OrderListVO> orderListSS(OrdersVO ordersVO)throws Exception;
	public List<OrderListVO> orderListSSF(OrdersVO ordersVO)throws Exception;
	
	//매장별 총액
	public List<OrderListVO> orderMoney(OrdersVO ordersVO)throws Exception;
	public int orderListUpdate(OrderListVO orderListVO)throws Exception;
	public OrderListVO orderListSelectOne(OrderListVO orderListVO)throws Exception;
	
	public CartVO findcartNum(CartVO cartVO)throws Exception;
	public MenuVO findmmCount(MenuVO menuVO)throws Exception;
	public int UpdateCount(MenuVO menuVO)throws Exception;
	
}
