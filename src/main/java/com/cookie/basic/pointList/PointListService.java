package com.cookie.basic.pointList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointListService {
	
	@Autowired
	private PointListMapper pointListMapper;
	
	public int pointInsert(PointListVO pointListVO)throws Exception{
		return pointListMapper.pointInsert(pointListVO);
	}

}
