package com.admin.service;

import com.admin.dto.AdminVO;

public interface AdminService {
	//관리자 체크
	public String adminLoginCheck(AdminVO vo);
}
