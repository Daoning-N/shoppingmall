package com.admin.dao;

import com.admin.dto.AdminVO;

public interface AdminDAO {
	//1. 관리자 체크
	public String adminLoginCheck(AdminVO vo);
}