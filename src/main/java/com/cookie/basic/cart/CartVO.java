package com.cookie.basic.cart;

import java.util.List;

import com.cookie.basic.menu.MenuVO;

public class CartVO {
	
	private int cartNum;
	private int mmNum;
	private int mmCount;
	private int cartStatus;
	private String nickname;
	private List<CartOptionVO> cartOptionVOs;
	private List<MenuVO> menuVOs;
	
	
	
	
	
	public List<MenuVO> getMenuVOs() {
		return menuVOs;
	}
	public void setMenuVOs(List<MenuVO> menuVOs) {
		this.menuVOs = menuVOs;
	}
	public List<CartOptionVO> getCartOptionVOs() {
		return cartOptionVOs;
	}
	public void setCartOptionVOs(List<CartOptionVO> cartOptionVOs) {
		this.cartOptionVOs = cartOptionVOs;
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public int getMmNum() {
		return mmNum;
	}
	public void setMmNum(int mmNum) {
		this.mmNum = mmNum;
	}
	public int getMmCount() {
		return mmCount;
	}
	public void setMmCount(int mmCount) {
		this.mmCount = mmCount;
	}
	public int getCartStatus() {
		return cartStatus;
	}
	public void setCartStatus(int cartStatus) {
		this.cartStatus = cartStatus;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	

}
