<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
<%@ include file="include/header.jsp" %>
<%@ include file="include/menu.jsp" %>



<script>
<%
boolean isLoggedIn = session.getAttribute("user_id") != null;
if (!isLoggedIn) {
%>
alert("로그인을 먼저 해주세요.");
location.href = "login.do";
<%
}
%>
</script>

<style>
   #info_th{
      width:100%;
      margin:10px 0px;
      border:1px solid black;
   }
   
   td{
      
      text-align:center;
   }
   
   #myinfo_td{
      text-align:center;
      background-color:#f8f8f8;
      padding:10px 0px;
   }
   
   #otsa_sho{
      border:2px solid #333;
      width:100%;
      border-collapse:separate;
        border-spacing: 0;
        border-radius:15px;
   }
   
   #otsa_sho td{
      border-collapse:separate;
        border-spacing: 0;
        
   }
   
   td img{
      border-collapse:separate;
        border-spacing: 0;
      border-radius:50%;
   }
   
   h2{
      text-align:center;
      margin-top:20px;
      font-weight:500;
   }
   
   .shopMain{
      border:1px solid black;
   }
   
   a[type=button] {
      color:#000;
   }
      .titleArea, #otsa_sho td, #myinfo_td, .shopMain, .shopMain h3, .shopMain p {
    font-family: 'GowunDodum-Regular';
   }
  
   
</style>
</head>
<body>   
<div id="container" class="container" >
<div class="titleArea">
    <h2>My Page</h2>
    <c:if test="${not empty sessionScope.user_id}">
        <!-- 로그인이 되어 있을 때 보여줄 내용 -->
    </c:if>
</div>
<c:if test="${not empty sessionScope.user_id}">

<div class="container mt-3">
  <table id="otsa_sho">
    <tbody id="otsa_td">
       <tr>
          <td align="center"><img src="" alt="" onerror="this.src='//img.echosting.cafe24.com/skin/base/member/img_member_default.gif';" class="myshop_benefit_group_image_tag"/></td>
              <td colspan="2" style="text-align: left; padding-left: 250px;">안녕하세요 
              <span style="color: #86A5FF; font-family: 'GowunDodum-Regular'; font-size: 19px;">
              ${user_id}님 </span> [ OTSAJYOO ] 옷사줘 입니다.</br>저희 쇼핑몰을 이용해 주셔서 감사합니다.</td>
       </tr>
     </tbody>
  </table>
</div>
 <table id="info_th" style="">
   
      <tr>
      <td id="myinfo_td"><strong>Information</strong></td>
      </tr>
    
    
 </table>
   <table style="width:100%; border:1px solid black;">
      <thead>
         <td class="shopMain">
               <h3><a type="button" href="${path}/orderList.do"><strong>Order</strong><br />
               <span>주문내역 조회</span></a></h3>
               <p><a type="button" href="#">고객님께서 주문하신 상품의<br/> 주문내역을 확인하실 수 있습니다.</a></p>
           </td>
           <td class="shopMain">
               <h3><a type="button" href="${path}/cartList.do"><strong>Cart</strong></br><span>장바구니</span></a></h3>
               <p><a type="button" href="#">장바구니에 넣어두신<br/> 상품의 목록을 보여드립니다.</a></p>
           </td>
           <td class="shopMain">
               <h3><a type="button" href="https://www.cjlogistics.com/ko/tool/parcel/tracking"><strong>Delivery Check</strong></br><span>배송조회</span></a></h3>
               <p><a type="button" href="#">주문하신 상품의<br/>배송 조회를 보여드립니다.</a></p>
           </td>
      </thead>
      <tbody>
           <td class="shopMain">
               <h3><a type="button" href="${path}/profileform.do"><strong>Profile</strong></br><span>회원 정보</span></a></h3>
               <p><a type="button" href="#">회원이신 고객님의 개인정보를<br/> 관리하는 공간입니다.</a></p>
           </td>
           <td class="shopMain">
               <h3><a type="button" href="${path}/memberboardList.do"><strong>MemberBoard</strong></br><span>문의글 작성</span></a></h3>
               <p><a type="button" href="#">고객님께서 문의사항에 대하여<br/> 작성하는 공간입니다.</a></p>
           </td>
           <td class="shopMain">
               <h3><a type="button" href="${path}/noticeList.do"><strong>Notice</strong></br><span>공지사항</span></a></h3>
               <p><a type="button" href="#">공지사항에 대하여<br/>확인하실 수 있습니다.</a></p>
           </td>
      </tbody>
   </table>
   </c:if>
</div>

</body>
<%@ include file="include/footer.jsp" %>
</html>