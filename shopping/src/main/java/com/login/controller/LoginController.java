package com.login.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.login.service.LoginService;
import com.user.dto.UserVO;

@Controller
public class LoginController {

	@Inject
	LoginService loginService;

	@RequestMapping("login.do")
	public String login() {
		return "login";
	}

	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute UserVO vo, HttpSession session){
		boolean result = loginService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if (result) {

			mav.setViewName("main");
			mav.addObject("msg", "success");
		} else {

			mav.setViewName("login");
			mav.addObject("msg","failure");
		}
		return mav;
	}

	//03. 로그아웃처리
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		loginService.logoutUser(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		mav.addObject("msg", "logout");
		return mav;
	}
}
