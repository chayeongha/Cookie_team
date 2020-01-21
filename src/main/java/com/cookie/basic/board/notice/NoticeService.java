package com.cookie.basic.board.notice;

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
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	@Autowired
	private NoticeFilesMapper noticeFilesMapper;
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
		
		return fileSaver.save(file, files);
	}
	
	//파일 다운
	public NoticeFilesVO noticeFileSelect(NoticeFilesVO noticeFilesVO) throws Exception {
		return noticeFilesMapper.noticeFileSelect(noticeFilesVO);
	}
	
	//글 작성 + 파일 추가
	@Transactional
	public int noticeWrite(NoticeVO noticeVO, MultipartFile[] files) throws Exception {
		int result = noticeMapper.noticeWrite(noticeVO);
		
		File file = filePathGenerator.getUseClassPathResource("notice");
		
		List<NoticeFilesVO> noticeFilesVOs = new ArrayList<NoticeFilesVO>();
		
		for(int i=0;i<files.length;i++) {
			if(files[i].getOriginalFilename() != null && !files[i].getOriginalFilename().equals("")) {
				String fileName = fileSaver.save(file, files[i]);
				System.out.println(fileName);
				
				NoticeFilesVO noticeFilesVO = new NoticeFilesVO();
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
	public NoticeVO noticeSelect(NoticeVO noticeVO) throws Exception {
		return noticeMapper.noticeSelect(noticeVO);
	}
	
	//리스트
	public List<NoticeVO> noticeList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makePage(noticeMapper.noticeCount(pager));
		
		return noticeMapper.noticeList(pager);
	}
}
