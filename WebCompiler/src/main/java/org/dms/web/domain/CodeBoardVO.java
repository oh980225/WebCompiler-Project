package org.dms.web.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class CodeBoardVO {
	
	private int problem_id; // O
	private String user_id; // O
	private String category_id; //O
	private String problem_title; //O
	private int problem_level;
	private Date code_date; // O
	private byte code_success; // O
	private List<CodeVO> codeList;
	
	/*c.problem_id, c.user_id, p.problem_title, p.problem_level, p.category_id*/
	public CodeBoardVO(int problem_id, String user_id, String problem_title, int problem_level, String category_id) {
		this.problem_id = problem_id;
		this.user_id = user_id;
		this.category_id = category_id;
		this.problem_title = problem_title;
		this.problem_level = problem_level;
	}
	
	public CodeBoardVO(int problem_id, String user_id, String category_id, String problem_title, Date code_date,
			byte code_success, int problem_level, List<CodeVO> codeList) {
		this.problem_id = problem_id;
		this.user_id = user_id;
		this.category_id = category_id;
		this.problem_title = problem_title;
		this.code_date = code_date;
		this.code_success = code_success;
		this.problem_level = problem_level;
		this.setCodeList(codeList);
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
	public int getProblem_level() {
		return problem_level;
	}
	public void SetProblem_level(int problem_level) {
		this.problem_level = problem_level;
	}

	public List<CodeVO> getCodeList() {
		return codeList;
	}

	public void setCodeList(List<CodeVO> codeList) {
		this.codeList = codeList;
	}

	@Override
	public String toString() {
		return "CodeBoardVO [problem_id=" + problem_id + ", user_id=" + user_id + ", category_id=" + category_id
				+ ", problem_title=" + problem_title + ", problem_level=" + problem_level + ", code_date=" + code_date
				+ ", code_success=" + code_success + ", codeList=" + codeList + "]";
	}
	
	@JsonIgnore
	public CodeBoardVO getSelf() {
		return this;
	}
	
	
}
