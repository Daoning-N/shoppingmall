package com.order.service;

import java.util.List;
import java.util.Map;

import com.cart.dto.CartVO;
import com.order.dto.OrderVO;

public interface OrderService {
	
	public void insertOrder(OrderVO vo) throws Exception;
	
	public List<OrderVO> orderByUserId(String user_id) throws Exception;
	
	public List<OrderVO> orderList(String user_id) throws Exception;
	
	public void updateOrder(OrderVO vo) throws Exception;
	
	public void deleteOrder(int order_id) throws Exception;
	
	public OrderVO orderDetail(int order_id) throws Exception;
	
	public void cartAllDelete(String user_id) throws Exception;
	
}