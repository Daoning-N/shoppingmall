<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.container1 {
display: flex;
justify-content: center;
align-items: center;
text-align: center;

      }
.btn btn-dark {
padding: 10px 20px;
background-color: #333;
color: #fff;
border: none;
border-radius: 4px;
cursor: pointer;
width: 500px;

      }
div.abc{
text-align:center;
}

form.abc {
border-width: 5px 10px;
border: 1px solid gray;
padding: 15px;
text-align: center;
margin:auto;
width: 430px;
height: 235px;
border-radius: 10px;
background-color: #f8f8f8;


      }


form button {
border: 1px solid #000;
padding: 15px;
margin: 5px;
width: 150px;

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

</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인페이지</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>

<script>
   $(document).ready(function(){
      $("#btnAdminLogin").click(function(){
         // 태크.val() : 태그에 입력된 값
         // 태크.val("값ㅅ") : 태그의 값을변경
         var user_id = $("#admin_id").val();
         var user_pw = $("#admin_pw").val();
         if(user_id == ""){
            alert("아이디를 입력하세요.");;
            $("#admin_id").focus(); //입력포커스 이동
            return;
         }
         if(user_pw == ""){
            alert("비밀번호를 입력하세요.");
            $("#admin_pw").focus();
            return;
         }
         // 폼 내부의 데이터를 전송할 주소
         document.form1.action="${path}/adminLoginCheck.do"
         //제출
         document.form1.submit();
      });
   });
</script>
</head>
<body>
<br>
<a href="#"><img class="otsajo" src="img/logo.jpg" alt=""></a>
<br>

   <form name="form1" method="post" class="abc">
      
         
         <p style="text-align:center">ID　　<input name="admin_id" id="admin_id" placeholder="관리자아이디" title="관리자아이디" style="width: 345px; height: 50px;"><p>
         <p style="text-align:center">PW 　<input type=password name="admin_pw" id="admin_pw" placeholder="관리자비밀번호" title="관리자비밀번호" style="width: 345px; height: 50px;"><p>
         
         <div class="container1" >   
            <button style="width: 470px; height: 50px;"  type="button" id="btnAdminLogin" class="btn btn-dark">adminLogin</button>
            </div>
             
            <c:if test="${msg == 'failure' }">
               <div style="color: red">
                  아이디 또는 비밀번호가 일치하지 않습니다.
               </div>
            </c:if>
            
            <c:if test="${msg == 'logout' }">
               <div style="color: red">
                  로그아웃되었습니다.
               </div>
            </c:if>
            
                     
         

         
   </form>



<%@ include file="include/footer.jsp" %>
</body>
</html>