<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>
</head>
<body>

<c:if test="${msg == 'success'}">
   <h2>${sessionScope.admin_name}(관리자) 로그인.</h2>
</c:if>

${result }

</body>
<%@ include file="include/footer.jsp" %>
</html>