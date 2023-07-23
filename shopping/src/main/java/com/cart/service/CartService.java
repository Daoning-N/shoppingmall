package com.cart.service;

import java.util.List;

import com.cart.dto.CartVO;

public interface CartService {
   // 01. 장바구니 추가
   public void insertCart(CartVO vo) throws Exception;
   // 02. 장바구니 목록
   public List<CartVO> cartList(String user_id) throws Exception;
   // 03. 장바구니 삭제
   public void deleteCart(int cart_id) throws Exception;
   // 04. 장바구니 수정
   public void modifyCart(CartVO vo) throws Exception;
   // 05. 장바구니 금액 합계
   public int sumMoneyCart(String user_id) throws Exception;
   // 06. 장바구니 수량 합계
   public int sumTotCart(String user_id) throws Exception;
   // 07. 장바구니 상품 확인
   public int countCart(int product_id, String user_id) throws Exception;
   // 08. 장바구니 상품 수량 변경
   public void updateCart(CartVO vo) throws Exception;
}