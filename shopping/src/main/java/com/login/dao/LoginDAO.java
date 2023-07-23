package com.login.dao;

import javax.servlet.http.HttpSession;

import com.user.dto.UserVO;

public interface LoginDAO {

	public boolean loginCheck(UserVO vo);

	public UserVO viewUser(UserVO vo);
	
	public void logoutUser(HttpSession session);


}
