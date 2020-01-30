package com.cookie.basic.cart;

import java.util.Date;

public class CartVO {

	private String cartNum;
	private int mmNum;
	private int ssNum;
	private String nickname;
	private Date cartDate;
	private int cartCount;
	private String optName;
	private int optCount;
	private int cartPrice;
	private int totalPrice;
	private int ooNum;

	public String getCartNum() {
		return cartNum;
	}

	public void setCartNum(String cartNum) {
		this.cartNum = cartNum;
	}

	public int getMmNum() {
		return mmNum;
	}

	public void setMmNum(int mmNum) {
		this.mmNum = mmNum;
	}

	public int getSsNum() {
		return ssNum;
	}

	public void setSsNum(int ssNum) {
		this.ssNum = ssNum;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getCartDate() {
		return cartDate;
	}

	public void setCartDate(Date cartDate) {
		this.cartDate = cartDate;
	}

	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}

	public String getOptName() {
		return optName;
	}

	public void setOptName(String optName) {
		this.optName = optName;
	}

	public int getOptCount() {
		return optCount;
	}

	public void setOptCount(int optCount) {
		this.optCount = optCount;
	}

	public int getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getOoNum() {
		return ooNum;
	}

	public void setOoNum(int ooNum) {
		this.ooNum = ooNum;
	}

}
