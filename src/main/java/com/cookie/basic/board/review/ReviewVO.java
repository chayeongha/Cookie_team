package com.cookie.basic.board.review;

import java.sql.Date;
import java.util.List;

public class ReviewVO{
	
//	CREATE TABLE `review` (
//	  `num` int(11) NOT NULL COMMENT '글번호',
//	  `writer` varchar(255) NOT NULL COMMENT '작성자',
//	  `contents` text NOT NULL COMMENT '내용',
//	  `regDate` timestamp NOT NULL COMMENT '날짜',
//	  `star` int(11) DEFAULT NULL COMMENT '별점',
//	  `product` text NOT NULL COMMENT '구매상품내역',
//	  PRIMARY KEY (`num`)
//	);
	
	private int num;
	private String writer;
	private String contents;
	private Date regDate;
	private int star;
	private String product;
	
	private List<ReviewFilesVO> reviewFilesVO;

	
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
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public List<ReviewFilesVO> getReviewFilesVO() {
		return reviewFilesVO;
	}
	public void setReviewFilesVO(List<ReviewFilesVO> reviewFilesVO) {
		this.reviewFilesVO = reviewFilesVO;
	}
	
}
