package com.cart.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cart.dao.CartDAO;
import com.cart.dto.CartVO;

@Service
public class CartServiceImpl implements CartService {

   @Inject
   CartDAO dao;

   //1. 장바구니 추가
   @Override
   public void insertCart(CartVO vo) {
      dao.insertCart(vo);
   }

   //2. 장바구니 목록
   @Override
   public List<CartVO> cartList(String user_id){
      return dao.cartList(user_id);
   }
   //3. 장바구니 삭제
   @Override
   public void deleteCart(int cart_id) {
      dao.deleteCart(cart_id);
   }
   //4. 장바구니 수정
   @Override
   public void modifyCart(CartVO vo) {
      dao.modifyCart(vo);
   }
   //5. 장바구니 금액 합계
   @Override
   public int sumMoneyCart(String user_id) {
      return dao.sumMoneyCart(user_id);
   }
   //6. 장바구니 수량 합계
   @Override
   public int sumTotCart(String user_id) {
      return dao.sumTotCart(user_id);
   }
   //7. 장바구니 상품 확인
   @Override
   public int countCart(int product_id, String user_id)                                                                               {
      return dao.countCart(product_id, user_id);
   }
   //8. 장바구니 상품 수량 변경
   @Override
   public void updateCart(CartVO vo) {
      dao.updateCart(vo);
   }

}