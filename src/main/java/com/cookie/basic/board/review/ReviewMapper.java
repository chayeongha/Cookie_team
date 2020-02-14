package com.cookie.basic.board.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cookie.basic.cart.OrderListVO;
import com.cookie.basic.util.Pager;

@Mapper
@Repository
public interface ReviewMapper {

	//구매목록 조회
	public OrderListVO orderSelect(OrderListVO orderListVO) throws Exception;
	
	//글 삭제
	public int reviewDelete(ReviewVO reviewVO) throws Exception;
	
	//글 수정
	public int reviewUpdate(ReviewVO reviewVO) throws Exception;
	
	//글 하나 조회
	public ReviewVO reviewSelect(ReviewVO reviewVO) throws Exception;
	
	//글 생성
	public int reviewWrite(ReviewVO reviewVO) throws Exception;
	
	//전체 글 개수
	public int reviewCount(Pager pager) throws Exception;
	
	//리스트
	public List<ReviewVO> reviewList(Pager pager) throws Exception;
	
	
}
