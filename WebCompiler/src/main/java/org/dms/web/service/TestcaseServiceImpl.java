package org.dms.web.service;

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

}
