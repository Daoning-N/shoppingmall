package com.order.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cart.dto.CartVO;
import com.order.dto.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {
    
    @Inject
    private SqlSession sqlSession;
    
    String NAMESPACE = "order";
    
    // 주문 정보 저장
    @Override
    public void insertOrder(OrderVO vo) throws Exception {
        sqlSession.insert(NAMESPACE + ".insertOrder", vo);
    }
    
    // 회원의 주문 목록 조회
    @Override
    public List<OrderVO> orderByUserId(String user_id) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".orderByUserId", user_id);
    }
    
    // 주문 목록 조회
    @Override
    public List<OrderVO> orderList(String user_id) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".orderList", user_id);
    }
    
    // 주문 정보 수정
    @Override
    public void updateOrder(OrderVO vo) throws Exception {
        sqlSession.update(NAMESPACE + ".updateOrder", vo);
    }
    
    // 주문 정보 삭제
    @Override
    public void deleteOrder(int order_id) throws Exception {
        sqlSession.delete(NAMESPACE + ".deleteOrder", order_id);
    }

	@Override
	public OrderVO orderDetail(int order_id) {
		return sqlSession.selectOne(NAMESPACE +".orderDetail", order_id);
	}
	
	@Override
	public void cartAllDelete(String user_id) throws Exception {
	      sqlSession.delete(NAMESPACE + "cartAllDelete", user_id);
	   }

}