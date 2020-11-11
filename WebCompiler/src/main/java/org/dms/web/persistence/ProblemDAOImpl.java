package org.dms.web.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.dms.web.domain.Criteria;
import org.dms.web.domain.ProblemVO;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class ProblemDAOImpl implements ProblemDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace ="org.dms.web.mapper.Mapper";
	

	@Override
	public ProblemVO read(int problem_id) {
		// TODO Auto-generated method stub
		ProblemVO vo = sqlSession.selectOne(namespace + ".problem_selectByid", problem_id);
		return vo;
	}
	
	@Override
	public void addSubmit (int problem_id) {
		sqlSession.update(namespace + ".problem_add_submit", problem_id);
	}
	
	@Override
	public void addSuccess (int problem_id) {
		sqlSession.update(namespace + ".problem_add_success", problem_id);
	}
	
	@Override
	public List<ProblemVO> readList() throws Exception {
		// TODO Auto-generated method stub		
		List<ProblemVO> problemList = new ArrayList<ProblemVO>();
		problemList = sqlSession.selectList(namespace + ".problem_selectAll");
		return problemList;
	}

	@Override
	public List<ProblemVO> readList(int level, String category) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("problem_level", level);
		map.put("category_id", category);
		
		List<ProblemVO> problemList = new ArrayList<ProblemVO>();
		problemList = sqlSession.selectList(namespace + ".problem_selectBylevel", map);
		return problemList;
	}
	

	@Override
	public void update(ProblemVO problem) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void insert(ProblemVO problem) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".problem_insert", problem);
	}

	@Override
	public List<ProblemVO> listPaging(int page) throws Exception {
		// TODO Auto-generated method stub
		if(page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		
		
		return sqlSession.selectList(namespace + ".listPaging", page);
	}

	
	@Override
	public int ProblemCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".listCount");
	}

	@Override
	public int ProblemCount(int level, String category) throws Exception {
		// TODO Auto-generated method stub		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("problem_level", level);
		map.put("category_id", category);
				
		return sqlSession.selectOne(namespace + ".listCountFilter", map);
		
	}
	
	@Override
	public int ProblemCount(String category) throws Exception {
		// TODO Auto-generated method stub		
				
		return sqlSession.selectOne(namespace + ".listCountByCategory", category);
		
	}
	@Override
	public List<ProblemVO> listCriteria(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".listCriteria", criteria);
	}

	@Override
	public List<ProblemVO> readList(int level, String category, Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("problem_level", level);
				map.put("category_id", category);
				map.put("category_id", category);
				map.put("pageStart", criteria.getPageStart());
				map.put("perPageNum", criteria.getPerPageNum());
				
				List<ProblemVO> problemList = new ArrayList<ProblemVO>();
				problemList = sqlSession.selectList(namespace + ".listCriteriaFilter", map);
				return problemList;
	}
	@Override
	public List<ProblemVO> readList(int level, Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("problem_level", level);
				map.put("pageStart", criteria.getPageStart());
				map.put("perPageNum", criteria.getPerPageNum());
				
				List<ProblemVO> problemList = new ArrayList<ProblemVO>();
				problemList = sqlSession.selectList(namespace + ".listCriteriaFilter", map);
				return problemList;
	}
	@Override
	public List<ProblemVO> readList(String category, Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("category_id", category);
				map.put("pageStart", criteria.getPageStart());
				map.put("perPageNum", criteria.getPerPageNum());
				
				List<ProblemVO> problemList = new ArrayList<ProblemVO>();
				problemList = sqlSession.selectList(namespace + ".problem_selectByCategory", map);
				return problemList;
	}
	
	// 검색
	@Override
	public List<ProblemVO> searchProblemList(String searchType, String searchInput, Criteria criteria) throws Exception {
		Map<String, Object> listParam = new HashMap<String,Object>();
		
		if(searchType.equals("번호")) {
			listParam.put("problem_id", searchInput);
			listParam.put("pageStart", criteria.getPageStart());
			listParam.put("perPageNum", criteria.getPerPageNum());
			
			return sqlSession.selectList(namespace + ".problem_search_by_id", listParam);
		} else {
			listParam.put("problem_title", searchInput);
			listParam.put("pageStart", criteria.getPageStart());
			listParam.put("perPageNum", criteria.getPerPageNum());
			
			return sqlSession.selectList(namespace + ".problem_search_by_title", listParam);
		}
	}
	
	@Override
	public int searchProblemCount(String searchType, String searchInput) throws Exception {
		if(searchType.equals("번호")) {
			return sqlSession.selectOne(namespace + ".count_search_by_id", searchInput);
		} else {
			return sqlSession.selectOne(namespace + ".count_search_by_title", searchInput);
		}
	}

	// 검색 + 카테고리
	@Override
	public List<ProblemVO> searchProblemListByCategory(
			String searchType, 
			String searchInput, 
			String category,
			Criteria criteria) throws Exception {
		Map<String, Object> listParam = new HashMap<String,Object>();
		
		if(searchType.equals("번호")) {
			listParam.put("problem_id", searchInput);
			listParam.put("pageStart", criteria.getPageStart());
			listParam.put("perPageNum", criteria.getPerPageNum());
			listParam.put("category", category);
			
			return sqlSession.selectList(namespace + ".problem_search_by_id_by_category", listParam);
		} else {
			listParam.put("problem_title", searchInput);
			listParam.put("pageStart", criteria.getPageStart());
			listParam.put("perPageNum", criteria.getPerPageNum());
			listParam.put("category", category);
			
			return sqlSession.selectList(namespace + ".problem_search_by_title_by_category", listParam);
		}
	}

	@Override
	public int searchProblemCountByCategory(
			String searchType, 
			String searchInput, 
			String category) throws Exception {
		Map<String, Object> listParam = new HashMap<String,Object>();
		listParam.put("searchInput", searchInput);
		listParam.put("category", category);
		
		if(searchType.equals("번호")) {
			return sqlSession.selectOne(namespace + ".count_search_by_id_by_category", listParam);
		} else {
			return sqlSession.selectOne(namespace + ".count_search_by_title_by_category", listParam);
		}
	}

	// 검색 + 레벨
	@Override
	public List<ProblemVO> searchProblemListByLevel(
			String searchType, 
			String searchInput, 
			int level, 
			Criteria criteria)
			throws Exception {
		Map<String, Object> listParam = new HashMap<String,Object>();
		
		if(searchType.equals("번호")) {
			listParam.put("problem_id", searchInput);
			listParam.put("pageStart", criteria.getPageStart());
			listParam.put("perPageNum", criteria.getPerPageNum());
			listParam.put("level", level);
			
			return sqlSession.selectList(namespace + ".problem_search_by_id_by_level", listParam);
		} else {
			listParam.put("problem_title", searchInput);
			listParam.put("pageStart", criteria.getPageStart());
			listParam.put("perPageNum", criteria.getPerPageNum());
			listParam.put("level", level);
			
			return sqlSession.selectList(namespace + ".problem_search_by_title_by_level", listParam);
		}
	}

	@Override
	public int searchProblemCountByLevel(
			String searchType, 
			String searchInput, 
			int level) throws Exception {
		Map<String, Object> listParam = new HashMap<String,Object>();
		listParam.put("searchInput", searchInput);
		listParam.put("level", level);
		
		if(searchType.equals("번호")) {
			return sqlSession.selectOne(namespace + ".count_search_by_id_by_level", listParam);
		} else {
			return sqlSession.selectOne(namespace + ".count_search_by_title_by_level", listParam);
		}
	}

	// 검색 + 카테고리 + 레벨
	@Override
	public List<ProblemVO> searchProblemListByCategoryAndLevel(
			String searchType, 
			String searchInput, 
			String category, 
			int level,
			Criteria criteria) throws Exception {
		Map<String, Object> listParam = new HashMap<String,Object>();
		
		if(searchType.equals("번호")) {
			listParam.put("problem_id", searchInput);
			listParam.put("pageStart", criteria.getPageStart());
			listParam.put("perPageNum", criteria.getPerPageNum());
			listParam.put("category", category);
			listParam.put("level", level);
			
			return sqlSession.selectList(namespace + ".problem_search_by_id_by_category_and_level", listParam);
		} else {
			listParam.put("problem_title", searchInput);
			listParam.put("pageStart", criteria.getPageStart());
			listParam.put("perPageNum", criteria.getPerPageNum());
			listParam.put("category", category);
			listParam.put("level", level);
			
			return sqlSession.selectList(namespace + ".problem_search_by_title_by_category_and_level", listParam);
		}
	}

	@Override
	public int searchProblemCountByCategoryAndLevel(
			String searchType, 
			String searchInput,
			String category,
			int level) throws Exception {
		Map<String, Object> listParam = new HashMap<String,Object>();
		listParam.put("searchInput", searchInput);
		listParam.put("category", category);
		listParam.put("level", level);
		
		if(searchType.equals("번호")) {
			return sqlSession.selectOne(namespace + ".count_search_by_id_by_category_and_level", listParam);
		} else {
			return sqlSession.selectOne(namespace + ".count_search_by_title_by_category_and_level", listParam);
		}
	}

	@Override
	public boolean checkId(String value) throws Exception {
		int checkNum = sqlSession.selectOne(namespace + ".check_problem_exist", value);
		if(checkNum == 1) {
			return true;
		}
		return false;
	}
	
//	@Override
//	public List<ProblemVO> listCriteria(Criteria criteria) throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList(namespace + ".listCriteria", criteria);
//	}
//	
//	@Override
//	public List<ProblemVO> listCriteria(Criteria criteria) throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList(namespace + ".listCriteria", criteria);
//	}

}
