package com.cookie.basic.cart;


import java.util.List;

import com.cookie.basic.orders.OrdersVO;

public class OrderListVO {

	private int olNum; //orderList PK
	private int ooNum; //orders PK
	private int ocNum; //cart + orderlist join하는 컬럼
	private OrdersVO ordersVO; //주문자 정보 담겨있음
	private List<CartVO> cartVOs; //ocnum으로 join한 결과 cartList
	
	public int getOlNum() {
		return olNum;
	}
	public void setOlNum(int olNum) {
		this.olNum = olNum;
	}
	public int getOoNum() {
		return ooNum;
	}
	public void setOoNum(int ooNum) {
		this.ooNum = ooNum;
	}

	public OrdersVO getOrdersVO() {
		return ordersVO;
	}
	public void setOrdersVO(OrdersVO ordersVO) {
		this.ordersVO = ordersVO;
	}
	public int getOcNum() {
		return ocNum;
	}
	public void setOcNum(int ocNum) {
		this.ocNum = ocNum;
	}
	public List<CartVO> getCartVOs() {
		return cartVOs;
	}
	public void setCartVOs(List<CartVO> cartVOs) {
		this.cartVOs = cartVOs;
	}

	
	

	
}
