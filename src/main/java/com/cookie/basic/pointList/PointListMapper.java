package com.cookie.basic.pointList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PointListMapper {
	
	
	public int pointInsert(PointListVO pointListVO)throws Exception;

}
