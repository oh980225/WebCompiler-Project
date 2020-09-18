package org.dms.web.domain;

import java.sql.Timestamp;

public class CodeVO {
	
	@Override
	public String toString() {
		return "CodeVO [code_id=" + code_id + ", code_code=" + code_code + ", code_date=" + code_date
				+ ", code_language=" + code_language + ", code_open=" + code_open + ", code_success=" + code_success
				+ ", problem_id=" + problem_id + ", user_id=" + user_id + "]";
	}
	
	private int code_id;
	private String code_code;
	private Timestamp code_date;
	private String code_language;
	private byte code_open;
	private byte code_success;
	private int problem_id;
	private String user_id;
	
	public int getCode_id() {
		return code_id;
	}
	public void setCode_id(int code_id) {
		this.code_id = code_id;
	}
	public String getCode_code() {
		return code_code;
	}
	public void setCode_code(String code_code) {
		this.code_code = code_code;
	}
	public Timestamp getCode_date() {
		return code_date;
	}
	public void setCode_date(Timestamp code_date) {
		this.code_date = code_date;
	}
	public String getCode_language() {
		return code_language;
	}
	public void setCode_language(String code_language) {
		this.code_language = code_language;
	}
	public byte getCode_open() {
		return code_open;
	}
	public void setCode_open(byte code_open) {
		this.code_open = code_open;
	}
	public byte getCode_success() {
		return code_success;
	}
	public void setCode_success(byte code_success) {
		this.code_success = code_success;
	}
	public int getProblem_id() {
		return problem_id;
	}
	public void setProblem_id(int problem_id) {
		this.problem_id = problem_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
