<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>
<meta charset="UTF-8">
<!-- 아이디,비밀번호,이름,전화번호,생년월일,이메일 -->

<style>
   #pro_tb {
      width:1140px;
      height:500px;
     
   }

   #prof_tr {
      
   }
   
   #prof_th {
      width:200px;
      background-color:#f8f8f8;
      padding-left:10px;
   }
   
   #prof_td {
      
      padding-left:10px;
   }
   
   #user_address {
      text-align:left;
      border:1px solid black;
      
   }
   
   input {
      
   }
   
   #bt_div {
      text-align:right;
      padding: 5px 0px;
   }
   
   #pro_bt {
      padding:5px;
      background-color: #333;
	  color: #fff;
	  
	  border-radius: 4px;
	  cursor: pointer;
	
   }
   
	#pro_back{
		 
	}
	
	#pro_tbt{
		border:2px solid #333;
		width:100%;
		margin:10px 0px; 
		border-collapse:separate;
  		border-spacing: 0;
  		border-radius:15px;
	}
	
	td img{
		border-collapse:separate;
  		border-spacing: 0;
		border-radius:50%;
	}
</style>

</head>
<body>
<div class="container mt-3">
    <table id="pro_tbt">
       <thead>
          <tr>
               <td align="center"><img src="" alt="" onerror="this.src='//img.echosting.cafe24.com/skin/base/member/img_member_default.gif';" class="myshop_benefit_group_image_tag"/></td>
              <td colspan="2">안녕하세요<span style="color: #86A5FF; font-family: 'GowunDodum-Regular'; font-size: 19px;">
              ${user_id}님 </span> [ OTSAJYOO ] 옷사줘 입니다.</br>저희 쇼핑몰을 이용해 주셔서 감사합니다.</td>
          </tr>
       </thead>
   </table>
   <form name="form1" method="post" action="${path}/mypageform.do">
    <table border="1" id="pro_tb" >
       <tr id="prof_tr">
         <th scope="row" id="prof_th"><img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"/>&nbsp;아이디</th>
         <td id="prof_td"><input name="user_id" value="${user_id}" readonly="readonly"></td>
      </tr>

      <tr id="prof_tr">
         <th scope="row" id="prof_th"><img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"/>&nbsp;이름</th>
         <td id="prof_td"><input name="user_name" value="${user_name}" readonly="readonly"></td>
      </tr>
      
      <tr id="prof_tr">
      <th id="prof_th">&nbsp;&nbsp;주소</th>
         <td id="prof_td">
            <input id="user_address" name="user_address1" value="${dto.user_address1}" readonly="readonly">&nbsp;&nbsp;<input id="user_address" name="user_address2" value="${dto.user_address2}" readonly="readonly">&nbsp;
            <input id="user_address" name="user_address3" value="${dto.user_address3}" readonly="readonly"/>         
         </td>
      </tr>
      
      <tr id="prof_tr">   
    <th id="prof_th">&nbsp;&nbsp;전화번호</th>
    <td id="prof_td"><input name="user_phone" value="${dto.user_phone}" readonly="readonly"></td>
</tr>
      
      <tr id="prof_tr">   
         <th id="prof_th">&nbsp;&nbsp;생년월일</th>
         <td id="prof_td"><input type="date" value="${dto.user_birth}" readonly="readonly"></td>
      </tr>
      
      <tr id="prof_tr">   
         <th id="prof_th">&nbsp;&nbsp;이메일</th>
         <td id="prof_td"><input value="${dto.user_email}" readonly="readonly"></td>
      </tr>
   </table>
      <div id="bt_div">
		<td colspan="12" align="center">
            <input id="pro_bt" type="button" value="돌아가기" onclick="location.href='${path}/mypageform.do'"/>
		</td>
    </div>     
   </form>
</div>
</body>
<%@ include file="include/footer.jsp" %>
</html>