<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 작성</title>
	<%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
<script>
	$(document).ready(function(){
	$("#btnSave").click(function(){
		var notice_title = $("#notice_title").val();
		var notice_content = $("#notice_content").val();
		if(notice_title == ""){
			alert("제목을 입력하세요");
			document.form1.notice_title.focus();
			return;
		}
		if(notice_content == ""){
			alert("내용을 입력하세요");
			document.form1.notice_content.focus();
			return;
		}
		
		document.form1.submit();
	});
});
</script>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
	button {
		border:1px solid black;
		padding:7px 12px;
	}
	
	#btnSave {
		margin-right:3px;
		font-family: 'Do Hyeon', sans-serif;
	}
	
	.btn {
   	border:1px solid black;
    margin:0px 2px;
    margin-top:15px;
    background-color:#333;
    color:#fff;
    font-family: 'Do Hyeon', sans-serif;
   }
   
   #Write_form{
   	border:1px solid black;
   	padding:15px 20px;
   }
   
   #notice_content {
   	border:1px solid #848484;
   }
   
   .form-group{
   
   	font-family: 'Do Hyeon', sans-serif;
   }
   
</style>

</head>
<body>
<div class="container">
  <h2 style="margin:20px 0px; text-align:center;">공지 작성</h2>
<form name="form1" id="form1" method="post" action="${path}/insertNotice.do">
	<div id="Write_form">
	<div class="form-group">
      <label for="title">제목</label>
      <input type="text" id="notice_title"
       name="notice_title" placeholder="제목을 입력하세요" style="width:100%;"> 
       
    </div>
    <div class="form-group">
   	  <label for="content">내용</label>
      <textarea class="form-control" name="notice_content" id="notice_content" rows="13" cols="80" placeholder="내용을 입력하세요"></textarea>
 	</div>
 	
	<div class="form-group">
	<label for="name">이름</label>
		<input name="notice_writer" id="notice_writer" style="width:100%" value="CS옷사조" readonly>
	</div>
	</div>
	<div style="width:100%; text-align:right;">
		<button class="btn" type="button" id="btnSave">확인</button>
		<button class="btn"type="reset">취소</button>
	</div>
	
</form>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>