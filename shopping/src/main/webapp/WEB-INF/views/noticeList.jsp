<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
	<%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btnWrite").click(function(){
			location.href = "${path}/noticeWrite.do";
		});
	});

	$(document).ready(function() {
		  // 공지사항 제목 클릭 이벤트 핸들러
		  $(".notice_title").click(function(e) {
		    e.preventDefault(); // 기본 클릭 동작 방지

		    var noticeId = $(this).data("notice_id");
		    console.log("noticeId:", noticeId); 
		    
		    // Ajax 요청 보내기
		    $.ajax({
		      type: "GET",
		      url: "${path}/noticeView.do",
		      data: { notice_id: noticeId }, //키:값
		      success: function(response) {
		        // 성공적으로 요청이 처리된 경우
		        console.log("Ajax response:", response);
		        $("#notice_details").html(response); // 아래에 상세 내용 표시
		      }
		    });
		  });
	});
</script>

<style>
	 a:link { color:black; text-decoration: none;}
	 a:visited {color:black; text-decoration: none;}
	 a:hover {color:dark; text-decoration: none;}

	table {
		border:1px solid black;
		text-align:center;
		border-collapse:separate;
	  	border-spacing: 0;
		margin:0 auto;
	}
	
	#padding_th {
		padding:7px;
		border-bottom:1px solid #333;
		
	}
	
	#padding_td {
		padding:7px;
		border-bottom:1px solid #FAFAFA;
	}
	
	h2 {
		text-align:center;
		margin-top:15px;
		margin-bottom:10px;
	}
	
	#div {
	   margin-left:10px;
	   margin:5px 10px;
	}
	
		
	#button1 {
		width:32px;
		height:27px;
		text-align:center;
	}
	
	#btnWrite {
		 border-radius:4px;
      background-color: #333;
	  color: #fff;
	  cursor: pointer;
	  border:1px solid black;
	  padding:3px 6px;
	}
	
	.write {
		border:1px solid black;
		float:right;
		
		
	}
	
	#t_head{
		background-color:#f8f8f8;
		border-bottom:1px solid black;
	}
	
	
</style>

</head>
<body>
<h2>공 지 사 항</h2>
<div class="container">
<table class="table table-sm">
          <thead id="t_head">
            <tr>
         		<th id="padding_th" width="15%;">번호</th>
         		<th id="padding_th" width="40%">제목</th>
         		<th id="padding_th" width="15%;">작성자</th>
         		<th id="padding_th" width="30%">작성일</th>
      		</tr>
          </thead>
	<tbody>
            <c:forEach var="row" items="${list}">
         <tr>
            <td id="padding_td">${row.notice_id}</td>
            <td id="padding_td"><a href="${path}/noticeView.do?notice_id=${row.notice_id}">${row.notice_title}</a></td>
            <td id="padding_td">옷사조</td>
            <td id="padding_td">
               <fmt:formatDate value="${row.notice_date}" pattern="yyyy-MM-dd"/>
            </td>
         </tr>
         <tr>
         </tr>
      </c:forEach>
      <c:if test="${empty list}"> <!-- {list}가 비어있는 경우에만 실행 -->
      	<tr>
      		<td colspan="5" style="text-align: center; vertical-align: middle; color: #999999; font-size: 16px;">조회된 게시물이 없습니다</td>
      	</tr>
      </c:if>
          </tbody>
</table>

<c:if test="${sessionScope.admin_id != null}">
<button type="button" id="btnWrite" class="write">글쓰기</button>
</c:if>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>