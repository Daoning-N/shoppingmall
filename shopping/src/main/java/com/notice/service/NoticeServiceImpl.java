package com.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.notice.dao.NoticeDAO;
import com.notice.dto.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	NoticeDAO dao;
	
	@Override
	public List<NoticeVO> noticeList() throws Exception{
		return dao.noticeList();
	}
	@Override
	public void insertNotice(NoticeVO vo) throws Exception{
		dao.insertNotice(vo);
	}
	@Override
	public void updateNotice(NoticeVO vo) throws Exception{
		dao.updateNotice(vo);
	}
	@Override
	public void deleteNotice(int notice_id) throws Exception{
		dao.deleteNotice(notice_id);
	}
	@Override
	public NoticeVO noticeView(int notice_id) throws Exception{
		return dao.noticeView(notice_id);
	}
	
}