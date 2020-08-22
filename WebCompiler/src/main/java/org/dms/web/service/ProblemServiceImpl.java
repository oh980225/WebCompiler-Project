package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.Criteria;
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
	public List<ProblemVO> readProblemList() throws Exception {
		// TODO Auto-generated method stub
		return problemDAO.readList();
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

	@Override
	public List<ProblemVO> test() throws Exception {
		// TODO Auto-generated method stub
		Criteria criteria = new Criteria();
		criteria.setPage(3);
		criteria.setPerPageNum(5);
		return problemDAO.listCriteria(criteria);
	}

	@Override
	public int ProblemCount() throws Exception {
		// TODO Auto-generated method stub
		return problemDAO.ProblemCount();
	}

	@Override
	public List<ProblemVO> readProblemList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return problemDAO.listCriteria(cri);
	}

	@Override
	public int ProblemCount(int level, String category) throws Exception {
		// TODO Auto-generated method stub
		return problemDAO.ProblemCount(level, category);
	}

	@Override
	public List<ProblemVO> readProblemList(int level, String category, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return problemDAO.readList(level, category, cri);
	}
	

}
