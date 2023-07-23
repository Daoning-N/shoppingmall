package com.memberboard.dto;

import java.sql.Timestamp;

public class MemberboardVO {

   private int bno;
   private String title;
   private String content;
   private String writer;
   private Timestamp regdate;
   private int viewcnt;
   private String user_name;
   private int recnt;

public int getBno() {
	return bno;
}
public void setBno(int bno) {
	this.bno = bno;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
}
public Timestamp getRegdate() {
	return regdate;
}
public void setRegdate(Timestamp regdate) {
	this.regdate = regdate;
}
public int getViewcnt() {
	return viewcnt;
}
public void setViewcnt(int viewcnt) {
	this.viewcnt = viewcnt;
}
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public int getRecnt() {
	return recnt;
}
public void setRecnt(int recnt) {
	this.recnt = recnt;
}

@Override
public String toString() {
	return "MemberboardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
			+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", user_name=" + user_name + ", recnt=" + recnt + "]";
}
   
}