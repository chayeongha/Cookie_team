package com.cookie.basic.menu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MenuMapper {
	public int menuInsert(MenuVO menuVO)throws Exception;
	
	public MenuVO menuSelect(MenuVO menuVO)throws Exception;
	
	public List<MenuVO> menuList(MenuVO menuVO)throws Exception;
	
	public int menuUpdate(MenuVO menuVO)throws Exception;
	
	public int menuDelete(MenuVO menuVO)throws Exception;
	
	public List<MenuVO> categoryList1(MenuVO menuVO)throws Exception;
	
	public List<MenuVO> categoryList2(MenuVO menuVO)throws Exception;
	
	public List<MenuVO> categoryList3(MenuVO menuVO)throws Exception;
	
	public int countUpdate(MenuVO menuVO)throws Exception;
	
	
}
