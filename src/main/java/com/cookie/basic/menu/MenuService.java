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
	@Autowired
	private MoptMapper moptMapper;
	
	//menuInsert
	public int menuInsert(MenuVO menuVO,List<MultipartFile> files, String [] opto, String[] optName, String[] optPrice)throws Exception{
		List<MenuFilesVO> menuFilesVOs = null;
		
		int result = menuMapper.menuInsert(menuVO);
		
		boolean check=false;
		
		if(files.size()>0) {
			for(MultipartFile multipartFile: files) {
				if(multipartFile.getSize() > 0) {
					check=true;
					break;
				}
			}
			
			if(check) {
			menuFilesVOs = new ArrayList<MenuFilesVO>();
			for(MultipartFile multipartFile:files) {
				if(multipartFile.getSize()>0) {
				MenuFilesVO menuFilesVO = new MenuFilesVO();
				menuFilesVO.setMmNum(menuVO.getMmNum());
				File file = filePathGenerator.getUseClassPathResource("menu");
				String fileName = fileSaver.save(file,multipartFile);
				menuFilesVO.setMoName(multipartFile.getOriginalFilename());
				menuFilesVO.setMfName(fileName);
				
				menuFilesVOs.add(menuFilesVO);
			}
		}	
			}
			
			
			
			
		 List<MoptVO>moptVOs = new ArrayList<>(); 
		 for(int i = 0; i<opto.length; i++) { 
			String[] spt = opto[i].split(":");
			MoptVO moptVO = new MoptVO(); 
			moptVO.setMmNum(menuVO.getMmNum());
			moptVO.setOptName(spt[0]);
			moptVO.setOptPrice(Integer.parseInt(spt[1]));
			moptVOs.add(moptVO);
			
		}
		 for(int i = 0; i<optName.length; i++) { 
				MoptVO moptVO = new MoptVO(); 
				moptVO.setMmNum(menuVO.getMmNum());
				moptVO.setOptName(optName[i]);
				moptVO.setOptPrice(Integer.parseInt(optPrice[i]));
				moptVOs.add(moptVO);
				
			}
		 
		  
		  moptMapper.moptInsert(moptVOs);
		 
		
		menuFilesMapper.menuFilesInsert(menuFilesVOs);
	
		}
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
