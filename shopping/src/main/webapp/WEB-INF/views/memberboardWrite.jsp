<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>
<%@ include file="include/sessionCheck.jsp" %>
<script>
   $(document).ready(function(){
      $("#btnSave").click(function(){
         // var title = document.form.title.value; // name 속성으로 실행
         // var content = document.form.content.value;
         // var writer = document.form.writer.value;
         var title = $("#title").val();
         var content = $("#content").val();
         // var cs_writer = $("#cs_writer").val();
         if(title == ""){
            alert("제목을 입력하세요");
            document.form.title.focus();
            return;
         }
         if(content == ""){
            alert("내용을 입력하세요");
            document.form.content.focus();
            return;
         }
         document.form.submit();
      });
   });
</script>

<style>
   button {
      border:1px solid black;
      padding:7px 12px;
   }
   
   #btnSave {
      margin-right:3px;
   }
   
   .btn {
      border:1px solid black;
      background-color:#333;
      color:#fff;
      margin:0px 2px;
   }
   
   .memWrite_title{
   	margin:20px 0px;
   	text-align:center;
   }
   
   #memWrite_form{
   	border:1px solid black;
   	padding:15px 20px;
   }
   
   #memWrite_btn{
   	width:100%;
   	text-align:right;
   	margin-top:15px;
   }
   
   #content {
   	border:1px solid #848484;
   }
</style>

</head>
<body>

<div class="container">
  <h2 class="memWrite_title">게시글 작성</h2>
  <form name="form" method="post" action="${path}/memberboardInsert.do">
  	<div id="memWrite_form">
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" id="title"
       name="title" placeholder="제목을 입력하세요" maxlength="45" style="margin-left:5px; width:100%;"> 
    </div>
    <div class="form-group">
        <label for="content">내용</label>
      <textarea class="form-control" name="content" id="content" rows="13" cols="80" placeholder="내용을 입력하세요"></textarea>
    </div>
    </div>
    <div style="" id="memWrite_btn">
      <button class="btn" type="button" id="btnSave">확인</button>
      <button class="btn" type="reset">취소</button>
   </div>
  </form>
</div>

</body> 

</html>