package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.TestcaseVO;

public interface TestcaseService {
	public TestcaseVO readTestcase(int id) throws Exception;
	public void insertTestcase(TestcaseVO vo) throws Exception;
	
}
