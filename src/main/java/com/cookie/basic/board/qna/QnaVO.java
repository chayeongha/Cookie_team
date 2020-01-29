package com.cookie.basic.board.qna;

import java.util.List;

import com.cookie.basic.board.BoardVO;

import lombok.Data;

@Data
public class QnaVO extends BoardVO {
//	CREATE TABLE qna
//	(
//	    `num`        INT             NOT NULL    AUTO_INCREMENT COMMENT '글번호', 
//	    `title`      VARCHAR(255)    NOT NULL    COMMENT '제목', 
//	    `writer`     VARCHAR(255)    NOT NULL    COMMENT '작성자', 
//	    `contents`   TEXT            NOT NULL    COMMENT '내용', 
//	    `regDate`    TIMESTAMP       NOT NULL    COMMENT '날짜', 
//	    `ref`        INT             NOT NULL    COMMENT 'ref', 
//	    `step`       INT             NOT NULL    COMMENT 'step', 
//	    `depth`      INT             NOT NULL    COMMENT 'depth', 
//	    PRIMARY KEY (num)
//	);
	
	private List<QnaFilesVO> noticeFilesVO;
}
