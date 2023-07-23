package com.login.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.user.dto.UserVO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Inject
	SqlSession sqlSession;

	String nameSpace = "login";

	@Override
	public boolean loginCheck(UserVO vo) {
		String name = sqlSession.selectOne(nameSpace+".loginCheck", vo);
		return(name == null) ? false : true;
	}

	@Override
	public UserVO viewUser(UserVO vo) {
		return sqlSession.selectOne(nameSpace+".viewUser", vo);
	}

	@Override
	public void logoutUser(HttpSession session) {


	}

}
