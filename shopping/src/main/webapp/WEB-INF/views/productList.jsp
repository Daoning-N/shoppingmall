<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록</title>
<%@ include file="include/header.jsp" %>
<%@ include file="./include/menu.jsp" %>
<script>
	//JQuery
   $(document).ready(function() {
      $("#btnAdd").click(function() {
         location.href="${path}/productWrite.do";
      });
      $("#btnEdit").click(function() {
         location.href="${path}/productEdit.do";
      });
   });
</script>

<style type="text/css">
	a:link { color:black; text-decoration: none;}
	a:visited {color:black; text-decoration: none;}
	a:hover {color:dark; text-decoration: none;}
	
	h2 {
		text-align:center;
		margin-top:15px;
		
	}

	ul li {
		display:inline-block;
	}
	
	.ul{
		padding:8px;
	}
	
	.li {
		margin:12px;
		font-size:18px;
		font-weight:500;
	}
	.li {
	  display: inline-block;
	  margin-right: 20px;
	  margin-bottom: 20px; /* 아래쪽에 20px 간격을 둠 */
	}
	#btnAdd {
	  display: block; /* 버튼을 블록 레벨 요소로 설정하여 가운데 정렬하기 쉽게 함 */
	  margin: 10px auto 0; /* 위에서 10px 아래쪽으로, 좌우는 자동으로 가운데 정렬함 */
	}
	

</style>

</head>
<body>

   <h2>상품목록</h2>

   <div class="body-container">
   <div class="container" style="width:100%; height:100%;" id="con">
   
  <ul class="ul">
  <!-- controller List<ProductVO> list를 items솏겅 값으로 넣음, var은 반복하는 도중의 현재 객체, list의 각 원소에 {row}로 접근할 수 있으며 원소의 값에는 {row.product_id}의 형식으로 접근 가능 -->
  <!-- foreach는 jstl의 반복문 라이브러리 -->
   <c:forEach var="row" items="${list}">
  	<li class="li">
  		<div>
        <a href="${path}/productDetail${row.product_id}">
        <img src="https://daoningbucket.s3.ap-northeast-2.amazonaws.com//${row.product_url.split(',')[0]}" width="320px" height="240px">
        </a>
      </div>
        
        <div style="text-align:center;">
        	 
               <a href="${path}/productDetail${row.product_id}">${row.product_name}</a>
               <c:if test="${sessionScope.admin_id != null}">
                  <a href="${path}/productEdit${row.product_id}">[상품편집]</a>
               </c:if>
        </div>
        <div style="text-align:center;">   
               <fmt:formatNumber value="${row.product_price}" pattern="###, ###, ###"></fmt:formatNumber>

     </div>
     </li>
      </c:forEach>
    
   </ul>
	</div>
	<c:if test="${sessionScope.admin_id != null}">
      <button type="button" id="btnAdd">상품등록</button><br>
	</c:if>	
	</div>


<%@ include file="include/footer.jsp" %>
</body>
</html>