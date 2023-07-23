package com.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.notice.dto.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	SqlSession session;
	
	@Override
	public List<NoticeVO> noticeList() throws Exception{
		return session.selectList("noticeList");
	}
	@Override
	public void insertNotice(NoticeVO vo) throws Exception{
		session.insert("notice.insertNotice", vo);
		
	}
	@Override
	public void updateNotice(NoticeVO vo) throws Exception{
		session.update("notice.updateNotice", vo);
	}
	@Override
	public void deleteNotice(int notice_id) throws Exception{
		session.delete("notice.deleteNotice", notice_id);
	}
	@Override
	public NoticeVO noticeView(int notice_id) throws Exception{
		return session.selectOne("notice.noticeView", notice_id);
	}
	
}
