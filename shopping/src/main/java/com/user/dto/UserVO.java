package com.user.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class UserVO {
	private int user_idx;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private Date user_birth;
	private String user_email;
	private Timestamp user_joindate;
	private String user_active;
	private String user_email_check;
	private String user_address1;
	private String user_address2;
	private String user_address3;
	private String user_grade;
	private Timestamp user_update;
	
	
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public Date getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(Date user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public Timestamp getUser_joindate() {
		return user_joindate;
	}
	public void setUser_joindate(Timestamp user_joindate) {
		this.user_joindate = user_joindate;
	}
	public String getUser_active() {
		return user_active;
	}
	public void setUser_active(String user_active) {
		this.user_active = user_active;
	}
	public String getUser_email_check() {
		return user_email_check;
	}
	public void setUser_email_check(String user_email_check) {
		this.user_email_check = user_email_check;
	}
	public String getUser_address1() {
		return user_address1;
	}
	public void setUser_address1(String user_address1) {
		this.user_address1 = user_address1;
	}
	public String getUser_address2() {
		return user_address2;
	}
	public void setUser_address2(String user_address2) {
		this.user_address2 = user_address2;
	}
	public String getUser_address3() {
		return user_address3;
	}
	public void setUser_address3(String user_address3) {
		this.user_address3 = user_address3;
	}
	public String getUser_grade() {
		return user_grade;
	}
	public void setUser_grade(String user_grade) {
		this.user_grade = user_grade;
	}
	public Timestamp getUser_update() {
		return user_update;
	}
	public void setUser_update(Timestamp user_update) {
		this.user_update = user_update;
	}
	@Override
	public String toString() {
		return "UserVO [user_idx=" + user_idx + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_phone=" + user_phone + ", user_birth=" + user_birth + ", user_email=" + user_email
				+ ", user_joindate=" + user_joindate + ", user_active=" + user_active + ", user_email_check="
				+ user_email_check + ", user_address1=" + user_address1 + ", user_address2=" + user_address2
				+ ", user_address3=" + user_address3 + ", user_grade=" + user_grade + ", user_update=" + user_update
				+ "]";
	}


}
