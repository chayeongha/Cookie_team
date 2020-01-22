package com.cookie.basic.store;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.Store;
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

	public int storeInsert(StoreVO storeVO, MultipartFile files) throws Exception {
		File file = filePathGenerator.getUseClassPathResource("upload");
		String fileName = fileSaver.save(file, files);
		String originalName = files.getOriginalFilename();
		System.out.println(fileName);
		int result = storeMapper.storeInsert(storeVO);
		storeVO = storeMapper.sNumSearch(storeVO);
		if (result > 0) {
			if (files.getOriginalFilename() != null && !files.getOriginalFilename().equals("")) {
				StoreFilesVO storeFilesVO = new StoreFilesVO();
				storeFilesVO.setfName(fileName);
				storeFilesVO.setsNum(storeVO.getsNum());
				storeFilesVO.setoName(originalName);
				result = storeFilesMapper.storeFilesInsert(storeFilesVO);
			}
		}
		return result;
	}

	public int storeUpdate(StoreVO storeVO, MultipartFile files, HttpServletRequest request) throws Exception {
		File file = filePathGenerator.getUseClassPathResource("upload");
		String fileName = fileSaver.save(file, files);
		System.out.println(fileName);
		int result = storeMapper.storeUpdate(storeVO);
		storeVO = storeMapper.sNumSearch(storeVO);

		StoreFilesVO storeFilesVO = new StoreFilesVO();
		if (files.getOriginalFilename() != null && !files.getOriginalFilename().equals("")) {

			storeFilesVO.setsNum(storeVO.getsNum());
			storeFilesVO.setfName(fileName);
			storeFilesVO.setoName(files.getOriginalFilename());
			result = storeFilesMapper.storeFilesInsert(storeFilesVO);
		} else {

			storeFilesVO.setsNum(storeVO.getsNum());
			storeFilesVO.setfNum(Integer.parseInt(request.getParameter("fNum")));
			storeFilesVO.setfName(request.getParameter("fName"));
			storeFilesVO.setoName(request.getParameter("oName"));

			result = storeFilesMapper.storeFilesUpdate(storeFilesVO);
		}

		return result;

	}

	public List<StoreVO> searchInfo(StoreVO storeVO) throws Exception {
		return storeMapper.searchInfo(storeVO);
	}

	public StoreVO info(StoreVO storeVO) throws Exception {
		return storeMapper.info(storeVO);
	}

	public List<StoreFilesVO> storeFilesSelect(StoreFilesVO storeFilesVO) throws Exception {
		return storeFilesMapper.storeFilesSelect(storeFilesVO);
	}

	public int onUpdate(StoreVO storeVO) throws Exception {
		return storeMapper.onUpdate(storeVO);
	}

	public int offUpdate(StoreVO storeVO) throws Exception {
		return storeMapper.offUpdate(storeVO);
	}

	public int checkStore(StoreVO storeVO) throws Exception {
		return storeMapper.checkStore(storeVO);
	}

}
