package com.cookie.basic.util;


import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {
	
	//파일 삭제
	public boolean fileDelete(File file, String fileName) throws Exception {
		file = new File(file, fileName);
		
		boolean check = false;
		
		if(file.exists()) {
			check = file.delete();
		}
		
		return check;
	}
	
	//파일 저장
	public String save(File file, MultipartFile files)throws Exception{
		//File file = new File(filepath);
		//if(!file.exists()) {
		//	file.mkdirs();
		//}

		String fileName = UUID.randomUUID().toString() + "_" + files.getOriginalFilename();
		file = new File(file, fileName);
		System.out.println(file);
		files.transferTo(file);
		
		return fileName;

	}

}
