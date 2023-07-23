package com.cart.dao;

import java.util.List;

import com.cart.dto.CartVO;

public interface CartDAO {
   //1.장바구니 추가
   public void insertCart(CartVO vo);
   //2. 장바구니 목록
   public List<CartVO> cartList(String user_id);
   //3. 장바구니 삭제
   public void deleteCart(int cart_id);
   //4. 장바구니 수정
   public void modifyCart(CartVO vo);
   //5. 장바구니 금액 합계
   public int sumMoneyCart(String user_id);
   //6. 장바구니 수량 합계
   public int sumTotCart(String user_id);
   //7. 장바구니 동일한 상품 레코드 확인
   public int countCart(int product_id, String user_id);
   //8. 장바구니 상품수량 변경
   public void updateCart(CartVO vo);

}