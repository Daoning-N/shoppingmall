<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원관리</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>

<style>
	 a:link { color:black; text-decoration: none;}
	 a:visited {color:black; text-decoration: none;}
	 a:hover {color:dark; text-decoration: none;}

	#p_title {
    		text-align:center;
    		padding:15px 0px 10px 0px;
    		font-weight:500;
    	}

	table {
		text-align:center;
		width:100%;
	}
	
	#u_tb {
		padding:5px 0px;
	}
	
	#u_btn {
		margin-top:10px;
	}
</style>

</head>
<body>
<h2 id="p_title">회원 목록</h2>
	<div class="container">
	<table border="1">
		<tr>
			<th id="u_tb" width="200px;">회원번호</th>
			<th id="u_tb">아이디</th>
			<th id="u_tb">이름</th>
			<th id="u_tb" width="250px;">전화번호</th>
			<th id="u_tb" width="270px;">가입일자</th>
		</tr>
		<c:forEach var="row" items="${list }">
		<tr id="u_tr">
			<td id="u_tb">${row.user_idx }</td>
			<td id="u_tb"><a href="${path}/userView.do?user_id=${row.user_id}">${row.user_id }</a></td>
			<td id="u_tb">${row.user_name }</td>
			<td id="u_tb">${row.user_phone }</td>
			<td id="u_tb">${row.user_joindate }</td>
		</tr>
		</c:forEach>
	</table>
	<input type="button" id="u_btn" value="회원등록" onclick="location.href='${path}/userWrite.do'" class="float-right">
	</div>
	
</body>
<%@ include file="include/footer.jsp" %>
</html>
