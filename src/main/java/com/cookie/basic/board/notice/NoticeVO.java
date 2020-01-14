package com.cookie.basic.board.notice;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.cookie.basic.board.BoardVO;

import lombok.Data;

@Data
@Entity
@Table(name = "notice")
public class NoticeVO extends BoardVO {
	
}
