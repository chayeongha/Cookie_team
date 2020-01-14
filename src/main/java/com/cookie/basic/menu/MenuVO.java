package com.cookie.basic.menu;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class MenuVO {
	private int mNum;
	private String mName;
	private int mPrice;
	private int mCount;
	private int cNum;
	private int mTemp;
	private int optNums;
	private List<MenuFilesVO> menuFiles;
	

}
