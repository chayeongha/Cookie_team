package com.cookie.basic.board.review;

import java.util.List;

import com.cookie.basic.board.BoardVO;

import lombok.Data;

@Data
public class ReviewVO extends BoardVO {
	
	private List<ReviewFilesVO> noticeFilesVO;
}
