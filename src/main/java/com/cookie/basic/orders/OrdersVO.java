package com.cookie.basic.orders;



import java.util.Date;

import lombok.Data;

@Data
public class OrdersVO {
	
	private int ooNum;
	private Date ooDate;
	private int listNum;
	private int ooTotal;
	private String nickname;
	private String phone;
	private int ssNum;
	private int takeOut;
	private int ooStatus;

}