package com.cookie.basic.store;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
@Mapper
public interface StoreFilesMapper {

	public int storeFilesInsert(StoreFilesVO storeFilesVO) throws Exception;

}
