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
	
		int result = menuMapper.menuInsert(menuVO);
		System.out.println("메뉴번호 1: "+menuVO.getMmNum());
		File file = filePathGenerator.getUseClassPathResource("menu");
		
		List<MenuFilesVO> menuFilesVOs = new ArrayList<>();
		for(int i = 0; i<files.length; i++) {
			String fileName = fileSaver.save(file, files[i]);
			MenuFilesVO menuFilesVO = new MenuFilesVO();
			menuFilesVO.setMmNum(menuVO.getMmNum());
			System.out.println(menuVO.getMmNum());
			menuFilesVO.setMoName(files[i].getOriginalFilename());
			menuFilesVO.setMfName(fileName);
			
			menuFilesVOs.add(menuFilesVO);
			
		}
		menuFilesMapper.menuFilesInsert(menuFilesVOs);
		return result;
	}
	
	
	
	//selectOne
	public MenuVO menuSelect(MenuVO menuVO)throws Exception{
		
		return menuMapper.menuSelect(menuVO);
	}
	//List
	public List<MenuVO> menuList()throws Exception{
		return menuMapper.menuList();
	}
	
	

}
