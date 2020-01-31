package com.cookie.basic.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.cookie.basic.board.notice.NoticeFilesVO;

@Component
public class FileDown extends AbstractView {
//jsp역할을 대신하기 위해 abstractview를 상속
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("file down 들어왔냐");
		
		String filePath = (String)model. get("path");
		NoticeFilesVO noticeFilesVO = (NoticeFilesVO)model.get("noticeFiles");
		
		filePath = "/static/"+filePath;
		ClassPathResource classPathResource = new ClassPathResource(filePath);
		
		File file = new File(classPathResource.getFile(), noticeFilesVO.getFname());
		
		//한글 처리
		response.setCharacterEncoding("UTF-8");
		
		//파일 크기
		response.setContentLengthLong(file.length());
		
		//파일을 다운로드시 인코딩 처리
		String fileName = URLEncoder.encode(noticeFilesVO.getOname(), "UTF-8");
		
		//header 설정
		response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		//파일을 읽어 오기
		FileInputStream fi = new FileInputStream(file);
		
		//파일을 출력하는 Stream
		OutputStream os = response.getOutputStream();
		
		//파일 출력
		FileCopyUtils.copy(fi, os);
		
		//Stream Close
		os.close();
		fi.close();
	}
}
