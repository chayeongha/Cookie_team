package com.cookie.basic.store;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cookie.basic.store.StoreMapper;
import com.cookie.basic.store.StoreVO;

@SpringBootTest
class StoreMapperTest {

	@Autowired
	private StoreMapper storeMapper;

	//@Test
	public void StoreInsertTest() throws Exception {
		StoreVO storeVO = new StoreVO();
		storeVO.setsName("ok카페");
		storeVO.setsTel("02-1133-3322");
		storeVO.setsSite("마포구");
		storeVO.setId("jiyun");
		storeVO.setsNotice("많이 사랑해주세요");

		int result = storeMapper.storeInsert(storeVO);

		assertEquals(1, result);

	}
	
	//@Test
	public void StoreUpdateTest()throws Exception{
		StoreVO storeVO = new StoreVO();
		
		storeVO.setsName("ko카페");
		storeVO.setsTel("02-1133-3322");
		storeVO.setsSite("마포구");
		storeVO.setsNotice("많이 사랑해주세요");
		storeVO.setId("jiyun");
		
		int result = storeMapper.storeUpdate(storeVO);
		
		assertEquals(1, result);
	}
	
	
	
	

}
