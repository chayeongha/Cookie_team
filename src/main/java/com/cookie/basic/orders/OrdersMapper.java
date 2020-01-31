package com.cookie.basic.orders;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface OrdersMapper {
	public int ordersInsert(OrdersVO ordersVO)throws Exception;
	public int ordersUpdate(OrdersVO ordersVO)throws Exception;
}
