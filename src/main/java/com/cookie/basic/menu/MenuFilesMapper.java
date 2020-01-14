package com.cookie.basic.menu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MenuFilesMapper {
	public int menuFilesInsert(List<MenuFilesVO> menuFilesVOs)throws Exception;
}
