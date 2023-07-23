package com.product.dao;

import java.util.List;

import com.product.dto.ProductVO;

public interface ProductDAO {
   // 상품목록
	//List: 여러데이터를 담기 위해 그중 product vo데이터를 담음, productList(): return할 메서드 이름
	//ProductVO를 가지는 List를 반환하는 productList라는 함수 
   public List<ProductVO> productList();
   
   // 상품상세
   // VO에서 get으로 객체를 받기때문에 ProductVO, detailProduct를 실행하기위해 prodocut_id를 받는다
   //detail메서드를 호출할때 product_id를 입력받아 ProductVO에 넣어 전달. = detailPreoduct를 실행하면 ProductVO가 나와야된다
   public ProductVO detailProduct(int product_id);
  
   // 상품추가
   //ProductVO vo를 전달받아서 DB에 삽입(=insert)
   public void insertProduct(ProductVO vo);
  
   // 상품수정
   //ProductVo vo로 들어온 값을 update 따라서 insert와 비슷
   public void updateProduct(ProductVO vo);
   
   // 상품삭제
   //delete는 update와 비슷한 느낌 삭제기 때문에 모든 정보(vo)는 필요없고 index같은 product_id로 삭제 가능하기때문에 product_id만 가져와도 ok
   public void deleteProduct(int product_id);
  
   // 상품이미지 삭제를 위한 이미지파일 정보
   public String fileInfo(int product_id);
   
   //AI객체탐지
   public void insertSearch(ProductVO vo);

}