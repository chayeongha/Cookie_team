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
}
