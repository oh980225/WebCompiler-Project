package org.dms.web.domain;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
	private String user_id;
	private String user_passwd;
	private String user_name;
	private String user_introduce;
	private String user_authority;
	private byte[] user_img;

	public byte[] getUser_img() {
		return user_img;
	}

	public void setUser_img(byte[] user_img) {
		this.user_img = user_img;
	}

	public String getUser_id() {
		return user_id;
	}
	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getUser_passwd() {
		return user_passwd;
	}

	public void setUser_passwd(String user_passwd) {
		this.user_passwd = user_passwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_introduce() {
		return user_introduce;
	}

	public void setUser_introduce(String user_introduce) {
		String temp = user_introduce;
		temp.replace("입니다", "바꿨다");		
		this.user_introduce = temp;
	}

	public String getUser_authority() {
		return user_authority;
	}

	public void setUser_authority(String user_authority) {
		this.user_authority = user_authority;
	}	
}
