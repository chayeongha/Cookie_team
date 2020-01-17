package com.cookie.basic.board;


import java.sql.Date;

import javax.persistence.Id;
import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class BoardVO {

//	CREATE TABLE notice
//	(
//	    `num`       INT             NOT NULL    AUTO_INCREMENT COMMENT '글번호', 
//	    `title`     VARCHAR(255)    NOT NULL    COMMENT '제목', 
//	    `writer`    VARCHAR(255)    NOT NULL    COMMENT '작성자', 
//	    `contents`  TEXT            NOT NULL    COMMENT '내용', 
//	    `regDate`   TIMESTAMP       NOT NULL    COMMENT '날짜', 
//	    PRIMARY KEY (num)
//	);
	
	private int num;
	@NotEmpty(message = "제목을 작성해주세요.")
	private String title;
	private String writer;
	@NotEmpty(message = "내용을 작성해주세요.")
	private String contents;
	private Date regDate;
	
}
