package com.cookie.basic.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreService {

	@Autowired
	private StoreMapper storeMapper;

	public int storeInsert(StoreVO storeVO) throws Exception {
		return storeMapper.storeInsert(storeVO);
	}

	public int storeUpdate(StoreVO storeVO) throws Exception {
		return storeMapper.storeUpdate(storeVO);
	}

}
