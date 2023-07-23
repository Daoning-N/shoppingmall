package com.product.controller;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shopping.aws.AWSS3Service;

import net.coobird.thumbnailator.Thumbnails;

import com.product.dto.ProductVO;
import com.product.service.ProductService;


@Controller
public class ProductController {

   @Inject
   ProductService service;
   @Resource(name="uploadPath")
   private String uploadPath;
   
   //Autowired: 타입에 해당하는 빈 찾아서 주입
   @Autowired
   private AWSS3Service s3Service;


   @RequestMapping("productList.do")
   public ModelAndView list(@RequestParam(required = false) String category, ModelAndView mav) {
      mav.setViewName("/productList");
      List<ProductVO> productList = service.productList();

      // 카테고리 파라미터가 존재하는 경우에만 필터링을 수행하도록 합니다.
      // productList를 category로 필터링한 결과로 업데이트 함, filterByCategory메서드를 호출하여 필터링 작업 수행
      if (category != null) {
    	  // productList와 category를 인수로 받아 해당 카테고리에 해당하는 제품 목록을 반환함
         productList = filterByCategory(productList, category);
         //mav 객체에 category속성 추가하고 속성값으로 category 변수의 값을 할당함
         mav.addObject("category", category);
      }
      //mav 객체에 list속성 추가하고 속성값으로 productList 변수의 값을 할당함
      mav.addObject("list", productList);
      // 필터링 된 상품 목록과 카테고리 정보를 ModelAndView에 추가합니다.
      return mav;
   }

   // 카테고리에 따라 productList를 필터링하는 메서드입니다.
   //filterByCategory 메서드는 List<ProductVO> 형태의 productList와 String 형태의 category를 인수로 받아 카테고리로 필터링된 제품 목록인 filteredList를 반환
   private List<ProductVO> filterByCategory(List<ProductVO> productList, String category) {
      // 카테고리가 일치하는 상품만 필터링하는 로직을 구현합니다.
      List<ProductVO> filteredList = new ArrayList<>(); 
      for (ProductVO product : productList) { //productList를 순회하면서 각 제품의 카테고리가 category와 일치하는 경우에만 filteredList에 추가
         if (product.getCategory().equals(category)) {
            filteredList.add(product);
         }
      }
      return filteredList;
   } //여기까지가 list 메서드
   
   
   @RequestMapping("productDetail{product_id}")
   public ModelAndView detail(@PathVariable("product_id") int product_id, ModelAndView mav) { //PathVariable 경로변수 product_id를 매개변수로 받음
      mav.setViewName("/productDetail");
      mav.addObject("vo", service.detailProduct(product_id));
      return mav;
   }
   

   @RequestMapping("productWrite.do")
   public String write() {
      return "productWrite";
   }
   
   
   @RequestMapping("insertProduct.do")
   public ModelAndView insert(ProductVO vo, List<MultipartFile> product_photo, ModelAndView mav) {
      if (!product_photo.isEmpty()) {
         String currentUrl = "";
         for (int i = 0; i < product_photo.size(); i++) {
            String filename = product_photo.get(i).getOriginalFilename();
            System.out.print(product_photo.get(i).getOriginalFilename());

            try {
            	 // 파일 업로드
                s3Service.uploadObject(product_photo.get(i), filename);
               if (i < product_photo.size() - 1) {
                  currentUrl += filename + ",";
               } else {
                  currentUrl += filename;
               }
            } catch (IOException e) {
               e.printStackTrace();
            }
         }
         vo.setProduct_url(currentUrl);
      }

      service.insertProduct(vo);

      // 필요한 데이터를 ModelAndView에 추가합니다.
      mav.addObject("message", "상품이 등록되었습니다.");

      // 상품 목록 화면으로 이동합니다.
      mav.setViewName("redirect:/productList.do");
      return mav;
   }
   
   @RequestMapping("productSearchA.do")
   public String Search() {
      return "productSearchA";
   }  
	private String getBase64String(MultipartFile multipartFile) throws Exception {
		byte[] bytes = multipartFile.getBytes();
		return Base64.getEncoder().encodeToString(bytes);
	}
	
	public String requestToFlask(String fileName, MultipartFile file) throws Exception {
	      //127.0.0.1, 13.125.199.244
	      String url = "http://13.125.199.244:5000/detect";
	       RestTemplate restTemplate = new RestTemplate();

	       // Header set
	       HttpHeaders httpHeaders = new HttpHeaders();
	       httpHeaders.setContentType(MediaType.APPLICATION_JSON);

	       // Body set => 64비트로 변환
	       MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
	       String imageFileString = getBase64String(file);
	       body.add("filename", fileName);
	       body.add("image", imageFileString);

	       // Message => post json형태로 담는다
	       HttpEntity<?> requestMessage = new HttpEntity<>(body, httpHeaders);
	       System.out.print("response.getBodyppp()"); 
	       // Request
	       //HttpEntity<String> response = restTemplate.postForEntity(url, requestMessage, String.class);
	       String response = restTemplate.postForObject(url, requestMessage, String.class); 
	       //ResponseEntity<Map> response = restTemplate.exchange("http://127.0.0.1:5000/detect",HttpMethod.POST, requestMessage, String.class);
	       System.out.print(response);
	       JSONParser parser = new JSONParser();
	       JSONObject jsonobject = (JSONObject) parser.parse(response); 
	       System.out.print(jsonobject.get("file_name"));
	       //System.out.print(jsonobject.get("image"));
	       
	       // create output file /home/ubuntu/shopping/shitr.jpg C:\\Users\\newtec\\Desktop\\shirt.jpg
	       File outputFile = new File("/home/ubuntu/shopping/shirt.jpg"); //사진을 저장할 경로
	       byte[] decodedBytes = Base64.getDecoder().decode((String)(jsonobject.get("image")));
	       FileUtils.writeByteArrayToFile(outputFile, decodedBytes);
	       s3Service.uploadObject(outputFile, "shirt.jpg"); //Search s3업로드
	       outputFile.delete();
	       
	       return response;
	}
   
   @RequestMapping("insertSearch.do")
 public String insertSearch(ProductVO vo, List<MultipartFile> product_photo) throws Exception {
      if (!product_photo.isEmpty()) {
         String currentUrl = "";
         for (int i = 0; i < product_photo.size(); i++) {
            String filename = product_photo.get(i).getOriginalFilename();
            System.out.print(product_photo.get(i).getOriginalFilename());
            
            // 파일 업로드
            s3Service.uploadObject(product_photo.get(i), filename);

            try {
            	requestToFlask(product_photo.get(i).getOriginalFilename(), product_photo.get(i));
               if (i < product_photo.size() - 1) {
                  currentUrl += filename + ",";
               } else {
                  currentUrl += filename;
               }
            } catch (IOException e) {
               e.printStackTrace();
            }
         }
         vo.setProduct_url(currentUrl);
      }

      return "redirect:/productSearchB.do";
   }
   
   @GetMapping("/display")
   public ResponseEntity<byte[]> getImage(String fileName){
	   File file = new File("C:\\Users\\newtec\\yolov5\\runs\\detect\\shopping\\" + fileName);
	   ResponseEntity<byte[]> result=null;
	   try {
		   HttpHeaders header = new HttpHeaders();
		   header.add("Content-type", Files.probeContentType(file.toPath()));
		   result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
	   }catch(IOException e){
		   e.printStackTrace();
	   }
	   return result;
   }
   
   @RequestMapping("productEdit{product_id}")
   public ModelAndView edit(@PathVariable("product_id") int product_id, ModelAndView mav) {
      mav.setViewName("/productEdit");
      mav.addObject("vo", service.detailProduct(product_id));
      return mav;
   }

   @RequestMapping("productUpdate.do")
   public String update(ProductVO vo,List<MultipartFile> product_photo) {
        if(!product_photo.isEmpty()) { //product_photo가 비어있지  않은 경우 조건문 실행
            String currentUrl="";
           for(int i=0;i<product_photo.size();i++) { // i 변수를 0으로 초기화하고, i가 product_photo.size()보다 작을 때까지 반복하며 i를 1씩 증가시킵니다. 각 반복에서 i는 리스트의 인덱스를 나타냄
             String filename = product_photo.get(i).getOriginalFilename(); //product_photo 리스트에서 i번째 사진의 파일 이름을 가져와 filename 변수에 할당
             System.out.print(product_photo.get(i).getOriginalFilename());
             
             //String path = "C:\\Users\\newtec\\Documents\\workspace-sts-3.9.18.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\shopping\\resources\\img\\product\\";
             
             try {
            	 // 파일 업로드
                 s3Service.uploadObject(product_photo.get(i), filename);
               //new File(path).mkdirs();
               //product_photo.get(i).transferTo(new File(path+filename));
               if(i<product_photo.size()-1) {
               currentUrl += filename+","; // 기존의 값
               } else {
               currentUrl += filename;
               }
               
             } catch(Exception e) {
               e.printStackTrace();
             }
           }
           vo.setProduct_url(currentUrl); //vo 객체의 product_url 속성에 업로드된 사진들의 URL을 할당
         }
      service.updateProduct(vo);
      return "redirect:/productList.do";
   }

   @RequestMapping("productDelete.do")
   public String delete(@RequestParam int product_id) {
     String filename = service.fileInfo(product_id);
     //System.out.println("상품 삭제 컨트롤러 작동");
     String path = "C:\\Users\\newtec\\Documents\\workspace-sts-3.9.18.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\shopping\\resources\\img\\product\\";
     
      if(filename != null) {
         File file = new File(path+filename); //path와 filename을 조합하여 새로운 File 객체 file을 생성, 이는 삭제할 파일의 경로와 이름을 나타냄
         System.out.println(filename); 
         if(file.exists()) { //실제로 존재하는지 확인
            file.delete();
         }
      }

      service.deleteProduct(product_id);
      return "redirect:/productList.do";
   }
}