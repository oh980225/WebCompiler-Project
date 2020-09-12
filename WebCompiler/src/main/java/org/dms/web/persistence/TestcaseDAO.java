package org.dms.web.persistence;

import java.util.List;

import org.dms.web.domain.TestcaseVO;

public interface TestcaseDAO {
	public void insert(TestcaseVO vo) throws Exception;
	public TestcaseVO read(int problem_id) throws Exception;
	public List<String> getInputList(int problem_id) throws Exception;
	public List<String> getOutputList(int problem_id) throws Exception;
}
