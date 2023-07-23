package com.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter { //Interceptor: servlet 관리자만 접근 가능, MVC에서 공통된 작업을 처리하기 위한 강력한 도구
   // 요청 전 처리
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		   throws Exception { //Object handler: 현재 요청을 처리할 핸들러 객체
      HttpSession session= request.getSession(); //HttpServletRequest를 통해 세션 객체를 얻어옴

      if(session.getAttribute("admin_id") == null) {
         response.sendRedirect(request.getContextPath()+"/login.do? msg=nologin");
         return false;
      }else {
         return true;
      }
   }
   //요청 처리 후
   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
          ModelAndView modelAndView) throws Exception {
      super.postHandle(request, response, handler, modelAndView); //Object handler: 처리된 핸들러 객체
   }
}
/*
inertceptor
요청 전처리: 핸들러 메서드 실행 전에 공통적인 작업을 수행할 수 있습니다. 예를 들어, 인증, 로깅, 트랜잭션 등의 작업을 수행할 수 있습니다. 
요청의 유효성을 검사하고 필요한 경우 예외를 던지거나 다른 페이지로 리다이렉트할 수도 있습니다.

요청 후처리: 핸들러 메서드가 실행된 후에 공통적인 작업을 수행할 수 있습니다. 주로 응답 데이터의 가공이나 로깅 등의 작업을 수행할 수 있습니다.
 */
 