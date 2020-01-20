package com.cookie.basic.menu;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class MenuVO {
	private int mmNum;
	private String mmName;
	private int mmPrice;
	private int mmCount;
	private int cmNum;
	private int mmTemp;
	private int sNum;
	private MenuFilesVO menuFiles;
	private List<MoptVO> menuOptions;
	

}
