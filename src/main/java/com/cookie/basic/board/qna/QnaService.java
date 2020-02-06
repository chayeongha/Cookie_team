package com.cookie.basic.board.qna;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cookie.basic.util.FilePathGenerator;
import com.cookie.basic.util.FileSaver;
import com.cookie.basic.util.Pager;

@Service
public class QnaService {

	@Autowired
	private QnaMapper qnaMapper;
	
	
	//글 삭제
	@Transactional
	public int qnaDelete(QnaVO qnaVO) throws Exception {
		//System.out.println(noticeVO.getNum());
		int result = qnaMapper.qnaDelete(qnaVO);
		
		return result;
	}
	
	//글 수정
	@Transactional
	public int qnaUpdate(QnaVO qnaVO, MultipartFile[] files, int[] fnums) throws Exception {
		
		//notice 테이블 수정
		int result = qnaMapper.qnaUpdate(qnaVO);
		return result;
	}
	
	//글 작성
	@Transactional
	public int qnaWrite(QnaVO qnaVO) throws Exception {
		int result = qnaMapper.qnaWrite(qnaVO);
		result = qnaMapper.qnaRef(qnaVO);
		
		return result;
	}
	
	//글 하나 조회
	public QnaVO qnaSelect(QnaVO qnaVO) throws Exception {
		
		return qnaMapper.qnaSelect(qnaVO);
	}
	
	//리스트
	public List<QnaVO> qnaList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makePage(qnaMapper.qnaCount(pager));
		
		return qnaMapper.qnaList(pager);
	}
}
