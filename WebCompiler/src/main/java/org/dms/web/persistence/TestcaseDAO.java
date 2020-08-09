package org.dms.web.persistence;

import org.dms.web.domain.TestcaseVO;

public interface TestcaseDAO {
	public void insert(TestcaseVO vo) throws Exception;
	public TestcaseVO read(int problem_id) throws Exception;
}
