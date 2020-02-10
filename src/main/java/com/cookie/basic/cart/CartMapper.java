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
	
	//카트옵션  셀렉트
	public List<CartOptionVO> coptSelect(CartOptionVO cartOptionVO)throws Exception;
	
	//카트 중복 검사 
	public CartVO cartOne(CartVO cartVO) throws Exception;
	
	//중복항목 추가
	public int cartAdd(CartVO cartVO) throws Exception;
	
	//옵션없는 카트
	public int cartOptNo(CartVO cartVO) throws Exception;
	
	//카트 장바구니
	public List<CartVO> cartList(CartVO cartVO) throws Exception;
	
	//카트 삭제
	public int cartDelete(CartVO cartVO) throws Exception;
	
	//카트에서 수량 추가
	public int cartUpdate(CartVO cartVO) throws Exception;
}
