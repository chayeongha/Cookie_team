package com.cookie.basic.store;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
@Mapper
public interface StoreMapper {

	//스토어 등록
	public int storeInsert(StoreVO storeVO) throws Exception;
	//스토어 업데이트
	public int storeUpdate(StoreVO storeVO) throws Exception;
	//스토어 번호 찾기
	public StoreVO sNumSearch(StoreVO storeVO)throws Exception;
	//스토어 리스트
	public List<StoreVO> searchInfo(StoreVO storeVO)throws Exception;
	//스토어 각각 보여주는거 
	public StoreVO info (StoreVO storeVO)throws Exception;
	//스토어 영업시작
	public int onUpdate(StoreVO storeVO)throws Exception;
	//스토어 영업종료
	public int offUpdate(StoreVO storeVO)throws Exception;
	//스토어 중복확인
	public int checkStore(StoreVO storeVO)throws Exception;
	//스토어 폐업
	public int storeClose(StoreVO storeVO)throws Exception;
	//스토어 폐업신청 리스트
	public List<StoreCloseVO> storeAdmin(StoreCloseVO storeCloseVO)throws Exception;
	//스토어 폐업선택
	public StoreCloseVO storeAdminSelect(StoreCloseVO storeCloseVO)throws Exception;
	//스토어 진짜 폐업 (삭제)
	public int deleteStore(StoreVO storeVO)throws Exception;
	//스토어 폐업전 업데이트
	public int storeUpdateBye(StoreCloseVO storeCloseVO)throws Exception;
	
	//스토어 공지사항
	public int storeNotice(StoreVO storeVO)throws Exception;
	

	public List<StoreVO> storeList(StoreVO storeVO) throws Exception;
	
	public List<StoreVO> storeList2(StoreVO storeVO) throws Exception;

	public StoreVO storeGoods(StoreVO storeVO) throws Exception;
	
	public List<StoreVO> storeGoods2(StoreVO storeVO) throws Exception;
	
	public List<StoreVO> storeMap() throws Exception;

}
