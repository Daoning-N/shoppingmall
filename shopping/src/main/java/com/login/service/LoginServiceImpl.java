package com.login.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.login.dao.LoginDAO;
import com.user.dto.UserVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	LoginDAO loginDao;

	@Override
	public boolean loginCheck(UserVO vo, HttpSession session) {
		boolean result = loginDao.loginCheck(vo);
		if (result) {
			UserVO vo2 = viewUser(vo);

			session.setAttribute("user_id", vo2.getUser_id());
			session.setAttribute("user_name", vo2.getUser_name());
		}
		return result;
	}

	@Override
	public UserVO viewUser(UserVO vo) {
		return loginDao.viewUser(vo);
	}

	@Override
	public void logoutUser(HttpSession session) {
		session.invalidate();
	}
}
