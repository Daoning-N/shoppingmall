package com.product.service;

import java.util.List;

import com.product.dto.ProductVO;

public interface ProductService {

   public List<ProductVO> productList();

   public ProductVO detailProduct(int product_id);

   public void insertProduct(ProductVO vo);

   public void updateProduct(ProductVO vo);

   public void deleteProduct(int product_id);

   public String fileInfo(int product_id);
   
   public void insertSearch(ProductVO vo);
}