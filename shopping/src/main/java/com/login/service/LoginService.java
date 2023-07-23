package com.login.service;

import javax.servlet.http.HttpSession;

import com.user.dto.UserVO;

public interface LoginService {

	public boolean loginCheck(UserVO vo, HttpSession session);

	public UserVO viewUser(UserVO vo);
	
	public void logoutUser(HttpSession session);

}
