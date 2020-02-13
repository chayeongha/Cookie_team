package com.cookie.basic.pointList;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PointListMapper {
	
	
	public int pointInsert(PointListVO pointListVO)throws Exception;
	public List<PointListVO> pointList(PointListVO pointListVO)throws Exception;

}
