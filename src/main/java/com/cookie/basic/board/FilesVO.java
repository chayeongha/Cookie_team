package com.cookie.basic.board;

import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import lombok.Data;

@Data
@MappedSuperclass
public class FilesVO {

//	CREATE TABLE noticeFiles
//	(
//	    `fNum`   INT             NOT NULL    AUTO_INCREMENT COMMENT '에프넘', 
//	    `num`   INT             NOT NULL    COMMENT '글번호(변경)', 
//	    `oName`  VARCHAR(255)    NOT NULL    COMMENT '오네임', 
//	    `fName`  VARCHAR(255)    NOT NULL    COMMENT '에프네임', 
//	    PRIMARY KEY (fNum)
//	);
	
	@Id
	private int fNum;
	private int num;
	private String oName;
	private String fName;
	
}
