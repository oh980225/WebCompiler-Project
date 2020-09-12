package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.TestcaseVO;
import org.dms.web.persistence.TestcaseDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@Component
public class TestcaseServiceImpl implements TestcaseService {

	@Autowired
	TestcaseDAO testcaseDAO;
	
	@Override
	public TestcaseVO readTestcase(int id) throws Exception {
		// TODO Auto-generated method stub
		return testcaseDAO.read(id);
	}

	@Override
	public void insertTestcase(TestcaseVO vo) throws Exception {
		// TODO Auto-generated method stub
		testcaseDAO.insert(vo);
	}
	
	@Override
	public List<String> getTestCaseInput(int problem_id) throws Exception {
		return testcaseDAO.getInputList(problem_id);
	}
	
	@Override
	public List<String> getTestCaseOutput(int problem_id) throws Exception {
		return testcaseDAO.getOutputList(problem_id);
	}

}
