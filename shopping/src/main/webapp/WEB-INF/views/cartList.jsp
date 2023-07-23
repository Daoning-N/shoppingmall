<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">


<!-- -------------------------- -->

<head>

<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>
<script>
<%
boolean isLoggedIn = session.getAttribute("user_id") != null;
if (!isLoggedIn) {
%>
alert("로그인을 먼저 해주세요.");
location.href = "login.do";
<%
}
%>
</script>
    <title>상품 장바구니 목록</title>

     <c:if test="${not empty sessionScope.user_id}">
        <!-- 로그인이 되어 있을 때 보여줄 내용 -->
    </c:if>
</div>
<c:if test="${not empty sessionScope.user_id}">
    <script>
       $(document).ready(function() {
          $("#btnList").click(function() {
             location.href="${path}/productList.do";
         });
    });
    </script>
    
   <style>
   
    a:link { color:black; text-decoration: none;}
    a:visited {color:black; text-decoration: none;}
    a:hover {color:dark; text-decoration: none;}

   table, td, th {
    border-collapse : collapse;
    border : 1px solid black;
    border-collapse: collapse;
    
   };
   

   body{
    margin-top:20px;
    background:#eee;
}
   



#cart {
   background-color: #fff;
   
}

.ui-product-color {
    display: inline-block;
    overflow: hidden;
    margin: .144em;
    width: .875rem;
    height: .875rem;
    border-radius: 10rem;
    -webkit-box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
    box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
    vertical-align: middle;
}

#total {
    text-align:right;
}  

#icon {
   font-size:20px;
}
   
#price {
   border: 2px solid gray;
   font-size:16px;
   padding : 23px;
   width:70%;
   margin: 0 auto;
   font-weight: 500;
   
}   

#cart {
   position: relative;
   top:30px;
}
.button {
   postion:absolute;
   text-align:center;
   padding: 50px;
}

#del_dt {
   padding:2px 16px;
   border:1px solid black;;
   position: relative;
   bottom:5px;
   font-size:17px;
   font-weight: 400;
   
}

#table {
   border-top:2px solid black;
   border-bottom:1px solid white;
   background-color:#EBF5FF;
}

#p_cart {
   position: relative;
   top:7px;
}

#f {
   font-size:17px;
   font-weight:500;
   
}

th, td {
  text-align: center;
}
#btnUpdate {

padding:2px 16px;
   border:1px solid black;;
   position: relative;
   bottom:5px;
   font-size:17px;
   font-weight: 400;
   

}
div.container-fluid,
    div.card-body,
    div.button {
        font-family: 'GowunDodum-Regular', sans-serif;
    }
    
h2 {
	margin:15px 0px;
}

   </style>
</head>


<body>

<div class="container-fluid" style="text-align:center; margin:0 auto;" >
    <!-- Shopping cart table -->
<div style="text-align:center;">   
<h2>장바구니</h2>
</div>


    <div class="card">
      <!--   <div class="card-header" id="cart">
            <h2>장바구니 목록</h2>
        </div> -->
        
        <c:choose>
         <c:when test="${map.count==0}">
            장바구니가 비었습니다.
         </c:when>
         <c:otherwise>
          <form name="form1" id="form1" method="post" action=${path}/cartUpdate.do>
        <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered m-0" >
                <thead id="table">
                  <tr>
                    <!-- Set columns width -->
                     <th>상품이미지</th>
                    <th>상품명</th>
                     <th>상품금액</th>
                     <th>수량</th>
                     <th>합계</th>
                     <th>삭제</th>
                  </tr>
                </thead>
                <tbody>
        
                  <c:forEach var="row" items="${map.list}" varStatus="i">
                  <tr id="f">
                      <td>
                      <a href="${path}/productDetail${row.product_id}">
                         <img src="https://daoningbucket.s3.ap-northeast-2.amazonaws.com//${row.product_url.split(',')[0]}" width="120px" height="110px">
                      </a>
                   </td>
                     <td>
                        ${row.product_name}
                     </td>
                     <td>
                        <fmt:formatNumber pattern="###,###,###" value="${row.product_price}"/>
                     </td>
                     <td>
                    
                        <input type="number" style="width:40px" name="amount" value="${row.amount}" min="1">
                        <input type="hidden" name="product_id" value="${row.product_id}">
                        
                     </td>
                     <td style="width:100px" align="right">
                        <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>
                     </td>
                     <td>
                        <a href="${path}/cartDelete.do?cart_id=${row.cart_id}">
                        <input type="hidden" name="count" value="${map.count}"> 
                           <button type="submit" style="background-color: white; border-color:black; color:black" class="btn btn-lg btn-primary mt-2"  id="btnUpdate">수정</button><br>
                           <button type="button" class="btn btn-lg btn-primary mt-2" style="background-color:white; border-color:black; color:black" id="del_dt">삭제</button><br>
                           
                        </a>
                     </td>
                  </tr>                  
                  </c:forEach>
                  
                </tbody>
                
              </table>
            </div>
            </div>
            <div class="cart-total-price" data-total-price="0" data-discount-price="0" >
                <div class="cart-total-price__inner">
                    <div id="price">
                       장바구니 금액 합계
                        <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/>원
                        <span class="final-sale-area">
                        +
                        </span>

                        
                        총 배송비
                        ${map.fee}원 =
                        
                        총 주문금액
                        <fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/>원
                        
                      
                    </div>

                    
                </div>

                
            </div>
          </form> 
          <div class="button">
              <button type="button" style="background-color: white; border-color:black; color:black" class="btn btn-lg btn-primary mt-2" id="btnList">계속 쇼핑하기</button>&nbsp;&nbsp;&nbsp;
              <button type="submit" style="background-color: white; border-color:black; color:black" class="btn btn-lg btn-primary mt-2" id="btnOrder">주문하기</button>
          </div>
         
          </c:otherwise>
      </c:choose>        
            <!-- / Shopping cart table -->
              </div>
          </div>
     </c:if> 
</body>
 <script>
    $(document).ready(function() {
        $("#btnOrder").click(function() {
            // 주문페이지 URL 지정
            var orderPageUrl = "${path}/orderWrite.do";
            
            // 주문페이지로 이동
            window.location.href = orderPageUrl;
        });
    });
</script>  


<%@ include file="include/footer.jsp" %>
</html>