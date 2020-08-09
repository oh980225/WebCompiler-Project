package org.dms.web.domain;

public class ProblemVO {
	private int problem_id;
	private String problem_title;
	private String problem_content;
	private String problem_hint;
	private int problem_time;
	
	private int problem_submitnum;
	private int problem_successnum;
	private int problem_failnum;
	private int problem_level;
	private String category_id;
	
	public int getProblem_id() {
		return problem_id;
	}
	public void setProblem_id(int problem_id) {
		this.problem_id = problem_id;
	}
	public String getProblem_title() {
		return problem_title;
	}
	public void setProblem_title(String problem_title) {
		this.problem_title = problem_title;
	}
	public String getProblem_content() {
		return problem_content;
	}
	public void setProblem_content(String problem_content) {
		this.problem_content = problem_content;
	}
	public int getProblem_time() {
		return problem_time;
	}
	public void setProblem_time(int problem_time) {
		this.problem_time = problem_time;
	}
	public String getProblem_hint() {
		return problem_hint;
	}
	
	public void setProblem_hint(String problem_hint) {
		this.problem_hint = problem_hint;
	}
	public int getProblem_submitnum() {
		return problem_submitnum;
	}
	public void setProblem_submitnum(int problem_submitnum) {
		this.problem_submitnum = problem_submitnum;
	}
	public int getProblem_successnum() {
		return problem_successnum;
	}
	public void setProblem_successnum(int problem_successnum) {
		this.problem_successnum = problem_successnum;
	}
	public int getProblem_failnum() {
		return problem_failnum;
	}
	public void setProblem_failnum(int problem_failnum) {
		this.problem_failnum = problem_failnum;
	}
	public int getProblem_level() {
		return problem_level;
	}
	public void setProblem_level(int problem_level) {
		this.problem_level = problem_level;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}	
}
