package com.product.dao;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.product.dto.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO{

   @Inject
   SqlSession sqlsession;

   //01. 상품목록
   @Override
   public List<ProductVO> productList() {
	   //productList()에 return을 담아서 반환함
      return sqlsession.selectList("product.productList");
   }
   //02. 상품상세
   @Override
   public ProductVO detailProduct(int product_id) {
      return sqlsession.selectOne("product.detailProduct", product_id);
   }
   //03. 상품추가
   @Override
   public void insertProduct(ProductVO vo) {
      sqlsession.insert("product.insertProduct", vo);
   }
   //04. 상품수정
   @Override
   public void updateProduct(ProductVO vo) {
      sqlsession.update("product.updateProduct", vo);
   }
   //05. 상품삭제
   @Override
public void deleteProduct(int product_id) {
      sqlsession.delete("product.deleteProduct", product_id);
   }
   // 06. 상품이미지 삭제를 위한 이미지파읿정보
   @Override
public String fileInfo(int product_id) {
      return sqlsession.selectOne("product.fileInfo",product_id);

   }
   
   @Override
   public void insertSearch(ProductVO vo) {
      sqlsession.insert("product.insertSearch", vo);
   }
}