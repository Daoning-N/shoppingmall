package com.order.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cart.dto.CartVO;
import com.order.dao.OrderDAO;
import com.order.dto.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderDAO orderDAO;
	
	@Override
    public void insertOrder(OrderVO vo) throws Exception {
		 // 주문 정보 저장
        orderDAO.insertOrder(vo);
    }

	@Override
	public List<OrderVO> orderByUserId(String user_id) throws Exception {
		return orderDAO.orderByUserId(user_id);
	}

	@Override
	public List<OrderVO> orderList(String user_id) throws Exception {
		return orderDAO.orderList(user_id);
	}

	@Override
	public void updateOrder(OrderVO vo) throws Exception {
		orderDAO.updateOrder(vo);
	}

	@Override
	public void deleteOrder(int order_id) throws Exception {
		orderDAO.deleteOrder(order_id);
	}

	@Override
	public OrderVO orderDetail(int order_id) throws Exception {
		
		return orderDAO.orderDetail(order_id);
	}
	
	@Override
    public void cartAllDelete(String user_id) throws Exception{
       orderDAO.cartAllDelete(user_id);
    }

}