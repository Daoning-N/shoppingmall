package com.notice.dao;

import java.util.List;

import com.notice.dto.NoticeVO;

public interface NoticeDAO {

	public List<NoticeVO> noticeList() throws Exception;
	
	public void insertNotice(NoticeVO vo) throws Exception;
	
	public void updateNotice(NoticeVO vo) throws Exception;
	
	public void deleteNotice(int notice_id) throws Exception;
	
	public NoticeVO noticeView(int notice_id) throws Exception;
	
}
