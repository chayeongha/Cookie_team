package com.cookie.basic.cart;

import java.util.Date;
import java.util.List;

public class CartVO {

	private int cartNum;
	private String mmName;
	private int ssNum;
	private String nickname;
	private Date cartDate;
	private int cartCount;
	private String optName;
	private Integer optCount;
	private int cartPrice;
	private int totalPrice;
	private int ooNum;

	

	public int getCartNum() {
		return cartNum;
	}

	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}

	public String getMmName() {
		return mmName;
	}

	public void setMmName(String mmName) {
		this.mmName = mmName;
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

	public Integer getOptCount() {
		return optCount;
	}

	public void setOptCount(Integer optCount) {
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
