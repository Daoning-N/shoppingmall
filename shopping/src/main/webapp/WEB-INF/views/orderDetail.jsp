<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/header.jsp"%>
<%@ include file="./include/menu.jsp" %>
<title>주문 상세 정보</title>
	<script>
		$(document).ready(function(){
			$("#btnUpdate").click(function(){
				if(confirm("수정하시겠습니까?")){
					document.form.action = "${path}/orderUpdate.do";
					document.form.submit();
				}	
			});
			$("#btnDelete").click(function(){
				if(confirm("삭제하시겠습니까?")){
					document.form.action = "${path}/orderDelete.do";
					document.form.submit();
				}	
			});
			$("#btnWrite").click(function(){
				if(confirm("문의게시판으로 이동하시겠습니까?")){
					document.form.action = "${path}/memberboardList.do";
					document.form.submit();
				}	
			});
		});
	</script>
	
	<style>
		h2 {
			text-align:center;
			margin:20px;
		}
		
		
		table{
			border-collapse:separate;
 		    border-spacing: 0;
 		    border-radius:10px;
 		    border:1px solid black;
		}
		
		#det_th{
			padding:8px 10px;
    		background-color:#f8f8f8;
    		border-bottom:1px solid black;
			border-right:1px solid black;
 		}
		#det_td{
			padding:0px 10px;
			width:70%;
			border-collapse:separate;
 		    border-spacing: 0;
 		    border-bottom:1px solid black;
		}
		
		#btnWrite,#btnUpdate,#btnDelete {
			background-color:#333;
			color:#fff;
			border:none;
			border-radius:5px;
			margin:3px 2px;
			padding:5px 5px;
		}
		
		#add_margin{
			margin:5px 0px;
		}
		
		
		
	</style>
	
</head>
<body>
	<div class="container" id="det_con">
    <h2>주문 상세 정보</h2>
    <form name="form" method="post">
    	<table style="width:100%;">
    		<tr>
                <th id="det_th" style="border-top-left-radius:10px;">주문번호: </th>
				<td id="det_td"><input class="col-md-6" name="order_id" value="${vo.order_id}" readonly="readonly" ></td>
				</tr>
				<tr>
				<th id="det_th">주문자아이디: </th>
				<td id="det_td"><input class="col-md-6" name="user_id" value="${vo.user_id}" readonly="readonly"></td>
				</tr>
				<tr>
				<th id="det_th">수령자명: </th>
				<td id="det_td"><input class="col-md-6" name="receive_name" value="${vo.receive_name}" readonly="readonly"></td>
				</tr>
				<tr>
				<th id="det_th">수령자연락처: </th>
				<td id="det_td"><input class="col-md-6" name="receive_phone" value="${vo.receive_phone}" readonly="readonly"></td>
				</tr>
				<tr>
				<th id="det_th">주소: </th>
				<td id="det_td" style="padding:5px 10px;"><input class="col-md-6" name="order_addr1" value="${vo.order_addr1}" readonly="readonly">
				<input class="col-md-6" id="add_margin" name="order_addr2" value="${vo.order_addr2}" readonly="readonly">
				<input class="col-md-6" name="order_addr3" value="${vo.order_addr3}" readonly="readonly"></td>
				</tr>
				<tr>
				<th id="det_th">수량: </th>
				<td id="det_td"><input class="col-md-6" name="order_quantity" value="${vo.order_quantity}" readonly="readonly"></td>
				</tr>
				<tr>
				<th id="det_th">가격: </th>
				<td id="det_td"><input class="col-md-6" name="order_price" value="${vo.order_price}" readonly="readonly"></td>
				</tr>
				<tr>
				<th id="det_th" style="border-bottom:none; border-bottom-left-radius:10px;">메모: </th>
				<td id="det_td" style="border-bottom:none;"><input class="col-md-6" name="order_memo" value="${vo.order_memo}" readonly="readonly"></td>
				</tr>
				</table>
			
			<tr>	
				<td>결제방식: </td>
				<td>${vo.order_pay}</td><br>
				<td>※무통장 입금자 확인※</td><br>
				<td>기업은행: 258-089215-01-017(예금주: 나다온)</td><br>
				<td>주문일자: </td>
				<td>${vo.order_date}</td><br>
            </tr>
         
            <tr>
			<td colspan="2" align="center">
			<input type="button" id="btnWrite" value="문의하기">
			<c:if test="${sessionScope.admin_id != null}">
				<input type="button" id="btnUpdate" value="수정">
            	<input type="button" id="btnDelete" value="삭제">
            </c:if>
			</td>
		</tr>

		
    </form>
    </div>
</body>
	<%@ include file="include/footer.jsp" %>
</html>