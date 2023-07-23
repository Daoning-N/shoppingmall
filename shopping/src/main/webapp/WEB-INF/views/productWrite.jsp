<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>상품 등록 페이지</title>
    <script>
    $(document).ready(function() {
          $("#addBtn").click(function() {
          var product_name = $("#product_name").val();
          var product_price = $("#product_price").val();
          var product_desc = $("#product_desc").val();
          var product_photo = $("#product_photo").val();
          
          if(product_name == "") {
             alert("상품명을 입력해주세요");
             product_name.focus();
          } else if (product_price == "") {
             alert("상품 가격을 입력해주세요");
             product_price.focus();
          } else if (product_desc == "") {
             alert("상품 설명을 입력해주세요");
             product_desc.focus();
          } else if (product_photo == "") {
             alert("상품 사진을 입력해주세요");
             product_photo.focus();
          }
            document.form1.action = "${path}/insertProduct.do";
            document.form1.submit();
       });
    });
    </script>
    
    <style>    
    	#p_write {
    		width:90%;
    		height:400px;
       		margin-left:50px;
       		
    	}
    	
    	#p_td1 {
    		text-align:center;
    	}
    	
    	#p_td2 {
    		padding-left:10px;
    		padding:2px 0px;
    	}
    	
    	#p_row {
    		border-bottom:1px solid #A4A4A4;
    		
    	}
    	
    	#p_title {
    		text-align:center;
    		padding:15px 0px 10px 0px;
    		font-weight:500;
    	}
    	
    	#p_btn {
    		padding:10px 0px;
    	}
    	
    	.p_bn {
    		border:1px solid black;
    		padding:6px 10px;
    		border-radius:6px;
    	}
    	
    	#bt2 {
    		margin-left:5px;
    	}
    </style>
    
</head>

<body>
  <h2 id="p_title">상품 등록</h2>   
  <!--  -->
  <div class="container">
   <form action="" id="form1" name="form1" enctype="multipart/form-data" method="post">
   <table id="p_write">
      <tr id="p_row" style="border-top:1px solid #A4A4A4;">
         <td id="p_td1">상품명</td>
         
       <td id="p_td2"><input type="text" name="product_name" id="product_name">
        <input type="radio" id="top" name="category" value="top">상의
        <input type="radio" id="pants" name="category" value="pants">하의
       </td>
      </tr>
      <tr id="p_row">
         <td id="p_td1">가격</td>
         <td id="p_td2"><input type="text" name="product_price" id="product_price"></td>
      </tr>
      <tr id="p_row">
         <td id="p_td1">상품설명</td>
         <td id="p_td2"><textarea rows="5" cols="60" name="product_desc" id="product_desc"></textarea></td>
      </tr>
      <tr id="p_row">
         <td id="p_td1">상품 이미지</td>
            <td><input multiple="multiple" type="file" id="product_photo" name="product_photo"></td>
      </tr>
      <tr>
         <td colspan="2" align="center" id="p_btn">
            <input type="button" value="등록" id="addBtn" class="p_bn">
            <input type="button" value="목록" class="p_bn" id="bt2" onclick="location.href='${path}/productList.do';">
         </td>
      </tr>
   </table>
   </form>
</div>
</body>
   

<%@ include file="include/footer.jsp" %>
</html>