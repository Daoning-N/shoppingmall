package com.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.admin.dto.AdminVO;
import com.admin.service.AdminService;


@Controller
@RequestMapping("/*")
public class AdminController {

   @Inject
   AdminService service;

   @RequestMapping("adminLogin.do")
   public String login() {
	   
      return "adminLogin";
   }

   @RequestMapping("adminLoginCheck.do")
   public ModelAndView loginCheck(HttpSession session, AdminVO vo , ModelAndView mav) { //HttpSession: 사용자의 상태 정보를 유지, set으로 session에 속성 설정, get으로 해당 session 속성값 가져오기
	  
	   //입력받은 관리자 정보(vo)를 서비스 객체(service)를 통해 확인하고, 관리자의 이름을 반환받아 name 변수에 저장
      String name = service.adminLoginCheck(vo);

      if(name != null) {
         session.setAttribute("admin_id", vo.getAdmin_id()); //setAttribute -> session객체에 저장, vo.getAdmin_id()는 AdminVO 객체인 vo에서 관리자의 아이디를 가져오는 메서드를 호출한 결과 
         session.setAttribute("admin_name", name);
         mav.setViewName("adminHome");
         mav.addObject("msg", "success");
         
      }else {
         mav.setViewName("adminLogin");
         mav.addObject("msg", "failure");
      }
      return mav;
   }

   @RequestMapping("adminLogout.do")
   public ModelAndView logout(HttpSession session) {
      session.invalidate(); //세션을 무효화하여 현재 세션을 종료, 이는 세션에 저장된 모든 데이터를 삭제하고 세션 자체를 파기
      ModelAndView mav = new ModelAndView();
      mav.setViewName("adminLogin");
      mav.addObject("msg", "logout");
      return mav;
   }
}