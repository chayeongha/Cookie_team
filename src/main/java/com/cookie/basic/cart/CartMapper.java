package com.cookie.basic.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CartMapper {
	
	//카트 넣기
	public int cartInsert(CartVO cartVO)throws Exception;
	
	//카트 옵션 넣기
	public int cartOptionInsert(CartOptionVO cartOptionVO)throws Exception;
	
	//카트 중복 검사 
	public List<CartOptionVO> cartSelect(CartVO cartVO)throws Exception;
	
	
	
}
