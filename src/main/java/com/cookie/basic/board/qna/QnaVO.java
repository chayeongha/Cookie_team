package com.cookie.basic.board.qna;

import java.util.Date;

import lombok.Data;

//@Data
public class QnaVO {
//	CREATE TABLE `qna` (
//			  `num` 		int(11) 		NOT NULL AUTO_INCREMENT COMMENT '글번호',
//			  `writer` 		varchar(255) 	NOT NULL 				COMMENT '작성자',
//			  `contents` 	text 			NOT NULL 				COMMENT '내용',
//			  `regDate` 	timestamp 		NOT NULL 				COMMENT '날짜',
//			  `ref` 		int(11) 		NOT NULL 				COMMENT 'ref',
//			  `step` 		int(11) 		NOT NULL 				COMMENT 'step',
//			  `depth` 		int(11) 		NOT NULL 				COMMENT 'depth',
//			  `secret` 		int(11) 		DEFAULT '0',			COMMENT '비밀글여부',
//				`acheck` 		int(11)			NOT NULL DEFAULT '0'	COMMENT '답변여부',
//			  PRIMARY KEY (`num`)
//			);
	//시분초 정보까지 가져오려면 java.util.Date 사용
	
	private int num;
	private String writer;
	private String writerS;
	private String contents;
	private Date regDate;
	private int ref;
	private int step;
	private int depth;
	private int secret;
	private int acheck;
	
	public String getWriterS() {
		return writerS;
	}
	public void setWriterS(String writerS) {
		this.writerS = writerS;
	}
	public int getAcheck() {
		return acheck;
	}
	public void setAcheck(int acheck) {
		this.acheck = acheck;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
}