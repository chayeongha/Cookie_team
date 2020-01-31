package com.cookie.basic.board.review;

import java.util.List;

import com.cookie.basic.board.BoardVO;

import lombok.Data;

@Data
public class ReviewVO extends BoardVO {
	
//	CREATE TABLE review
//	(
//	    `num`       INT             NOT NULL    AUTO_INCREMENT COMMENT '글번호', 
//	    `title`     VARCHAR(255)    NOT NULL    COMMENT '제목', 
//	    `writer`    VARCHAR(255)    NOT NULL    COMMENT '작성자', 
//	    `contents`  TEXT            NOT NULL    COMMENT '내용', 
//	    `regDate`   TIMESTAMP       NOT NULL    COMMENT '날짜', 
//	    `ssNum`      INT             NOT NULL    COMMENT '지점코드', 
//	    `mmNum`      INT             NOT NULL    COMMENT '메뉴번호', 
//	    PRIMARY KEY (num)
//	);
	
	private int ssNum;
	private int mmNum;
	
	private List<ReviewFilesVO> reviewFilesVO;
}
