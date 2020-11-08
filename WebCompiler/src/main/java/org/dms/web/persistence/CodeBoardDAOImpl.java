package org.dms.web.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.dms.web.domain.CodeBoardVO;
import org.dms.web.domain.CodeFilterVO;
import org.dms.web.domain.CodeVO;
import org.dms.web.domain.Criteria;
import org.dms.web.domain.ParamVO;
import org.dms.web.domain.ProblemVO;
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
		System.out.println("pageStart" + criteria.getPageStart());
		listParam.put("perPageNum", criteria.getPerPageNum());
		
		List<Integer> problemIdList = sqlSession.selectList(namespace + ".codeboard_problem_id_list_criteria", listParam); 
		List<CodeBoardVO> codeBoardVOList = new ArrayList<CodeBoardVO>();
		
		for(int problem_id : problemIdList) {
			System.out.println(problemIdList);
			
			String category_id = sqlSession.selectOne(namespace + ".codeboard_category_id", problem_id); 
			String problem_title = sqlSession.selectOne(namespace + ".codeboard_problem_title", problem_id); 
			byte code_success;
			
			Map<String, Object> param = new HashMap<String,Object>();
			param.put("user_id", user_id);
			param.put("problem_id", problem_id);
			
			if(sqlSession.selectOne(namespace + ".codeboard_code_success", param) == null) {
				code_success = 0;
			} else {
				code_success = 1;
			}
			int problem_level = sqlSession.selectOne(namespace + ".codeboard_problem_level", problem_id);
			
			List<CodeVO> codeList = sqlSession.selectList(namespace + ".codeboard_codeList", param);
			Date code_date = sqlSession.selectOne(namespace + ".codeboard_code_date", problem_id);
			
			CodeBoardVO codeBoardVO = new CodeBoardVO(problem_id, user_id, category_id, problem_title, code_date, code_success, problem_level, codeList);
			codeBoardVOList.add(codeBoardVO);
			
		}
		
		return codeBoardVOList;
	}

	@Override
	public List<CodeBoardVO> codeFilter_level(String user_id, Criteria criteria, int level) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("problem_level", level);		
		map.put("pageStart", criteria.getPageStart());
		map.put("perPageNum", criteria.getPerPageNum());
		List<CodeBoardVO> list = sqlSession.selectList(namespace + ".codeboard_filter_level", map);
		
//		List<CodeFilterVO> list = sqlSession.selectList(namespace + ".codeboard_filter_level", map);
		
		for(int i =0; i<list.size(); i++) {
			CodeBoardVO ref = list.get(i).getSelf();   

			int problem_id = list.get(i).getProblem_id();
			
			byte code_success;
			if(sqlSession.selectOne(namespace + ".codeboard_code_success", problem_id) == null) {
				code_success = 0;
			} else {
				code_success = 1;
			}		
			
			Map<String, Object> param = new HashMap<String,Object>();
			param.put("user_id", user_id);
			param.put("problem_id", problem_id);
			
			List<CodeVO> codeList = sqlSession.selectList(namespace + ".codeboard_codeList", param);
			Date code_date = sqlSession.selectOne(namespace + ".codeboard_code_date", problem_id);
			
			ref.setCodeList(codeList);
			ref.setCode_success(code_success);
			ref.setCode_date(code_date);	
			
		}
		

		for(int i =0; i<list.size(); i++) {
			System.out.println(list);	
		}
		
//		return codeBoardVOList;
		return list;
	
	}
	// select c.problem_id, p.problem_title, p.problem_level, p.category_id, c.user_id
	 @Override
	   public List<CodeBoardVO> codeFilter_category(String user_id, Criteria criteria, String category) throws Exception {
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("user_id", user_id);
	      map.put("category_id", category);      
	      map.put("pageStart", criteria.getPageStart());
	      map.put("perPageNum", criteria.getPerPageNum());
	      
	      List<CodeBoardVO> list = sqlSession.selectList(namespace + ".codeboard_filter_category", map);
	            
	      for(int i =0; i<list.size(); i++) {
	         CodeBoardVO ref = list.get(i).getSelf();   
	         int problem_id = list.get(i).getProblem_id();
	         
	         byte code_success;
	         if(sqlSession.selectOne(namespace + ".codeboard_code_success", problem_id) == null) {
	            code_success = 0;
	         } else {
	            code_success = 1;
	         }      
	         
	         Map<String, Object> param = new HashMap<String,Object>();
	         param.put("user_id", user_id);
	         param.put("problem_id", problem_id);
	         
	         List<CodeVO> codeList = sqlSession.selectList(namespace + ".codeboard_codeList", param);
	         Date code_date = sqlSession.selectOne(namespace + ".codeboard_code_date", problem_id);

	         ref.setCodeList(codeList);
	         ref.setCode_success(code_success);
	         ref.setCode_date(code_date);
	         
	      }
	      return list;
	      
	   }
	
	@Override
	public List<CodeBoardVO> codeFilter_all(String user_id, Criteria criteria, int level, String category) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
	      map.put("user_id", user_id);
	      map.put("category_id", category);    
	      map.put("problem_level", level);    
	      map.put("pageStart", criteria.getPageStart());
	      map.put("perPageNum", criteria.getPerPageNum());
	      
	      List<CodeBoardVO> list = sqlSession.selectList(namespace + ".codeboard_filter_all", map);
	            
	      for(int i =0; i<list.size(); i++) {
	         CodeBoardVO ref = list.get(i).getSelf();   
	         int problem_id = list.get(i).getProblem_id();
	         
	         byte code_success;
	         if(sqlSession.selectOne(namespace + ".codeboard_code_success", problem_id) == null) {
	            code_success = 0;
	         } else {
	            code_success = 1;
	         }      
	         
	         Map<String, Object> param = new HashMap<String,Object>();
	         param.put("user_id", user_id);
	         param.put("problem_id", problem_id);
	         
	         List<CodeVO> codeList = sqlSession.selectList(namespace + ".codeboard_codeList", param);
	         Date code_date = sqlSession.selectOne(namespace + ".codeboard_code_date", problem_id);

	         ref.setCodeList(codeList);
	         ref.setCode_success(code_success);
	         ref.setCode_date(code_date);
	         
	      }
	      return list;
		
	}
	@Override
	public List<CodeBoardVO> getCodeBoardListBySearch(String user_id, String category, String search) throws Exception {
		
		List<Integer> problemIdList = null;
		
		System.out.println("search: "+search);
		System.out.println("category: "+category);
		
		if(category.equals("problem_id")) {
			Map<String, String> listParam = new HashMap<String, String>();
			
			listParam.put("user_id", user_id);
			listParam.put("search_id", search);
			
			System.out.println("my Search List(Id): " +  sqlSession.selectList(namespace + ".codeboard_problem_id_list_by_problem_id", listParam));
			
			problemIdList = sqlSession.selectList(namespace + ".codeboard_problem_id_list_by_problem_id", listParam);
		} else {
			List<Integer> problemIdListByTitle = sqlSession.selectList(namespace + ".codeboard_problem_id_list_by_search_title", search); // 이건 일단 그 이름이 포함된 문제 다 가져온것!
			List<Integer> problemIdListByUser = sqlSession.selectList(namespace + ".codeboard_problem_id_list", user_id);
			
			for(int problemId : problemIdListByTitle) {
				if(!(problemIdListByUser.contains((Integer)problemId))) {
					problemIdListByTitle.remove((Integer)problemId);
				}
			}
			
			
			problemIdList = problemIdListByTitle;
		}
		
		System.out.println("my Search List: " +  problemIdList);
		
		List<CodeBoardVO> codeBoardVOList = new ArrayList<CodeBoardVO>();
		
		for(int problem_id : problemIdList) {
			Map<String, Object> otherListParam = new HashMap<String, Object>();
			
			otherListParam.put("user_id", user_id);
			otherListParam.put("problem_id", problem_id);
			System.out.println(problemIdList);
			
			String category_id = sqlSession.selectOne(namespace + ".codeboard_category_id", problem_id); 
			String problem_title = sqlSession.selectOne(namespace + ".codeboard_problem_title", problem_id); 
			byte code_success;
			if(sqlSession.selectOne(namespace + ".codeboard_code_success", otherListParam) == null) {
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
	
	// 페이징을 위한 부분
	@Override
	public List<CodeBoardVO> getCodeBoardListBySearch(String user_id, String category, String search, Criteria criteria) throws Exception {
		
		List<Integer> problemIdList = null;
		
		Map<String, Object> listParam = new HashMap<String,Object>();
		
		listParam.put("user_id", user_id);
		listParam.put("pageStart", criteria.getPageStart());
		listParam.put("perPageNum", criteria.getPerPageNum());
		
		System.out.println("search: "+search);
		System.out.println("category: "+category);
		
		if(category.equals("problem_id")) {
			listParam.put("search_id", search);
			
			problemIdList = sqlSession.selectList(namespace + ".codeboard_problem_id_list_by_problem_id_criteria", listParam);
		} else {
			List<Integer> problemIdListByTitle = sqlSession.selectList(namespace + ".codeboard_problem_id_list_by_search_title", search); // 이건 일단 그 이름이 포함된 문제 다 가져온것!
			List<Integer> problemIdListByUser = sqlSession.selectList(namespace + ".codeboard_problem_id_list", user_id);
			
			for(int problemId : problemIdListByTitle) {
				if(!problemIdListByUser.contains(problemId)) {
					problemIdListByTitle.remove(problemId);
				}
			}
			
			System.out.println("my Search List(Title - Before): " + problemIdListByTitle);
			
			problemIdList = new ArrayList<Integer>();
			for(int i = criteria.getPageStart(); i < criteria.getPageStart()+criteria.getPerPageNum(); i++) {
				if(i < problemIdListByTitle.size()) {
					problemIdList.add( (Integer) problemIdListByTitle.get(i));
				} else {
					break;
				}
			}
			System.out.println("my Search List(Title - After): " + problemIdList);
		}
		
		System.out.println("my Search List: " +  problemIdList);
		
		List<CodeBoardVO> codeBoardVOList = new ArrayList<CodeBoardVO>();
		
		for(int problem_id : problemIdList) {
			System.out.println(problemIdList);
			
			Map<String, Object> otherListParam = new HashMap<String, Object>();
			
			otherListParam.put("user_id", user_id);
			otherListParam.put("problem_id", problem_id);
			
			String category_id = sqlSession.selectOne(namespace + ".codeboard_category_id", problem_id); 
			String problem_title = sqlSession.selectOne(namespace + ".codeboard_problem_title", problem_id); 
			byte code_success;
			if(sqlSession.selectOne(namespace + ".codeboard_code_success", otherListParam) == null) {
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
