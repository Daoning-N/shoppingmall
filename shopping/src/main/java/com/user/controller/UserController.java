package com.user.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.user.dto.UserVO;
import com.user.service.UserService;

@Controller //현재의 클래스를 controller bean에 등록시킴
public class UserController { 
private static final Logger Logger =
LoggerFactory.getLogger(UserController.class);
   
   //MemberService 객체를 스프링에서 생성하여 주입시킴
   @Inject
   UserService userService;
   
   // 01. 회원목록
   // url pater mapping
   @RequestMapping("userList.do")
   public String userList(Model model) {
      //controller => service => dao 요청
      
      List<UserVO> list = userService.userList();
      model.addAttribute("list", list);
      return "userList";
   }
   // 02_01 회원 등록 페이지로 이동
   @RequestMapping("userWrite.do")
   public String userWrite() {

      return "userWrite";
   }
   
   // 02_02 회원 등록 처리 후 ==> 회원목록으로 리다이렉트
   // @ModelAttribute에 폼에서 입려한 데이터가 저장된다
   @RequestMapping(value="userInsert.do", method=RequestMethod.POST)
   public String userInsert(@ModelAttribute UserVO vo, Model model) {

      userService.insertUser(vo);

      return "redirect:/login.do";
   }
   
   //중복 체크
   @ResponseBody
   @RequestMapping(value="idChk.do", method=RequestMethod.POST)
   public int idChk(HttpServletRequest req) throws Exception{
	   String user_id = req.getParameter("user_id");
	   UserVO idChk = userService.idChk(user_id);
	   
	   int result = 0;
	   
	   if(idChk !=null) {
		   result = 1;
	   }
	   return result;
   }
   
   // 03. 회원 상세정보 조회
   @RequestMapping("userView.do")
   public String userView(String user_id, Model model) {

      model.addAttribute("dto", userService.viewUser(user_id));
      
      Logger.info("클릭한 아이디 : " +user_id);
      // user_view.jsp로 포워드
      return "userView";
   }
   
   @RequestMapping("profileform.do")
   public String profileform(String user_id, Model model, HttpSession session) {
	  user_id = (String) session.getAttribute("user_id");
      model.addAttribute("dto", userService.viewUser(user_id));
      
      return "profileform";
   }
   
   
   // 04. 회원 정보 수정 처리
   @RequestMapping("userUpdate.do")
   public String userUpdate(@ModelAttribute UserVO vo, Model model) {

      boolean result = userService.checkPw(vo.getUser_id(), vo.getUser_pw());

      if(result) {
         userService.updateUser(vo);

         return "redirect:/userList.do";

      }else {
         UserVO uVo = userService.viewUser(vo.getUser_id());

         vo.setUser_joindate(uVo.getUser_joindate());
         vo.setUser_update(uVo.getUser_update());

         model.addAttribute("dto", vo);
         model.addAttribute("message", "비밀번호가 일치하지 않습니다.");

         return "userView";
      }
   }
   
   //0 5. 회원정보 삭제 처리
   @RequestMapping("userDelete.do")
   public String userDelete(@RequestParam String user_id, @RequestParam String user_pw, Model model) {

      boolean result = userService.checkPw(user_id, user_pw);

      if(result) {
         userService.deleteUser(user_id);

         return "redirect:/userList.do";

      }else {
         model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
         model.addAttribute("dto", userService.viewUser(user_id));

         return "userView";
      }
   }
   
}