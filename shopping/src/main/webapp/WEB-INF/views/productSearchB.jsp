<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
   <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Category Search</title>
    <style>    
       #p_write {
          width:100%;
       }
       
       #p_td1 {
          text-align:center;
       }
       
       #p_td2 {
          padding-left:10px;
          padding:2px 0px;
       }
       
       #p_row {
          border-bottom:1px solid #A4A4A4;
       }
       
       #p_title {
          text-align:center;
          padding:15px 0px 10px 0px;
          font-weight:500;
       }
       
       #p_btn {
          padding:10px 0px;
       }
       
       .p_bn {
          border:1px solid black;
          padding:6px 10px;
          border-radius:6px;
       }
       
       #bt2 {
          margin-left:5px;
       }
       
       img.otsajo {
         width : 230px;
         height : 80px;
         text-align:center;
         margin: auto;
         display: flex;
         justify-content: center;
         align-items: center;

      }
      #form {
         border-width: 5px 10px;
         border: 1px solid gray;
         padding: 15px;
         text-align: center;
         margin:auto;
         width: 470px;
         border-radius: 10px;
         background-color: #f8f8f8;
      }
      
      input[type=button] {
         background-color: #333;
         color: #fff;
         border: none;
         border-radius: 4px;
         cursor: pointer;
         margin:10px 0px;
         padding:5px 10px;
      }
    </style>
    
</head>

<body>
   
   <br>
      <a href="#"><img class="otsajo" src="img/logo.jpg" alt=""></a>

  <h2 id="p_title">분석 결과</h2>   
  <!--  -->
  <div class="container">
   <form action="" id="form" name="form" enctype="multipart/form-data" method="post">
   <table id="p_write">
      <tr id="p_row">
         <td>
           <img src="https://daoningbucket.s3.ap-northeast-2.amazonaws.com//shirt.jpg">
           <input type="button" value="돌아가기" onclick="location.href='${path}/';">
           <input type="button" value="다시하기" onclick="location.href='${path}/productSearchA.do';">
          </td>
      </tr>
   </table>
   </form>
</div>

</body>
   

<%@ include file="include/footer.jsp" %>
</html>