<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>
<script>
   // 게시글 수정
   $(document).ready(function(){
      $("#btnUpdate").click(function(){
         var title = $("#title").val();
         var content = $("#content").val();
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
            
         document.form.action="${path}/memberboardUpdate.do";
         document.form.submit();
         
         });
      
         // 게시글 삭제
         $("#btnDelete").click(function(){
            // 댓글이 존재하는 게시물은 삭제 방지
            var count = "${count}";
            // 댓글의 수가 0보다 크면 팝업, 함수 종료
            if(count > 0) {
               alert("댓글이 있는 게시물은 삭제할 수 없습니다");
               return;
            }
            // 댓글의 수가 0인경우 삭제가능
            else if(confirm("삭제하시겠습니까?")){
               document.form.action="${path}/memberboardDelete.do";
               document.form.submit();
            }
         });
         
         // 목록 이동 - 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
         $("#btnList").click(function(){
            location.href="${path}/memberboardList.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
         });
         
         // 댓글 입력
         $("#btnReply").click(function(){
            reply(); // 폼데이터 형식
            //replyJson(); // json 형식
         });
         //댓글 목록
         listReply("1") // 댓글 목록 불러오기
         //listReply2(); // json 방식(하단생성)
         //listReplyRest("1"); // rest 방식()
      });
      // 댓글 입력 함수(폼 데이터 방식)
      function reply(){
         var replytext=$("#replytext").val();
         var bno="${dto.bno}"
         var secretReply = "n";
         if( $("#secretReply").is(":checked") ){
            secretReply = "y";
         }
         // 비밀댓글 파라미터 추가
         var param="replytext="+replytext+"&bno="+bno+"&secretReply="+secretReply;
         $.ajax({
            type: "post", 
            url : "${path}/insertReply.do", 
            data: param, 
            success: function(){
               alert("댓글이 등록되었습니다");
               //listReply2()
               listReply("1");
            }
         });
      }
      
      // 댓글 입력 함수(json 방식)
      function replyJson(){
         var replytext=$("#replytext").val();
         var bno="${dto.bno}"
         // 비밀댓글 체크 여부
         var secretReply = "n";
         // 태그.is(":속성") 체크여부 true/false
         if( $("#secretReply").is(":checked") ){
            secretReply = "y";
         }
         
         $.ajax({
            type: "post", 
            url: "${path}/insertRestReply.do", 
            headers: {
               "Content-Type" : "application/json"
               }, 
               dataType: "text", 
               data: JSON.stringify({
                  bno : bno, 
                  replytext : replytext, 
                  secretReply : secretReply
               }),
               success: function(){
                  alert("댓글이 등록되었습니다.");
                  // 댓글 입력 완료 후 댓글 목록 불러오기 함수 호출
                 //listReply("1"); // Controller 방식
                  listReply2(); // json 방식
                  //listReplyRest("1"); // rest 방식
               }
         });
         
      }
      // 댓글 목록 // Controller 방식
      function listReply(num){
         $.ajax({
            type: "get",
            url: "${path}/replyList.do?bno=${dto.bno}&curPage="+num,
            success: function(result){
               $("#listReply").html(result);
            }
         });
      }
      
      function listReply2(){
         $.ajax({
            type: "get",
            //contentType: "application/json", // RestController 방식이여서 생략이 가능
            url: "${path}/replyListJson.do?bno=${dto.bno}",
                  success: function(result){
                     console.log(result);
                     var output = "<table>";
                     for(var i in result){
                        output +="<tr>";
                        output +="<td>"+result[i].user_name;
                        output +="("+changeDate(result[i].regdate)+")<br>";
                        output += result[i].replytext+"</td>";
                        output += "<tr>";
                     }
                     output += "</table>";
                     $("#listReply").html(output);
            }
         });
      }
      // 2.2댓글 목록 // 날짜 형식 변환 함수
      function changeDate(date){
         date = new Date(parseInt(date));
         year = date.getFullYear();
         month = date.getMonth();
         day = date.getDate();
         hour = date.getHours();
         minute = date.getMinutes();
         second = date.getSeconds();
         strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
         return strDate;
      }
      
      // 2.3댓글 목록 // rest 방식
      function listReplyRest(num){
         $.ajax({
            type: "get",
            url: "${path}/replyList.do${dto.bno}/"+num,
            success: function(result){
               $("#listReply").html(result);
            }
         });
      }
      
      // 댓글 수정화면 생성 함수
      function showReplyModify(rno){
         $.ajax({
            type: "get", url: "${path}/replyDetail.do/"+rno,
            success: function(result){
               $("#modifyReply").html(result);
               // 태그.css("속성", "값")
               $("#modifyReply").css("visibility", "visible");
            }
         })
      }
   </script>
<style>
   #modifyReply {
      width: 600px;
      height: 130px;
      background-color : gray;
      padding: 10px;
      z-index: 10;
      visibility: hidden;
   }
   
   h2 {
      text-align:center;
      padding:20px 0px;
   }
   
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
   
    #reply {
      width:100%;
      text-align:center;
      border-top:1px solid #D8D8D8;
      margin-top:15px;
      
   }
   
    #footer {
      width:100%;
      text-align:center;
      border-top:1px solid #D8D8D8;
      margin-top:110px;
      
   }
   
    #con {
      width:100%;
      text-align:left;
      margin-top:10px;
      
   }
   
   #re_btn {
      text-align:left;
   }   
   #btnReply {

      border:1px solid black;
      padding:5px;
      background-color:#333;
      color:#fff;
      float:right;
      
   }

   #listReply {
    padding-top:70px;
      text-align:left;
   }
   
   .f_div{
      border:1px solid black;
      padding:10px 25px 20px;
   }
   
   
   td{
      padding:5px 10px;
   }
   
   #content{
      border:1px solid black;
      margin-top:20px;
      border-color:#848484;
   }
   
    @font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

</style>
</head>
<body>

<div class="container" style="font-family: 'GowunDodum-Regular';" id="con">
  <h2 style="font-family: 'GowunDodum-Regular';">게시글 보기</h2>
  
  <form name="form" method="post">
    <div class="form-group">
      <div>
         작성일자 : <fmt:formatDate value="${dto.regdate}" pattern= "yyyy-MM-dd a HH:mm:ss"/>
      </div>
      <div>
         조회수 : ${dto.viewcnt}
      </div>
    </div>
    
    <div class="f_div">
      <table>
         <tr>
            <th style="width:10%;">제목</th>
     <!--     <label for="title">제목</label> -->
         
        <td> <input class="col-md-6" type="text" id="title" value="${dto.title}"
       name="title" size="80" placeholder="제목을 입력하세요" maxlength="45"> </td>
       </tr>
       <tr>
      <th>이름</th>
   <!--    <label for="writer">이름</label> -->
     <td> <input class="col-md-6" type="text" id="writer"
      value="${dto.writer}" placeholder="이름을 입력하세요" name="writer"> </td>
      </tr>
      </table>
       <textarea class="form-control" name="content" id="content" rows="13" cols="80" placeholder="내용을 입력하세요">${dto.content}</textarea>
    </div>
   <!-- container -->
         
       

    
    <div style="width:100%; text-align:center;">
      <input type="hidden" name="bno" value="${dto.bno}">
      <!-- 본인이 쓴 게시물만 수정, 삭제가 가능 -->
      <div style="text-align:right; margin-right:10px;">
       <c:if test="${sessionScope.user_id == dto.writer}">
         <button class="btn1" type="button" id="btnUpdate">수정</button>
         <button class="btn1" type="button" id="btnDelete">삭제</button>
      </c:if>
         <button class="btn1" type="button" id="btnList">목록</button>
       </div>
   </div>
  </form>
 </div>

  <div id="reply">
  <div class="container">
      <br>
      <!-- 로그인 한 회원에게만 댓글 작성 가능 -->
      <div id="reply2" style="width:97%;">
       <c:if test="${sessionScope.user_id != null}">
         <textarea rows="5" id="replytext" placeholder="댓글을 입력하세요" style="width:100%;"></textarea>
      </c:if>
      
      <div id="replylist"> 
   <div id="re_btn">
    <!-- 비밀댓글 체크박스 -->
       <input type="checkbox" id="secretReply">비밀 댓글    
       <button type="button" id="btnReply">댓글 작성</button>   
   </div> 
  </div>
 </div>
      
   <!-- 댓글 목록 출력 위치 -->
    <div id="listReply"></div> 
    </div>
  </div>
  <div id="footer">
  <%@ include file="include/footer.jsp" %>
  </div>


</body>
</html>