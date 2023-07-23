<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원관리</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>
	<script>
		$(document).ready(function(){
			$("#btnUpdate").click(function(){
				if(confirm("수정하시겠습니까?")){
					document.form1.action = "${path}/userUpdate.do";
					document.form1.submit();
				}	
			});
		});
		
		$(document).ready(function(){
			$("#btnDelete").click(function(){
				if(confirm("삭제하시겠습니까?")){
					document.form1.action = "${path}/userDelete.do";
					document.form1.submit();
				}	
			});
		});	
	</script>
	
	<style>
		#td1{
			padding:5px 10px;
			width:30%;
			background-color:#f8f8f8;
		}
		
		#td2{
			width:100%;
			padding:10px 15px;
		}
		
		input[type="button"] {
			padding: 5px 10px;
			background-color: #333;
			color: #fff;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			margin: 7px 0px;
		}
		
		#userView_h2{
			text-align:center;
			margin:20px 0px;
		}
	</style>
	
</head>
<body>
<h2 id="userView_h2">회원정보 상세</h2>
<form name="form1" method="post">
	<div class="container">
	<table border="1" width="100%">
		<tr>
			<td id="td1">아이디</td> <!-- 수정 불가 -->
			<td id="td2"><input class="col-md-6" name="user_id" value="${dto.user_id }" readonly="readonly"></td>
		</tr>
		<tr>
			<td id="td1">비밀번호</td> <!-- 비밀번호 입력해야 수정 가능 -->
			<td id="td2"><input class="col-md-6" name="user_pw" value="${dto.user_pw }"></td>
		</tr>
		<tr>
			<td id="td1">이름</td>
			<td id="td2"><input class="col-md-6" name="user_name" value="${dto.user_name }"></td>
		</tr>
		<tr>
			<td id="td1">전화번호</td>
			<td id="td2"><input class="col-md-6" name="user_phone" value="${dto.user_phone }"></td>
		</tr>
		<tr>
			<td id="td1">이메일</td>
			<td id="td2"><input class="col-md-6" name="user_email" value="${dto.user_email }"></td>
		</tr>
		<tr>
			<td id="td1">생년월일</td>
			<td id="td2"><input class="col-md-6" type="date" name="user_birth" value="${dto.user_birth }"></td>
		</tr>
		<tr>
			<td id="td1">주소</td>
			<td id="td2"><input class="col-md-6" name="user_address1" value="${dto.user_address1 }">
			<input class="col-md-6" name="user_address2" value="${dto.user_address2 }" style="margin:10px 0px;">
			<input class="col-md-6" name="user_address3" value="${dto.user_address3 }"></td>
		</tr>
		<tr>
			<td id="td1">가입일자</td>
			<td id="td2"><fmt:formatDate value="${dto.user_joindate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td id="td1">수정일자</td>
			<td id="td2"><fmt:formatDate value="${dto.user_update }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="수정" id="btnUpdate">
				<input type="button" value="삭제" id="btnDelete">
				<div style="color:red;">${message }</div>
			</td>
		</tr>
	</table>
	</div>
</form>
</body>
<%@ include file="include/footer.jsp" %>
</html>
