package com.cookie.basic.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuService {
	
	@Autowired
	private MenuMapper menuMapper;
	
	//menuInsert
	public int menuInsert(MenuVO menuVO)throws Exception{
		
		return menuMapper.menuInsert(menuVO);
	}
	
	public MenuVO menuSelect(MenuVO menuVO)throws Exception{
		
		return menuMapper.menuSelect(menuVO);
	}
	
	

}
