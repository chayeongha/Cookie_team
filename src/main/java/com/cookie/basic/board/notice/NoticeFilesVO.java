package com.cookie.basic.board.notice;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.cookie.basic.board.FilesVO;

import lombok.Data;

@Data
@Entity
@Table(name ="noticeFiles")
public class NoticeFilesVO extends FilesVO {

}
