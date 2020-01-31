package com.cookie.basic.cart;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CartMapper {
	
	//카트 넣기
	public int cartInsert(CartVO cartVO)throws Exception;
	
	//카트 옵션 넣기
	public int cartOptionInsert(CartOptionVO cartOptionVO)throws Exception;
	
}
