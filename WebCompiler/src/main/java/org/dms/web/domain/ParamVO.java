package org.dms.web.domain;

public class ParamVO {
	private int problem_id;
	private String user_id;
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
	public ParamVO(int problem_id, String user_id) {
		this.problem_id = problem_id;
		this.user_id = user_id;
	}
	
}
