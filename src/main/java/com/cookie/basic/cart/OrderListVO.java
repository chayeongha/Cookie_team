package com.cookie.basic.cart;


import com.cookie.basic.orders.OrdersVO;

public class OrderListVO {

	private int olNum;
	private int ooNum; 
	private int cartNum;
	
	public int getOlNum() {
		return olNum;
	}
	public void setOlNum(int olNum) {
		this.olNum = olNum;
	}
	private OrdersVO ordersVO;
	public OrdersVO getOrdersVO() {
		return ordersVO;
	}
	public void setOrdersVO(OrdersVO ordersVO) {
		this.ordersVO = ordersVO;
	}
	private CartVO cartVO;
	
	public CartVO getCartVO() {
		return cartVO;
	}
	public void setCartVO(CartVO cartVO) {
		this.cartVO = cartVO;
	}
	public int getOoNum() {
		return ooNum;
	}
	public void setOoNum(int ooNum) {
		this.ooNum = ooNum;
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	} 
	
	
	
}
