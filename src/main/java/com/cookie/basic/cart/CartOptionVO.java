package com.cookie.basic.cart;

import java.util.List;

import com.cookie.basic.menu.MoptVO;



public class CartOptionVO implements Comparable<CartOptionVO>{


	private int coNum;
	private int optNum;
	private int optCount;
	private int cartNum;
	private List<MoptVO> moptVOs;
	
	

	@Override
	public int compareTo(CartOptionVO o) {
		// TODO Auto-generated method stub
		if(this.getOptNum() < o.getOptNum()) {
			return -1;
		}else if(this.getOptNum() > o.getOptNum()) {
			return 1;
		}else {
			return 0;
		}
	}


	
	
	public List<MoptVO> getMoptVOs() {
		return moptVOs;
	}
	public void setMoptVOs(List<MoptVO> moptVOs) {
		this.moptVOs = moptVOs;
	}
	public int getCoNum() {
		return coNum;
	}
	public void setCoNum(int coNum) {
		this.coNum = coNum;
	}
	public int getOptNum() {
		return optNum;
	}
	public void setOptNum(int optNum) {
		this.optNum = optNum;
	}
	public int getOptCount() {
		return optCount;
	}
	public void setOptCount(int optCount) {
		this.optCount = optCount;
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	
	
	
	
	
	
	
}

