package org.dms.web.domain;

// 나중에 수정 필요할듯?
public class TestcaseVO {
	private String testcase_input;
	private String testcase_output;
	private int problem_id;
	
	public int getProblem_id() {
		return problem_id;
	}
	public void setProblem_id(int problem_id) {
		this.problem_id = problem_id;
	}
	public String getTestcase_input() {
		return testcase_input;
	}
	public void setTestcase_input(String testcase_input) {
		this.testcase_input = testcase_input;
	}
	public String getTestcase_output() {
		return testcase_output;
	}
	public void setTestcase_output(String testcase_output) {
		this.testcase_output = testcase_output;
	}
}
