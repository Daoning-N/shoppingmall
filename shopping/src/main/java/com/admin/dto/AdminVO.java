package com.admin.dto;

import java.sql.Timestamp;

public class AdminVO {
	private String admin_id;
	private String admin_pw;
	private String admin_name;
	private String admin_email;
	private Timestamp admin_joindate;
	private Timestamp admin_update;
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pw() {
		return admin_pw;
	}
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_email() {
		return admin_email;
	}
	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}
	public Timestamp getAdmin_joindate() {
		return admin_joindate;
	}
	public void setAdmin_joindate(Timestamp admin_joindate) {
		this.admin_joindate = admin_joindate;
	}
	public Timestamp getAdmin_update() {
		return admin_update;
	}
	public void setAdmin_update(Timestamp admin_update) {
		this.admin_update = admin_update;
	}
	@Override
	public String toString() {
		return "AdminVO [admin_id=" + admin_id + ", admin_pw=" + admin_pw + ", admin_name=" + admin_name
				+ ", admin_email=" + admin_email + ", admin_joindate=" + admin_joindate + ", admin_update="
				+ admin_update + "]";
	}
	
}
