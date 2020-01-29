package com.cookie.basic.menu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MoptMapper {
	public int moptInsert(List<MoptVO> moptVOs)throws Exception;
	public int moptUpdate(MoptVO moptVO)throws Exception;
	public int moptDelete(MoptVO moptVO)throws Exception;
}
