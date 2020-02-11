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
	
	
	//menuPreset
	public int menuPreset(MenuVO menuVO, String [] menuP)throws Exception{
		
		List<MenuVO>menuVOs = new ArrayList<>();
		int result = 0;
		for(int i = 0; i<menuP.length; i++) { 
			String[] spt = menuP[i].split(":");
			MenuVO menuVO2 = new MenuVO();
			menuVO2.setMmName(spt[0]);
			menuVO2.setMmPrice(Integer.parseInt(spt[1]));
			menuVO2.setMmCount(Integer.parseInt(spt[2]));
			menuVO2.setCmNum(Integer.parseInt(spt[3]));
			menuVO2.setMmTemp(Integer.parseInt(spt[4]));
			menuVO2.setSsNum(menuVO.getSsNum());			
			result= menuMapper.menuInsert(menuVO2);		
			
		}
		return result;
	}
	
	
	//MenuUpdate
	public int menuUpdate(MenuVO menuVO, MultipartFile files,  String[] optName2, String[] optPrice2, String[] optNum2,String[] optName, String[] optPrice)throws Exception{
		File file = filePathGenerator.getUseClassPathResource("menu");
		String fileName=fileSaver.save(file, files);
		int result = menuMapper.menuUpdate(menuVO);
		menuVO = menuMapper.menuSelect(menuVO);
		boolean check=false;
		boolean check2=false;
		boolean check3=false;
		
		if(files.getSize()>0) {
					check=true;
			}
			
			if(check) {
				
			if(menuVO.getMenuFiles() == null){
				
				MenuFilesVO menuFilesVO = new MenuFilesVO();
				menuFilesVO.setMmNum(menuVO.getMmNum());
				menuFilesVO.setMfName(fileName);
				menuFilesVO.setMoName(files.getOriginalFilename());
				
				result = menuFilesMapper.menuFilesInsert(menuFilesVO);
			}else {
				
				MenuFilesVO menuFilesVO = new MenuFilesVO();
				menuFilesVO.setMfNum(menuVO.getMenuFiles().getMfNum());
				menuFilesVO.setMmNum(menuVO.getMmNum());
				menuFilesVO.setMfName(fileName);
				menuFilesVO.setMoName(files.getOriginalFilename());
			result = menuFilesMapper.menuFilesUpdate(menuFilesVO);			
			}
			}
			
			
			
			if(optName2 != null) {
				check3 = true;
			}
				
			if(check3) {
			for(int i = 0; i<optName2.length; i++) { 
				MoptVO moptVO = new MoptVO(); 
				moptVO.setOptName(optName2[i]);
				moptVO.setOptPrice(Integer.parseInt(optPrice2[i]));
				moptVO.setOptNum(Integer.parseInt(optNum2[i]));
				moptMapper.moptUpdate(moptVO);
				
			}
			}
			
			
			if(optName != null) {
				check2 = true;
			}
			
		if(check2) {
			 
		
			 List<MoptVO>moptVOs = new ArrayList<>();
			 for(int i = 0; i<optName.length; i++) { 
					MoptVO moptVO = new MoptVO(); 
					moptVO.setMmNum(menuVO.getMmNum());
					moptVO.setOptName(optName[i]);
					moptVO.setOptPrice(Integer.parseInt(optPrice[i]));
					moptVOs.add(moptVO);
					
				}
			 
			  
			  moptMapper.moptInsert(moptVOs);
		}
		return result;
	}
	//menuInsert
	public int menuInsert(MenuVO menuVO, MultipartFile files, String [] opto, String[] optName, String[] optPrice)throws Exception{
		
		File file = filePathGenerator.getUseClassPathResource("menu");
		int result = menuMapper.menuInsert(menuVO);
		String fileName=fileSaver.save(file, files);
		boolean check=false;
		boolean check2=false;
		boolean check3=false;
		
		if(files.getSize()>0) {
					check=true;
			}
			
			if(check) {
				
			MenuFilesVO menuFilesVO = new MenuFilesVO();
			menuFilesVO.setMmNum(menuVO.getMmNum());
			menuFilesVO.setMfName(fileName);
			menuFilesVO.setMoName(files.getOriginalFilename());
			
			result = menuFilesMapper.menuFilesInsert(menuFilesVO);
			}
			
			if(opto != null) {
				check3 = true;
			}
			
			if(check3) {
				List<MoptVO>moptVOs = new ArrayList<>(); 
		 for(int i = 0; i<opto.length; i++) { 
			String[] spt = opto[i].split(":");
			MoptVO moptVO = new MoptVO(); 
			moptVO.setMmNum(menuVO.getMmNum());
			moptVO.setOptName(spt[0]);
			moptVO.setOptPrice(Integer.parseInt(spt[1]));
			moptVOs.add(moptVO);
			
			
		}
		 moptMapper.moptInsert(moptVOs);
	
			}
			
			
		 if(optName != null) {
				check2 = true;
			}
		 
		 if(check2) {
			 List<MoptVO>moptVO2s = new ArrayList<>(); 
		 for(int i = 0; i<optName.length; i++) { 
				MoptVO moptVO = new MoptVO(); 
				moptVO.setMmNum(menuVO.getMmNum());
				moptVO.setOptName(optName[i]);
				moptVO.setOptPrice(Integer.parseInt(optPrice[i]));
				moptVO2s.add(moptVO);
				
			}
		 moptMapper.moptInsert(moptVO2s);
		 }
		
		  
		 
	
		  return result;
		}
	
	
	
	
	//selectOne
	public MenuVO menuSelect(MenuVO menuVO)throws Exception{
		
		return menuMapper.menuSelect(menuVO);
	}
	//List
	public List<MenuVO> menuList(MenuVO menuVO)throws Exception{
		return menuMapper.menuList(menuVO);
	}
	
	//c1
	public List<MenuVO> categoryList1(MenuVO menuVO)throws Exception{
		return menuMapper.categoryList1(menuVO);
	}
	
	//c2
	public List<MenuVO> categoryList2(MenuVO menuVO)throws Exception{
		return menuMapper.categoryList2(menuVO);
	}
	
	//c3
	public List<MenuVO> categoryList3(MenuVO menuVO)throws Exception{
		return menuMapper.categoryList3(menuVO);
	}
	
	
	
	//delete Option
	public int moptDelete(MoptVO moptVO)throws Exception{
		return moptMapper.moptDelete(moptVO);
	}
	
	//menuDelete
	public int menuDelete(MenuVO menuVO)throws Exception{
		return menuMapper.menuDelete(menuVO);
	}
	
	public int countUpdate(MenuVO menuVO)throws Exception{
		
		
		return menuMapper.countUpdate(menuVO);
	}
	

}
