package com.cookie.basic.menu;

import java.util.List;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class MenuVO {
	private int mmNum;
	@NotEmpty(message = "메뉴 이름을 넣어주세요")
	private String mmName;
	private int mmPrice;
	private int mmCount;
	private int cmNum;
	private int mmTemp;
	private int ssNum;
	private MenuFilesVO menuFiles;
	private List<MoptVO> menuOptions;
	

}
