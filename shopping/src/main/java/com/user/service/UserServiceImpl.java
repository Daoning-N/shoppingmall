package com.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.user.dao.UserDAOImpl;
import com.user.dto.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAOImpl userdao;

	@Override
	public List<UserVO> userList() {

		return userdao.userList();
	}

	@Override
	public void insertUser(UserVO vo) {
		
		userdao.insertUser(vo);

	}

	@Override
	public UserVO viewUser(String user_id) {

		return userdao.viewUser(user_id);
	}
	
	@Override
	public void updateUser(UserVO vo) {

		userdao.updateUser(vo);
	}

	@Override
	public void deleteUser(String user_id) {

		userdao.deleteUser(user_id);
	}

	@Override
	public boolean checkPw(String user_id, String user_pw) {

		return userdao.checkPw(user_id, user_pw);
	}
	//어드민
	@Override
	public String loginCheck(UserVO vo) {
		return userdao.loginCheck(vo);
	}
	//중복 체크
	@Override
	public UserVO idChk(String user_id) throws Exception{
		return userdao.idChk(user_id);
	}
}
