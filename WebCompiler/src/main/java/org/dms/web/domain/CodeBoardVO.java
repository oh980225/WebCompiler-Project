package org.dms.web.domain;

import java.util.Date;

public class CodeBoardVO {
	
	private int problem_id; // O
	private String user_id; // O
	private String category_id; //O
	private String problem_title; //O
	private Date code_date; // O
	private byte code_success; // O
	
	public CodeBoardVO(int problem_id, String user_id, String category_id, String problem_title, Date code_date,
			byte code_success) {
		this.problem_id = problem_id;
		this.user_id = user_id;
		this.category_id = category_id;
		this.problem_title = problem_title;
		this.code_date = code_date;
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
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getProblem_title() {
		return problem_title;
	}
	public void setProblem_title(String problem_title) {
		this.problem_title = problem_title;
	}
	public Date getCode_date() {
		return code_date;
	}
	public void setCode_date(Date code_date) {
		this.code_date = code_date;
	}
	public byte getCode_success() {
		return code_success;
	}
	public void setCode_success(byte code_success) {
		this.code_success = code_success;
	}
	
	@Override
	public String toString() {
		return "CodeBoardVO [problem_id=" + problem_id + ", user_id=" + user_id + ", category_id=" + category_id
				+ ", problem_title=" + problem_title + ", code_date=" + code_date + ", code_success=" + code_success
				+ "]";
	}
	
}
