package com.cookie.basic.board.notice;

import java.util.List;

import com.cookie.basic.board.BoardVO;

import lombok.Data;

@Data
public class NoticeVO extends BoardVO {
	
	private int prev;
	private String prevT;
	private int next;
	private String nextT;
	
	private List<NoticeFilesVO> noticeFilesVO;
}
