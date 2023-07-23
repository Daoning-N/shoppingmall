package com.cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cart.dto.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {

   @Inject
   SqlSession sqlSession;

   // 1. 장바구니 추가
   @Override
   public void insertCart(CartVO vo) {
      sqlSession.insert("cart.insertCart",vo);
   }
   // 2. 장바구니 목록
   @Override
   public List<CartVO> cartList(String user_id){
      return sqlSession.selectList("cart.cartList",user_id);
   }
   // 3. 장바구니 삭제
   @Override
   public void deleteCart(int cart_id) {
      sqlSession.delete("cart.deleteCart",cart_id);
   }
   // 4. 장바구니 수정
   @Override
   public void modifyCart(CartVO vo) {
      sqlSession.update("cart.modifyCart",vo);
   }
   // 5. 장바구니 금액 합계
   @Override
   public int sumMoneyCart(String user_id) {
      sqlSession.selectOne("cart.sumMoneyCart",user_id);
      return sqlSession.selectOne("cart.sumMoneyCart",user_id);
   }
   // 6. 장바구니 수량 합계
   @Override
   public int sumTotCart(String user_id) {
      sqlSession.selectOne("cart.sumTotCart",user_id);
      return sqlSession.selectOne("cart.sumTotCart",user_id);
   }
   // 7. 장바구니 동일한 상품 레코드 확인
   @Override
   public int countCart(int product_id, String user_id) {
      Map<String, Object> map = new HashMap<>();
      map.put("product_id", product_id);
      map.put("user_id", user_id);
      return sqlSession.selectOne("cart.countCart", map);
   }

   // 8. 장바구니 상품수량 변경
   @Override
   public void updateCart(CartVO vo) {
       //sqlSession.update("cart.sumCart",vo);
   }
}