package com.cookie.basic.pointList;

import java.util.Date;

import com.cookie.basic.store.StoreVO;

import lombok.Data;

@Data
public class PointListVO {

	private int poNum;
	private String nickname;
	private int ssNum;
	private Date poDate;
	private int poChange;
	private int poUse;
	
	private StoreVO storeVO;
}
