package com.cookie.basic.menu;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cookie.basic.util.FilePathGenerator;
import com.cookie.basic.util.FileSaver;

@Service
public class MenuService {
	
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private FilePathGenerator filePathGenerator;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private MenuFilesMapper menuFilesMapper;
	
	//menuInsert
	public int menuInsert(MenuVO menuVO, MultipartFile[] files)throws Exception{
		System.out.println(menuVO.getMName());
		System.out.println(menuVO.getMPrice());
		System.out.println(menuVO.getMNum());
		System.out.println(menuVO.getMCount());
		System.out.println(menuVO.getCNum());
		System.out.println(menuVO.getOptNums());
		int result = menuMapper.menuInsert(menuVO);
		File file = filePathGenerator.getUseClassPathResource("menu");
		
		List<MenuFilesVO> menuFilesVOs = new ArrayList<>();
		for(int i = 0; i<files.length; i++) {
			String fileName = fileSaver.save(file, files[i]);
			MenuFilesVO menuFilesVO = new MenuFilesVO();
			menuFilesVO.setMNum(3);
			System.out.println(fileName);
			System.out.println(files[i].getOriginalFilename());
			System.out.println(menuVO.getMNum());
			menuFilesVO.setMoName(files[i].getOriginalFilename());
			menuFilesVO.setMfName(fileName);
			
			menuFilesVOs.add(menuFilesVO);
			
		}
		menuFilesMapper.menuFilesInsert(menuFilesVOs);
		return result;
	}
	
	
	
	
	public MenuVO menuSelect(MenuVO menuVO)throws Exception{
		
		return menuMapper.menuSelect(menuVO);
	}
	
	public List<MenuVO> menuList()throws Exception{
		return menuMapper.menuList();
	}
	
	

}
