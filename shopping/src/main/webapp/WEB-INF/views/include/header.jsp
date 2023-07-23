<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
   html {
   font-size: 18px;
   }
    
   @media (max-width: 1024px) {
     html {
     font-size: 16px;
     width : 100%;
     }
   } 
   @media (max-width: 769px) {
     html {
     font-size: 12px;
     width : 100%;
     }
   } 
   @media (max-width: 630px) {
     html {
     font-size: 10px;
     width : 100%;
     }
   } 
   @media (max-width: 480px) {
     /* 모바일에 대한 스타일 설정 */
     html {
     font-size : 8px;
     width : 100%;
     }
   }
   
   @media (min-width: 481px) and (max-width: 768px) {
     /* 태블릿에 대한 스타일 설정 */
     html {
     font-size : 12px;
     width : 100%;
     }
   }
</style>


<!-- Google Font -->
<link
   href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
   rel="stylesheet">
   
   

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">


<script src="https://ajax.gooleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>

       <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__close">+</div>
        <ul class="offcanvas__widget">
            <li><a href="${path}/productSearchA.do"><span class="icon_search search-switch"></span></li>
            <li><a href="${path}/cartList.do"><span class="icon_bag_alt"></span>
                
            </a></li>
        </ul>
        <div class="offcanvas__logo">
            <a href="${path}/"><img src="img/logo.jpg"></img></a>
</div>
<div id="mobile-menu-wrap"></div>
    <div class="offcanvas__auth">
    <c:choose>
        <c:when test="${sessionScope.admin_id != null}">
            <p>${sessionScope.admin_name}님이 로그인 중입니다.</p>
            <a href="${path}/adminLogout.do">로그아웃</a>
        </c:when>
        <c:when test="${sessionScope.user_id != null}">
            <p style="color: #86A5FF; font-family: 'SunBatang-Light'; font-size: 19px;">
                ${sessionScope.user_name}님
            </p>
            <a href="${path}/logout.do">로그아웃</a>
        </c:when>
        <c:otherwise>
            <a href="${path}/login.do">Login</a>
        </c:otherwise>
    </c:choose>
    <a href="${path}/mypageform.do">My page</a>
    </div>
</div>
<!-- Offcanvas Menu End -->
</body>
</html>