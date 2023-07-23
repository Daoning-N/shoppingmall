<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>

<style>
	 a:link { color:black; text-decoration: none;}
     a:visited {color:black; text-decoration: none;}
     a:hover {color:dark; text-decoration: none;}

	#list_con{
		text-align:center;
		margin-top:20px;
	}
	
	table{
		border:1px solid #333;
		border-collapse:separate;
 		border-spacing: 0;
 		border-radius:10px;
	}
	
	#list_th{
		padding:5px 0px;
		background-color: #f8f8f8;
		border-bottom:1px solid black;
		border-top-left-radius:10px;
		border-top-right-radius:10px;
	}
	
	#list_td {
		border-bottom:1px solid #D8D8D8;
		padding:10px 0px;
		border-collapse:separate;
 		border-spacing: 0;
 		
	}
	
	h2{
		padding-bottom:10px;
	}
	
</style>

</head>
<body>
	<div class="container" id="list_con">
	<h2>주문 내역</h2>
	<table style="width:100%;" >
		<thead>
			<tr>
				<th id="list_th">주문번호</th>
				<th id="list_th">주문회원</th>
				<th id="list_th">주문수량</th>
				<th id="list_th">주문가격</th>
				<th id="list_th">주문일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" items="${orderList}">
				<tr>
					<td id="list_td">${order.order_id}</td>
					<td id="list_td"><a href="${path}/orderDetail${order.order_id}">${order.user_id}</a></td>
					<td id="list_td">${order.order_quantity}</td>
					<td id="list_td">
					<fmt:formatNumber pattern="###,###,###" value="${order.order_price}"/></td>
					<td id="list_td">${order.order_date}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
<%@ include file="include/footer.jsp" %>
</html>