package com.cookie.basic.store;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
@Mapper
public interface StoreMapper {

	public int storeInsert(StoreVO storeVO) throws Exception;

	public int storeUpdate(StoreVO storeVO) throws Exception;
	
	public StoreVO sNumSearch(StoreVO storeVO)throws Exception;
	
	public List<StoreVO> searchInfo(StoreVO storeVO)throws Exception;
	
	public StoreVO info (StoreVO storeVO)throws Exception;
	
	public int onUpdate(StoreVO storeVO)throws Exception;
	
	public int offUpdate(StoreVO storeVO)throws Exception;
	
	public int checkStore(StoreVO storeVO)throws Exception;
	
	public List<StoreVO> storeList(StoreVO storeVO) throws Exception;
	
	public List<StoreVO> storeList2(StoreVO storeVO) throws Exception;
	
	public StoreVO storeGoods(StoreVO storeVO) throws Exception;
	
	public List<StoreVO> storeGoods2(StoreVO storeVO) throws Exception;
}
