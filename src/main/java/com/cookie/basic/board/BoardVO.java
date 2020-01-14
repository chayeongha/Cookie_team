package com.cookie.basic.board;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import lombok.Data;

@Data
@MappedSuperclass
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
	
	@Id
	private int num;
	private String title;
	private String writer;
	private String contents;
	private Date regDate;
	
}
