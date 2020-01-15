package com.cookie.basic.util;


import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {
	
	public String save(File file, MultipartFile files)throws Exception{
		//File file = new File(filepath);
		//if(!file.exists()) {
		//	file.mkdirs();
		//}
		
		String fileName = UUID.randomUUID().toString()+"_"+files.getOriginalFilename();
		file = new File(file,fileName);

		
		files.transferTo(file);
		
		return fileName;

	}

}
