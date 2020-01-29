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
	@Autowired
	private QnaFilesMapper qnaFilesMapper;
	@Autowired
	private FilePathGenerator filePathGenerator;
	@Autowired
	private FileSaver fileSaver;
	///////////////////////////////////////////////////
	//썸머파일삭제
	public boolean summerFileDelete(String files) throws Exception {
		File file = filePathGenerator.getUseClassPathResource("summernote");
		
		return fileSaver.fileDelete(file, files);
	}
	//썸머파일추가
	public String summerFile(MultipartFile files) throws Exception {
		File file = filePathGenerator.getUseClassPathResource("summernote");
		System.out.println("summer note");
		return fileSaver.save(file, files);
	}
	
	//파일 다운
	public QnaFilesVO qnaFileSelect(QnaFilesVO qnaFilesVO) throws Exception {
		return qnaFilesMapper.qnaFilesSelect(qnaFilesVO);
	}
	///////////////////////////////////////////////////
	//글 삭제
	@Transactional
	public int qnaDelete(QnaVO qnaVO) throws Exception {
		//System.out.println(noticeVO.getNum());
		int result = qnaMapper.qnaDelete(qnaVO);
		
		QnaFilesVO qnaFilesVO = new QnaFilesVO();
		qnaFilesVO.setNum(qnaVO.getNum());
		
		List<QnaFilesVO> qnaFilesVOs = qnaFilesMapper.qnaFilesList(qnaFilesVO);
		
		File file = filePathGenerator.getUseClassPathResource("qna");
		
		boolean check = false;
		
		for (QnaFilesVO qnaFilesVO2 : qnaFilesVOs) {
			String fileName = qnaFilesVO2.getFname();
			check = fileSaver.fileDelete(file, fileName);
		}
		
		if(check) {
			result = 0;
		}else {
			result = 1;
		}
		
		return result;
	}
	
	//글 수정
	@Transactional
	public int qnaUpdate(QnaVO qnaVO, MultipartFile[] files, int[] fnums) throws Exception {
		
		//notice 테이블 수정
		int result = qnaMapper.qnaUpdate(qnaVO);
		
		File file = filePathGenerator.getUseClassPathResource("qna");
		
		//기존 파일 지웠을 때
		if(fnums != null && fnums.length > 0) {
			for (int i : fnums) {
				//System.out.println(i);
				
				QnaFilesVO qnaFilesVO = new QnaFilesVO();
				qnaFilesVO.setFnum(i);
				
				String fileName = qnaFilesMapper.qnaFilesSelect(qnaFilesVO).getFname();
				System.out.println(fileName);
				
				//static의 파일 지우기
				fileSaver.fileDelete(file, fileName);
				
				//DB 테이블에서 파일 지우기
				result = qnaFilesMapper.qnaFilesDelete(qnaFilesVO);
				System.out.println(result);
			}
		}
		
		//기존 파일 그대로
		System.out.println("그대로당!");
		
		List<QnaFilesVO> qnaFilesVOs = new ArrayList<QnaFilesVO>();
		
		for(int i=0;i<files.length;i++) {
			if(files[i].getOriginalFilename() != null && !files[i].getOriginalFilename().equals("")) {
				String fileName = fileSaver.save(file, files[i]);
				System.out.println(fileName);
				
				QnaFilesVO qnaFilesVO = new QnaFilesVO();
				//System.out.println(noticeVO.getNum());
				qnaFilesVO.setNum(qnaVO.getNum());
				qnaFilesVO.setFname(files[i].getOriginalFilename());
				qnaFilesVO.setOname(fileName);
				
				qnaFilesVOs.add(qnaFilesVO);
			}
		}
		
		//file 개수가 0보다 클 때만 files에 등록
		if(qnaFilesVOs.size() > 0) {
			result = qnaFilesMapper.qnaFilesInsert(qnaFilesVOs);
		}
		
		return result;
	}
	
	//글 작성 + 파일 추가
	@Transactional
	public int qnaWrite(QnaVO qnaVO, MultipartFile[] files) throws Exception {
		System.out.println("글 작성");
		int result = qnaMapper.qnaWrite(qnaVO);
		
		File file = filePathGenerator.getUseClassPathResource("notice");
		
		List<QnaFilesVO> qnaFilesVOs = new ArrayList<QnaFilesVO>();
		
		for(int i=0;i<files.length;i++) {
			if(files[i].getOriginalFilename() != null && !files[i].getOriginalFilename().equals("")) {
				String fileName = fileSaver.save(file, files[i]);
				
				System.out.println(fileName);
				
				QnaFilesVO qnaFilesVO = new QnaFilesVO();
				//System.out.println(noticeVO.getNum());
				qnaFilesVO.setNum(qnaVO.getNum());
				qnaFilesVO.setFname(files[i].getOriginalFilename());
				qnaFilesVO.setOname(fileName);
				
				qnaFilesVOs.add(qnaFilesVO);
			}
		}
		//file 개수가 0보다 클 때만 files에 등록
		if(qnaFilesVOs.size() > 0) {
			result = qnaFilesMapper.qnaFilesInsert(qnaFilesVOs);
		}
		
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
