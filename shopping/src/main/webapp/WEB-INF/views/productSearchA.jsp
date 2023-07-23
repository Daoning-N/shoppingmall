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
          $("#addSearch").click(function() {

            document.form.action = "${path}/insertSearch.do";
            document.form.submit();
       });
    });
    </script>
    
    <style>    
    	#p_write {
    		width:100%;
    		height:400px;
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
    		text-align:left;
    	}
    	
    	#p_title {
    		text-align:center;
    		padding:15px 0px 10px 0px;
    		font-weight:500;
    	}
    	
    	#p_btn {
    		padding:10px 0px;
    		vertical-align:top;
    	}
    	
    	.p_bn {
    		border:1px solid black;
    		padding:6px 10px;
    		border-radius:6px;
    		background-color:#333;
    		color:#fff;
    	}
    	
    	#bt2 {
    		margin-left:5px;
    	}
    	
    	#form {
    		border-width: 5px 10px;
			border: 1px solid gray;
			padding: 15px;
			text-align: center;
			margin:auto;
			width: 430px;
			height: 290px;
			border-radius: 10px;
			background-color: #f8f8f8;
    	}
    	
    	img.otsajo {
			width : 230px;
			height : 80px;
			text-align:center;
			margin: auto;
			display: flex;
			justify-content: center;
			align-items: center;

		}
    	
    </style>
    
</head>

<body>
	
	<br>
	<a href="#"><img class="otsajo" src="img/logo.jpg" alt=""></a>

  <h2 id="p_title">사진 속 옷을 분석해 보세요 <img src="img/search.png" width="50" height="50" alt=""></h2> 

  <!--  -->
  <div class="container">
   <form action="" id="form" name="form" enctype="multipart/form-data" method="post">
   <table id="p_write">
      <!-- <tr id="p_row">
         <td id="p_td1">가격</td>
         <td id="p_td2"><input type="text" name="product_price" id="product_price"></td>
      </tr> -->
      <tr id="p_row">
            <td><input multiple="multiple" type="file" id="product_photo" name="product_photo"></td>
      </tr>
      <tr>
         <td colspan="2" align="center" id="p_btn">
            <input type="button" value="확인" id="addSearch" class="p_bn">
         </td>
      </tr>
   </table>
   </form>
</div>
</body>
   

<%@ include file="include/footer.jsp" %>
</html>