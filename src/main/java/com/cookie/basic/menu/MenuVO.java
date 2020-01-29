package com.cookie.basic.menu;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;


import lombok.Data;

@Data
public class MenuVO {
	private int mmNum;
	@NotEmpty
	private String mmName;
	private int mmPrice;
	private int mmCount;
	private int cmNum;
	private int mmTemp;
	private int ssNum;
	private MenuFilesVO menuFiles;
	private List<MoptVO> menuOptions;
	

}
