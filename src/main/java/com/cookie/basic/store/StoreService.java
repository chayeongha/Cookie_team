package com.cookie.basic.store;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cookie.basic.util.FilePathGenerator;
import com.cookie.basic.util.FileSaver;

@Service
public class StoreService {

	@Autowired
	private StoreMapper storeMapper;
	@Autowired
	private FilePathGenerator filePathGenerator;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private StoreFilesMapper storeFilesMapper;
	
	
	public int storeInsert(StoreVO storeVO,MultipartFile files) throws Exception {
				File file = filePathGenerator.getUseClassPathResource("upload");
				String fileName = fileSaver.save(file, files);
				String originalName = files.getOriginalFilename();
				System.out.println(fileName);
				int result = storeMapper.storeInsert(storeVO);
				storeVO = storeMapper.sNumSearch(storeVO);
				if (result > 0) {
					StoreFilesVO storeFilesVO = new StoreFilesVO();
					storeFilesVO.setfName(fileName);
					storeFilesVO.setsNum(storeVO.getsNum());
					storeFilesVO.setoName(originalName);
					result = storeFilesMapper.storeFilesInsert(storeFilesVO);
				}
				return result;
	}

	public int storeUpdate(StoreVO storeVO) throws Exception {
		return storeMapper.storeUpdate(storeVO);
	}
	
	public List<StoreVO> searchInfo(StoreVO storeVO)throws Exception{
		return storeMapper.searchInfo(storeVO);
	}
	
	public StoreVO info(StoreVO storeVO)throws Exception{
		return storeMapper.info(storeVO);
	}

}
