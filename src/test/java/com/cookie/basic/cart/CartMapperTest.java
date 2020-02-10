package com.cookie.basic.cart;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.mapping.Array;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import edu.emory.mathcs.backport.java.util.Collections;
@SpringBootTest
class CartMapperTest {
	
	@Autowired
	private CartMapper cartMapper;
	
	//@Test
	public void cartInsertTest()throws Exception{
		CartVO cartVO = new CartVO();
		
	
		cartVO.setMmCount(1);
		cartVO.setMmNum(1);
		cartVO.setNickname("jy");
		
		int result = cartMapper.cartInsert(cartVO);
		
		assertEquals(result, 1);
		
	}
	
	
	//@Test
	public void cartOptionTest()throws Exception{
		CartOptionVO cartOptionVO = new CartOptionVO();
		cartOptionVO.setOptCount(1);
		cartOptionVO.setCartNum(1);
		cartOptionVO.setOptNum(1);
		
		int result = cartMapper.cartOptionInsert(cartOptionVO);
		
		assertEquals(result, 1);
	}

	//@Test
	public void cartSelect() throws Exception {
		CartVO cartVO = new CartVO();
		cartVO.setNickname("cha2");
		List<CartOptionVO> cartOptionVOs = new ArrayList<CartOptionVO>();
		CartOptionVO cartOptionVO = new CartOptionVO();
		cartOptionVO.setOptNum(144);
		cartOptionVOs.add(cartOptionVO);
		
//		cartOptionVO = new CartOptionVO();
//		cartOptionVO.setOptNum(145);
//		cartOptionVOs.add(cartOptionVO)
		
		cartVO.setCartOptionVOs(cartOptionVOs);
		
//		cartVO.setSize(cartOptionVOs.size());
		
//		List<CartOptionVO> list = cartMapper.cartSelect(cartVO);
		
//		System.out.println(list.size());
	}
	 
	//@Test
	public void sortTest() throws Exception {
		List<CartOptionVO> cartOptionVOs = new ArrayList<CartOptionVO>();
		
		CartOptionVO cartOptionVO = new CartOptionVO();
		cartOptionVO.setOptNum(50);
		cartOptionVOs.add(cartOptionVO);
		
		cartOptionVO = new CartOptionVO();
		cartOptionVO.setOptNum(10);
		cartOptionVOs.add(cartOptionVO);
		
		cartOptionVO = new CartOptionVO();
		cartOptionVO.setOptNum(30);
		cartOptionVOs.add(cartOptionVO);
		
		Collections.sort(cartOptionVOs);
		
		
		System.out.println(cartOptionVOs.get(0).getOptNum());
		System.out.println(cartOptionVOs.get(1).getOptNum());
		System.out.println(cartOptionVOs.get(2).getOptNum());
	}
	
	@Test
	public void coptTest() throws Exception{
		CartOptionVO cartOptionVO = new CartOptionVO();
		cartOptionVO.setCartNum(1);
		List<CartOptionVO> ar = cartMapper.coptSelect(cartOptionVO);
		for(int i=0; i<ar.size();i++) {
			System.out.println(ar.get(i).getMoptVOs().size());
			System.out.println(ar.get(i).getMoptVOs());
		}
	}
}
