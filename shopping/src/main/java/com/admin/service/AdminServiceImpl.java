package com.admin.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.admin.dao.AdminDAO;
import com.admin.dto.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO dao;

	@Override
	public String adminLoginCheck(AdminVO vo) {
		return dao.adminLoginCheck(vo);
	}

}
