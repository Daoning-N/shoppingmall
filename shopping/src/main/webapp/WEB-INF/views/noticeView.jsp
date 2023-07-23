<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
	<%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
<script>
	$(document).ready(function(){
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action="${path}/deleteNotice.do";
				document.form1.submit();
			}
		});
		$("#btnUpdate").click(function(){
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
			document.form1.action="${path}/updateNotice.do";
			
			document.form1.submit();
		});
	});
</script>

<style>
	.btn {
   	border:1px solid black;
    margin:0px 2px;
   }
   
   #board_content{
		border:1px solid black;
		margin-top:20px;
		border-color:#848484;
		
	}
	
	.f_div{
		border:1px solid black;
		padding:10px 25px 20px;
	}
	
	td{
		padding:5px 10px;
	}
	
	button[type=button] {
		border:1px solid black;
    	margin:0px 2px;
    	padding: 5px 8px;
		background-color: #333;
		color: #fff;
		border-radius: 4px;
		cursor: pointer;
		margin-top:10px;
	}
</style>

</head>
<body>
<div class="container">
<h2 style="margin:20px 0px;">공 지 사 항</h2>
<form name="form1" id="form1" method="post">
<div class="form-group">
	<div>
		작성일자 : <fmt:formatDate value="${notice.notice_date}" pattern="yyyy-MM-dd"/>
	</div>
</div>

	<div class="f_div">
      <table>
         <tr>
         	<th style="width:10%;">제목</th>
     <!--     <label for="title">제목</label> -->
         
        <td> <input class="col-md-6" type="text" id="notice_title" value="${notice.notice_title }"
       name="notice_title" size="80" placeholder="제목을 입력하세요" maxlength="45" > </td>
       </tr>
       <tr>
		<th>이름</th>
   <!--    <label for="writer">이름</label> -->
     <td> <input class="col-md-6" type="text" id="notice_writer"
      value="CS옷사조" readonly="readonly"> </td>
      </tr>
      </table>
       <textarea class="form-control" name="notice_content" id="notice_content" rows="13" cols="80" placeholder="내용을 입력하세요" >${notice.notice_content}</textarea>
    </div>

	<div style="width:100%; text-align:right;">
		<c:if test="${sessionScope.admin_id != null}">
		<input type="hidden" name="notice_id" value="${notice.notice_id}">
		<button type="button" id="btnUpdate" class="btn">수정</button>
		<button type="button" id="btnDelete" class="btn">삭제</button>
		</c:if>
	</div>
</form>
</div>


<%@ include file="include/footer.jsp" %>
</body>
</html>