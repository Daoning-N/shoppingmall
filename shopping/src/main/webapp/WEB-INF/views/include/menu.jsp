<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<c:set var="path" value="${pageContext.request.contextPath }"/>


<head>
<meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">


<style>
    .header__menu ul {
        white-space: nowrap;
         margin-left: -80px;
    }

    .header__menu li {
        display: inline-block;
        margin-right: 80px;
         font-family: 'KimjungchulGothic-Bold', sans-serif;
        
    }
    
      .header__right__auth,
    .header__right__widget {
        white-space: nowrap;
    }
  @font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
 
}

@font-face {
    font-family: 'KimjungchulGothic-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulGothic-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

 body{
 font-family: 'GowunDodum-Regular';
 }
 
 h2 ,
 h3 ,
 container {
 font-family: 'GowunDodum-Regular';
 }
 
 table,
    th,
    td {
        font-family: 'GowunDodum-Regular', sans-serif;
    }
    
    
    #reply {
      width: 100%;
      text-align: center;
      border-top: 1px solid #D8D8D8;
      margin-top: 15px;
      font-family: 'GowunDodum-Regular';
   }
   
    #listReply {
      padding-top: 70px;
      text-align: left;
      font-family: 'GowunDodum-Regular';
   }
</style>
</head>

<body>

   

   <!-- Header Section Begin -->
   <header class="header">
      <div class="container-fluid">
         <div class="row">
            <div class="col-xl-3 col-lg-8">
               <div class="header__logo">
                  <a href="${path }/"><img src="img/logo.jpg" width="180" height="60" alt=""></a>
               </div>
            </div>
            <div class="col-xl-5 col-lg-6">
               <nav class="header__menu">
                  <ul>
                     <li></li>
                     <!-- 메뉴 위치 고정 -->
                     <li></li>
                     <!-- 메뉴 위치 고정 -->
                     
                     <li><a href="${path}/">HOME</a></li>
                     <li><a href="${path}/productList.do?productList">ALL</a></li>
                     <li><a href="${path}/productList.do?category=top">TOP</a></li>
                     <li><a href="${path}/productList.do?category=pants">PANTS</a></li>
                     <li><a href="memberboardList.do">MEMBER-BOARD</a></li>
                     <li><a href="${path}/noticeList.do">NOTICE</a></li>
                     <li><c:if test="${sessionScope.admin_id !=null}"><a href="#">ADMIN</a>
                        <ul class="dropdown">
                           <li><a href="${path}/userList.do">USER</a></li>
                           <li><a href="${path}/productWrite.do">PRODUCT</a></li>
                        </ul></c:if></li>
                  </ul>
               </nav>
            </div>
            <div class="col-lg-3">
               <div class="header__right">
                  <div class="header__right__auth">
<c:choose>
    <c:when test="${sessionScope.admin_id != null}">
     <span style="color: #86A5FF; font-family: 'GowunDodum-Regular'; font-size: 19px;">
       ${sessionScope.admin_name}
        <a href="${path}/adminLogout.do">로그아웃</a>
    </c:when>
    <c:when test="${sessionScope.user_id != null}">
        <span style="color: #86A5FF; font-family: 'GowunDodum-Regular'; font-size: 19px;">
      ${sessionScope.user_name}님
        <a href="${path}/logout.do">로그아웃</a>
    </c:when>
    <c:otherwise>
        <a href="${path}/login.do">Login</a>
    </c:otherwise>
</c:choose>
      
                  <a href="${path}/mypageform.do">My page</a>
                  </div>
                  <ul class="header__right__widget">
                     <li><a href="${path}/productSearchA.do"><span class="icon_search search-switch"></span></a></li>
                     <li><a href="${path}/cartList.do"><span class="icon_bag_alt"></span>
                           </a></li>
                           
                  </ul>
               </div>
            </div>
         </div>
         <div class="canvas__open">
            <i class="fa fa-bars"></i>
         </div>
      </div>
   </header>
   <!-- Header Section End -->
</body>
</html>   