package com.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.product.dao.ProductDAO;
import com.product.dto.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

   @Inject
   ProductDAO dao;

   @Override
   public List<ProductVO> productList(){
      return dao.productList();
   }

   @Override
   public ProductVO detailProduct(int product_id) {
      return dao.detailProduct(product_id);
   }

   @Override
   public void insertProduct(ProductVO vo) {
      dao.insertProduct(vo);
   }

   @Override
   public void updateProduct(ProductVO vo) {
      dao.updateProduct(vo);
   }

   @Override
   public void deleteProduct(int product_id) {
      dao.deleteProduct(product_id);
   }

   @Override
   public String fileInfo(int product_id) {
      return dao.fileInfo(product_id);
   }
   
   @Override
   public void insertSearch(ProductVO vo) {
      dao.insertSearch(vo);
   }
}