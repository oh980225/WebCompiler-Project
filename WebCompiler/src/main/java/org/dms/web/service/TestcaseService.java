package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.TestcaseVO;

public interface TestcaseService {
	public TestcaseVO readTestcase(int id) throws Exception;
	public void insertTestcase(TestcaseVO vo) throws Exception;
	public List<String> getTestCaseInput(int problem_id) throws Exception;
	public List<String> getTestCaseOutput(int problem_id) throws Exception;
}
