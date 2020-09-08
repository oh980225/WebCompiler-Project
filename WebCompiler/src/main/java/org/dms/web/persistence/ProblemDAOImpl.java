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

}
