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
	public int ProblemCount(String category) throws Exception {
		// TODO Auto-generated method stub
		return problemDAO.ProblemCount(category);
	}

	@Override
	public List<ProblemVO> readProblemList(int level, String category, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return problemDAO.readList(level, category, cri);
	}
	
	@Override
	public List<ProblemVO> readProblemList(String category, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return problemDAO.readList(category, cri);
	}
	
	@Override
	public List<ProblemVO> readProblemList(int level, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return problemDAO.readList(level, cri);
	}
	
	@Override
	public void addSuccess (int problem_id) {
		problemDAO.addSuccess(problem_id);
	}
	
	@Override
	public void addSubmit (int problem_id) {
		problemDAO.addSubmit(problem_id);
	}
	
	// 검색
	@Override
	public List<ProblemVO> searchProblemList(String searchType, String searchInput, Criteria criteria) throws Exception {
		return problemDAO.searchProblemList(searchType, searchInput, criteria);
	}
	
	@Override
	public int searchProblemCount(String searchType, String searchInput) throws Exception {
		return problemDAO.searchProblemCount(searchType, searchInput);
	}

	// 검색 + 카테고리
	@Override
	public List<ProblemVO> searchProblemListByCategory(String searchType, String searchInput, String category,
			Criteria criteria) throws Exception {
		return problemDAO.searchProblemListByCategory(searchType, searchInput, category, criteria);
	}

	@Override
	public int searchProblemCountByCategory(String searchType, String searchInput, String category) throws Exception {
		return problemDAO.searchProblemCountByCategory(searchType, searchInput, category);
	}

	// 검색 + 레벨
	@Override
	public List<ProblemVO> searchProblemListByLevel(String searchType, String searchInput, int level, Criteria criteria)
			throws Exception {
		return problemDAO.searchProblemListByLevel(searchType, searchInput, level, criteria);
	}

	@Override
	public int searchProblemCountByLevel(String searchType, String searchInput, int level) throws Exception {
		return problemDAO.searchProblemCountByLevel(searchType, searchInput, level);
	}

	// 검색 + 카테고리 + 레벨
	@Override
	public List<ProblemVO> searchProblemListByCategoryAndLevel(String searchType, String searchInput, String category,
			int level, Criteria criteria) throws Exception {
		return problemDAO.searchProblemListByCategoryAndLevel(searchType, searchInput, category, level, criteria);
	}

	@Override
	public int searchProblemCountByCategoryAndLevel(String searchType, String searchInput, String category, int level)
			throws Exception {
		return problemDAO.searchProblemCountByCategoryAndLevel(searchType, searchInput, category, level);
	}

}
