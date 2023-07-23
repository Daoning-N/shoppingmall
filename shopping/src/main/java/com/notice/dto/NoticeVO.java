package com.notice.dto;

import java.sql.Timestamp;

public class NoticeVO {
	private int notice_id;
	private String notice_title;
	private String notice_content;
	private Timestamp notice_date;
	
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Timestamp getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Timestamp notice_date) {
		this.notice_date = notice_date;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [notice_id=" + notice_id + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_date=" + notice_date + "]";
	}

}