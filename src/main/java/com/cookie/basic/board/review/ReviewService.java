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
	private ReviewMapper reviewMapper;
	@Autowired
	private ReviewFilesMapper reviewFilesMapper;
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
	public ReviewFilesVO reviewFileSelect(ReviewFilesVO reviewFilesVO) throws Exception {
		return reviewFilesMapper.reviewFilesSelect(reviewFilesVO);
	}
	///////////////////////////////////////////////////
	//글 삭제
	@Transactional
	public int reviewDelete(ReviewVO reviewVO) throws Exception {
		//System.out.println(noticeVO.getNum());
		int result = reviewMapper.reviewDelete(reviewVO);
		
		ReviewFilesVO reviewFilesVO = new ReviewFilesVO();
		reviewFilesVO.setNum(reviewVO.getNum());
		
		List<ReviewFilesVO> reviewFilesVOs = reviewFilesMapper.reviewFilesList(reviewFilesVO);
		
		File file = filePathGenerator.getUseClassPathResource("review");
		
		boolean check = false;
		
		for (ReviewFilesVO reviewFilesVO2 : reviewFilesVOs) {
			String fileName = reviewFilesVO2.getFname();
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
	public int reviewUpdate(ReviewVO reviewVO, MultipartFile[] files, int[] fnums) throws Exception {
		
		//notice 테이블 수정
		int result = reviewMapper.reviewUpdate(reviewVO);
		
		File file = filePathGenerator.getUseClassPathResource("review");
		
		//기존 파일 지웠을 때
		if(fnums != null && fnums.length > 0) {
			for (int i : fnums) {
				//System.out.println(i);
				
				ReviewFilesVO reviewFilesVO = new ReviewFilesVO();
				reviewFilesVO.setFnum(i);
				
				String fileName = reviewFilesMapper.reviewFilesSelect(reviewFilesVO).getFname();
				System.out.println(fileName);
				
				//static의 파일 지우기
				fileSaver.fileDelete(file, fileName);
				
				//DB 테이블에서 파일 지우기
				result = reviewFilesMapper.reviewFilesDelete(reviewFilesVO);
				System.out.println(result);
			}
		}
		
		//기존 파일 그대로
		System.out.println("그대로당!");
		
		List<ReviewFilesVO> reviewFilesVOs = new ArrayList<ReviewFilesVO>();
		
		for(int i=0;i<files.length;i++) {
			if(files[i].getOriginalFilename() != null && !files[i].getOriginalFilename().equals("")) {
				String fileName = fileSaver.save(file, files[i]);
				System.out.println(fileName);
				
				ReviewFilesVO reviewFilesVO = new ReviewFilesVO();
				//System.out.println(noticeVO.getNum());
				reviewFilesVO.setNum(reviewVO.getNum());
				reviewFilesVO.setFname(files[i].getOriginalFilename());
				reviewFilesVO.setOname(fileName);
				
				reviewFilesVOs.add(reviewFilesVO);
			}
		}
		
		//file 개수가 0보다 클 때만 files에 등록
		if(reviewFilesVOs.size() > 0) {
			result = reviewFilesMapper.reviewFilesInsert(reviewFilesVOs);
		}
		
		return result;
	}
	
	//글 작성 + 파일 추가
	@Transactional
	public int reviewWrite(ReviewVO reviewVO, MultipartFile[] files) throws Exception {
		System.out.println("글 작성");
		int result = reviewMapper.reviewWrite(reviewVO);
		
		File file = filePathGenerator.getUseClassPathResource("review");
		
		List<ReviewFilesVO> reviewFilesVOs = new ArrayList<ReviewFilesVO>();
		
		for(int i=0;i<files.length;i++) {
			if(files[i].getOriginalFilename() != null && !files[i].getOriginalFilename().equals("")) {
				String fileName = fileSaver.save(file, files[i]);
				
				System.out.println(fileName);
				
				ReviewFilesVO reviewFilesVO = new ReviewFilesVO();
				//System.out.println(noticeVO.getNum());
				reviewFilesVO.setNum(reviewVO.getNum());
				reviewFilesVO.setFname(files[i].getOriginalFilename());
				reviewFilesVO.setOname(fileName);
				
				reviewFilesVOs.add(reviewFilesVO);
			}
		}
		//file 개수가 0보다 클 때만 files에 등록
		if(reviewFilesVOs.size() > 0) {
			result = reviewFilesMapper.reviewFilesInsert(reviewFilesVOs);
		}
		
		return result;
	}
	
	//글 하나 조회
	public ReviewVO reviewSelect(ReviewVO reviewVO) throws Exception {
		return reviewMapper.reviewSelect(reviewVO);
	}
	
	//리스트
	public List<ReviewVO> reviewList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makePage(reviewMapper.reviewCount(pager));
		
		return reviewMapper.reviewList(pager);
	}
}
