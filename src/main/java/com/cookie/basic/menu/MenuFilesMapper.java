package com.cookie.basic.menu;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MenuFilesMapper {
	public int menuFilesInsert(MenuFilesVO menuFilesVO)throws Exception;
	public int menuFilesUpdate(MenuFilesVO menuFilesVO)throws Exception;
}
