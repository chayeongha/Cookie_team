package com.cookie.basic.board.review;

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
public class ReviewService {

	@Autowired
	private ReviewMapper noticeMapper;
	@Autowired
	private ReviewFilesMapper noticeFilesMapper;
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
	public ReviewFilesVO noticeFileSelect(ReviewFilesVO noticeFilesVO) throws Exception {
		return noticeFilesMapper.noticeFilesSelect(noticeFilesVO);
	}
	///////////////////////////////////////////////////
	//글 삭제
	@Transactional
	public int noticeDelete(ReviewVO noticeVO) throws Exception {
		//System.out.println(noticeVO.getNum());
		int result = noticeMapper.noticeDelete(noticeVO);
		
		ReviewFilesVO noticeFilesVO = new ReviewFilesVO();
		noticeFilesVO.setNum(noticeVO.getNum());
		
		List<ReviewFilesVO> noticeFilesVOs = noticeFilesMapper.noticeFilesList(noticeFilesVO);
		
		File file = filePathGenerator.getUseClassPathResource("notice");
		
		boolean check = false;
		
		for (ReviewFilesVO noticeFilesVO2 : noticeFilesVOs) {
			String fileName = noticeFilesVO2.getFname();
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
	public int noticeUpdate(ReviewVO noticeVO, MultipartFile[] files, int[] fnums) throws Exception {
		
		//notice 테이블 수정
		int result = noticeMapper.noticeUpdate(noticeVO);
		
		File file = filePathGenerator.getUseClassPathResource("notice");
		
		//기존 파일 지웠을 때
		if(fnums != null && fnums.length > 0) {
			for (int i : fnums) {
				//System.out.println(i);
				
				ReviewFilesVO noticeFilesVO = new ReviewFilesVO();
				noticeFilesVO.setFnum(i);
				
				String fileName = noticeFilesMapper.noticeFilesSelect(noticeFilesVO).getFname();
				System.out.println(fileName);
				
				//static의 파일 지우기
				fileSaver.fileDelete(file, fileName);
				
				//DB 테이블에서 파일 지우기
				result = noticeFilesMapper.noticeFilesDelete(noticeFilesVO);
				System.out.println(result);
			}
		}
		
		//기존 파일 그대로
		System.out.println("그대로당!");
		
		List<ReviewFilesVO> noticeFilesVOs = new ArrayList<ReviewFilesVO>();
		
		for(int i=0;i<files.length;i++) {
			if(files[i].getOriginalFilename() != null && !files[i].getOriginalFilename().equals("")) {
				String fileName = fileSaver.save(file, files[i]);
				System.out.println(fileName);
				
				ReviewFilesVO noticeFilesVO = new ReviewFilesVO();
				//System.out.println(noticeVO.getNum());
				noticeFilesVO.setNum(noticeVO.getNum());
				noticeFilesVO.setFname(files[i].getOriginalFilename());
				noticeFilesVO.setOname(fileName);
				
				noticeFilesVOs.add(noticeFilesVO);
			}
		}
		
		//file 개수가 0보다 클 때만 files에 등록
		if(noticeFilesVOs.size() > 0) {
			result = noticeFilesMapper.noticeFilesInsert(noticeFilesVOs);
		}
		
		return result;
	}
	
	//글 작성 + 파일 추가
	@Transactional
	public int noticeWrite(ReviewVO noticeVO, MultipartFile[] files) throws Exception {
		System.out.println("글 작성");
		int result = noticeMapper.noticeWrite(noticeVO);
		
		File file = filePathGenerator.getUseClassPathResource("notice");
		
		List<ReviewFilesVO> noticeFilesVOs = new ArrayList<ReviewFilesVO>();
		
		for(int i=0;i<files.length;i++) {
			if(files[i].getOriginalFilename() != null && !files[i].getOriginalFilename().equals("")) {
				String fileName = fileSaver.save(file, files[i]);
				
				System.out.println(fileName);
				
				ReviewFilesVO noticeFilesVO = new ReviewFilesVO();
				//System.out.println(noticeVO.getNum());
				noticeFilesVO.setNum(noticeVO.getNum());
				noticeFilesVO.setFname(files[i].getOriginalFilename());
				noticeFilesVO.setOname(fileName);
				
				noticeFilesVOs.add(noticeFilesVO);
			}
		}
		//file 개수가 0보다 클 때만 files에 등록
		if(noticeFilesVOs.size() > 0) {
			result = noticeFilesMapper.noticeFilesInsert(noticeFilesVOs);
		}
		
		return result;
	}
	
	//글 하나 조회
	public ReviewVO noticeSelect(ReviewVO noticeVO) throws Exception {
		return noticeMapper.noticeSelect(noticeVO);
	}
	
	//리스트
	public List<ReviewVO> noticeList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makePage(noticeMapper.noticeCount(pager));
		
		return noticeMapper.noticeList(pager);
	}
}
