package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.ProblemVO;
import org.dms.web.persistence.ProblemDAO;
import org.dms.web.persistence.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@Component
public class ProblemServiceImpl implements ProblemService {
	
	@Autowired
	ProblemDAO problemDAO;
	
	public ProblemServiceImpl(ProblemDAO problemDAO) {
		this.problemDAO = problemDAO;
	}

	@Override
	public List<ProblemVO> readProblemList(int level, String category) throws Exception {
		// TODO Auto-generated method stub
		return problemDAO.readList(level, category);
	}

	@Override
	public ProblemVO readProblem(int id) throws Exception {
		// TODO Auto-generated method stub
		return problemDAO.read(id);
	}

	@Override
	public void insertProblem(ProblemVO problem) throws Exception {
		// TODO Auto-generated method stub
		problemDAO.insert(problem);
	}

}
