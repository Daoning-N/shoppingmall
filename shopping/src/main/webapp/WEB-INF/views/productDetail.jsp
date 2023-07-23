<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
   <%@ include file="include/header.jsp" %>
    <%@ include file="./include/menu.jsp" %>
    <title>상품 상세정보</title>
<style>
   body {
      padding: 0;
      margin: 0;
      color: #000;
   }
   
   #detail {
      flex: 1;
   }
   
   #mainImg {
      width: 100%;
      height: auto;
   }
   
   #abc {
      position: relative;
      top: 0;
      max-height: 1000px;
   }
   
   #detail2 {
      flex: 1;
      padding-bottom: 130px;
      max-width: 500px;
   }
   
   #tb_t {
      border-top: 1px solid gray;
   }
   
   #tb_t td {
      padding-bottom: 0px; /* 하단 패딩 조정 */
   }
   
   #img {
      padding-left: 1px;
   }
   
   td {
      vertical-align: top;
   }
   
   #price {
      vertical-align: bottom;
      font-weight: 600;
      font-size: 20px; /* Reduced font size */
   }
   
   #pro_name {
      font-size: 20px; /* Reduced font size */
      font-weight: 500;
      height: 80px; /* Reduced height */
      vertical-align: bottom;
      padding-left: 20px;
      font-color: black;
      padding: 10px 0px; /* Adjusted padding */
   }
   
   .tb_row {
      border-bottom: 1px solid black;
   }
   
   .pro_bt {
      border-radius: 50%;
      padding: 0px 8px;
      background-color: white;
      font-size: 20px;
      border-color: #888;
      margin-top: 6px;
   }
   
   .pro_ht {
      border-radius: 50%;
      padding: 4px 8px;
      background-color: white;
      font-size: 20px;
      border-color: #888;
   }
   
   #p_icon {
      font-size: 25px;
      font-weight: 600;
      color: gray;
      width: 100%;
   }
   
   .p_button {
      width: 10%;
      float: right;
   }
   
   #local {
      color: #000;
      padding-top: 9px;
   }
   
   #lo_icon {
      height: 60px; /* Reduced height */
      padding: 10px; /* Adjusted padding */
   }
   
   .lo_pont {
      font-weight: 600;
      font-size: 15px; /* Reduced font size */
      display: inline-block;
   }
   
   #p_local {
      font-size: 30px; /* Reduced font size */
      padding-top: 5px; /* Adjusted padding */
   }
   
   .i_loc {
      margin-left: 15px;
   }
   
   #p_desc {
      font-size: 14px; /* Reduced font size */
      font-weight: 500;
      height: 100px; /* Reduced height */
      padding: 8px 15px 0px;
   }
   
   #text {
      padding-top: 40px; /* Adjusted padding */
      text-align: center;
   }
   
   #p_btn {
      border: 1px solid black;
      border-radius: 5px;
      background-color: #fff;
      font-size: 14px; /* Reduced font size */
        padding: 8px; /* Adjusted padding */
      margin: 0px 3px; /* Adjusted margin */
   }
   
   #p_amount {
      border: 1px solid black;
      border-radius: 5px;
      font-size: 14px; /* Reduced font size */
      padding: 4px; /* Adjusted padding */
   }
   
   #option {
      font-size: 12px; /* Reduced font size */
   }
   
   #p_head {
      font-size: 14px; /* Reduced font size */
      font-weight: 500;
      color: #000;
      padding: 20px; /* Adjusted padding */
      padding-left: 140px; /* Adjusted padding-left */
   }
   
   .thumbs {
      width: 80px; /* Reduced width */
      float: left;
   }
   
   .thumbs img {
      border: 1px solid #ccc;
      margin-bottom: 3px;
   }
   
   #form {
   }
   
   .container {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
   }
   
   img.otsajo {
      width: 150px; /* Reduced width */
      height: 50px; /* Reduced height */
      text-align: center;
      margin: auto;
      display: flex;
      justify-content: center;
      align-items: center;
   }
   
   .container {
      overflow: hidden;
   }
   
   .body-container {
   }
   
   .p_btn {
      border: 1px solid black;
      border-radius: 5px;
      background-color: #fff;
      font-size: 14px; /* Reduced font size */
      padding: 8px; /* Adjusted padding */
      margin: 0px 3px; /* Adjusted margin */
      display: inline-block;
      width: 120px; /* Adjusted width */
      text-align: center;
      text-decoration: none;
      color: black;
   }
   
   .p_btn:link,
   .p_btn:visited {
      color: black;
      text-decoration: none;
   }
   
   .p_btn:hover,
   .p_btn:active {
      color: black;
   }
</style>





    
</head>

<body>
<br>
<a href="#"><img class="otsajo" src="img/logo.jpg" alt=""></a>
<br>

<div class="body-container">
<div class="container" id="body_con" style="width:90%;">
    
    <div id="detail" style="float:left;">   
    
   <table >
    
      <tr>
         <td id="img">
         <div id="mainImg">
            <c:forEach var="product_url" items="${vo.product_url}">
             <img src="https://daoningbucket.s3.ap-northeast-2.amazonaws.com//${product_url}" width="500px;" height="500px;" alt="img"><br>
            </c:forEach>
         
          </div>
         </td>
         </tr>
         </table>
         </div>
         
            <div style="float:right;" id="detail2">
           
            <table style=" width:500px;" id="abc">
            
               <tr id="tb_t">  
                  <td id="pro_name" class="tb_row">상품명 : ${vo.product_name}
                     <div>
                     가격 : <fmt:formatNumber value="${vo.product_price}" pattern="###,###,###"/>원
                     </div>
                  </td>
               </tr>
               
               <tr>
                  <td class="tb_row" style="height:80px;" id="local">
                  <div class="i_loc" style="align:left;">
                  <span class="material-symbols-outlined" id="p_local" id="lo_icon">local_shipping</span>
                  <p class="lo_pont" style="vertical-align:top; padding-top:20px; color:#000;">내일 출발예정</p>
                  </div>
                  </td>
               
               </tr>
               <tr>
                  <td class="tb_row" id="p_desc" style="">상품내용 :<br> ${vo.product_desc}</td>
               </tr>
               <tr>
                  <td id="text">
                     <form name="form-1" method="post" action="${path}/cartInsert.do">
                        <input type="hidden" name="product_id" value="${vo.product_id}">
                        <select name="amount" id="p_amount">
                           <c:forEach begin="1" end="10" var="i">
                              <option id="option" value="${i}">${i}</option>
                           </c:forEach>
                        </select>&nbsp;<a style="font-size:17px;">개</a>
                        <input type="submit" id="p_btn" value="장바구니에 담기">
                       <a href="${path}/productList.do" class="p_btn">상품목록</a>
                     </form>    
                  </td>
               </tr>
        
   </table>
   </div>
   </div>
   </div>


  
  
</body>
<script>
window.addEventListener("scroll", function() {
  var abc = document.getElementById("abc");
  var targetPosition = 1100; // 멈추고자 하는 위치의 값 (예: 500px)

  if (window.pageYOffset >= targetPosition) {
    abc.style.position = "absolute";
    abc.style.top = targetPosition + "px";
  } else {
    abc.style.position = "fixed";
    abc.style.top = "240px";
  }
});
</script>



<%@ include file="include/footer.jsp" %>