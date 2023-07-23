<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="include/header.jsp" %>
    <script>
    //3. 댓글 수정
       $("#btnReplyUpdate").click(function() {
          var detailReplytext=$("#detailReplytext").val();
          $.ajax({
             type:"put",
             url:"${path}/updateReply/${vo.rno}",
             // 기본값 text/html을 json으로 변경
             headers:{
                "Content-Type":"application/json"
             },
             // 데이터를 json형태로 변환
             data:JSON.stringify({
                replytext : detailReplytext
             }),
             dataType:"text",
             success:function(result){
                if(result=="success"){
                   $("#modifyReply").css("visibility", "hidden");
                   //댓글 목록 갱신
                   listReply("1");
                }
             }
          });
       });
    
       // 4. 댓글 상세화면 닫기
       $("#btnReplyClose").click(function() {
          $("#modifyReply").css("visibility", "hidden");
       });
       
       // 5. 댓글 삭제
       $("#btnReplyDelete").click(function() {
          if(confirm("삭제하시겠습니까?")) {
          $.ajax({
             type:"delete",
             url:"${path}/deleteReply/${vo.rno}",
             success:function(result){
                alert("삭제되었습니다.");
                $("#modifyReply").css("visibility", "hidden");
                listReply("1");
             }
         });
      }
   });
</script>
<style>
    .btn1 {
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
   댓글 번호 : ${vo.rno}<br>
   <textarea id="detailReplytext" rows="5" cols="82">${vo.replytext}</textarea>
   <div style="text-align:center;">
      <c:if test="${sessionScope.user_id==vo.replyer}"></c:if>
         <button class="btn1" type="button" id="btnReplyUpdate">수정</button>
         <button class="btn1" type="button" id="btnReplyDelete">삭제</button>
         <button class="btn1" type="button" id="btnReplyClose">닫기</button>
   </div>   
</body>
</html>