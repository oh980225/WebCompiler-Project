package org.dms.web.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.dms.web.domain.CodeBoardVO;
import org.dms.web.domain.CodeVO;
import org.dms.web.domain.Criteria;
import org.dms.web.domain.ParamVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CodeBoardDAOImpl implements CodeBoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "org.dms.web.mapper.Mapper";

	@Override
	public List<CodeBoardVO> getCodeBoardList(String user_id) throws Exception {
		
		List<Integer> problemIdList = sqlSession.selectList(namespace + ".codeboard_problem_id_list", user_id); 
		List<CodeBoardVO> codeBoardVOList = new ArrayList<CodeBoardVO>();
		
		for(int problem_id : problemIdList) {
			System.out.println(problemIdList);
			
			String category_id = sqlSession.selectOne(namespace + ".codeboard_category_id", problem_id); 
			String problem_title = sqlSession.selectOne(namespace + ".codeboard_problem_title", problem_id); 
			byte code_success;
			if(sqlSession.selectOne(namespace + ".codeboard_code_success", problem_id) == null) {
				code_success = 0;
			} else {
				code_success = 1;
			}
			int problem_level = sqlSession.selectOne(namespace + ".codeboard_problem_level", problem_id);
			
			Map<String, Object> param = new HashMap<String,Object>();
			param.put("user_id", user_id);
			param.put("problem_id", problem_id);
			
			List<CodeVO> codeList = sqlSession.selectList(namespace + ".codeboard_codeList", param);
			Date code_date = sqlSession.selectOne(namespace + ".codeboard_code_date", problem_id);
			
			CodeBoardVO codeBoardVO = new CodeBoardVO(problem_id, user_id, category_id, problem_title, code_date, code_success, problem_level, codeList);
			codeBoardVOList.add(codeBoardVO);
			
		}
		
		return codeBoardVOList;
	}
	
	@Override
	public List<CodeBoardVO> getCodeBoardList(String user_id, Criteria criteria) throws Exception {
		
		Map<String, Object> listParam = new HashMap<String,Object>();
		
		listParam.put("user_id", user_id);
		listParam.put("pageStart", criteria.getPageStart());
		listParam.put("perPageNum", criteria.getPerPageNum());
		
		List<Integer> problemIdList = sqlSession.selectList(namespace + ".codeboard_problem_id_list_criteria", listParam); 
		List<CodeBoardVO> codeBoardVOList = new ArrayList<CodeBoardVO>();
		
		for(int problem_id : problemIdList) {
			System.out.println(problemIdList);
			
			String category_id = sqlSession.selectOne(namespace + ".codeboard_category_id", problem_id); 
			String problem_title = sqlSession.selectOne(namespace + ".codeboard_problem_title", problem_id); 
			byte code_success;
			if(sqlSession.selectOne(namespace + ".codeboard_code_success", problem_id) == null) {
				code_success = 0;
			} else {
				code_success = 1;
			}
			int problem_level = sqlSession.selectOne(namespace + ".codeboard_problem_level", problem_id);
			
			Map<String, Object> param = new HashMap<String,Object>();
			param.put("user_id", user_id);
			param.put("problem_id", problem_id);
			
			List<CodeVO> codeList = sqlSession.selectList(namespace + ".codeboard_codeList", param);
			Date code_date = sqlSession.selectOne(namespace + ".codeboard_code_date", problem_id);
			
			CodeBoardVO codeBoardVO = new CodeBoardVO(problem_id, user_id, category_id, problem_title, code_date, code_success, problem_level, codeList);
			codeBoardVOList.add(codeBoardVO);
			
		}
		
		return codeBoardVOList;
	}

}
