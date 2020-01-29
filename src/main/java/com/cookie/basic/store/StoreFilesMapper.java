package com.cookie.basic.store;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface StoreFilesMapper {

	public int storeFilesInsert(StoreFilesVO storeFilesVO) throws Exception;

	public List<StoreFilesVO> storeFilesSelect(StoreFilesVO storeFilesVO) throws Exception;
	
	public int storeFilesUpdate(StoreFilesVO storeFilesVO)throws Exception;

}
