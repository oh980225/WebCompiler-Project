package org.dms.web.service;

import java.util.ArrayList;
import java.util.List;

import org.dms.web.domain.CodeBoardVO;
import org.dms.web.domain.CodeFilterVO;
import org.dms.web.domain.Criteria;
import org.dms.web.persistence.CodeBoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeBoardServiceImpl implements CodeBoardService {
	
	@Autowired
	CodeBoardDAO codeBoardDAO;

	@Override
	public List<CodeBoardVO> getCodeBoardList(String user_id) throws Exception {
		return codeBoardDAO.getCodeBoardList(user_id);
	}
	
	@Override
	public List<CodeBoardVO> getCodeBoardList(String user_id, Criteria criteria) throws Exception {
		return codeBoardDAO.getCodeBoardList(user_id, criteria);
	}
	
	@Override
	public List<CodeBoardVO> getCodeBoardList_filter(String user_id, Criteria criteria, int problem_level, String category) throws Exception {
		
		// 두개 선택
		if(problem_level != 0 && !category.equals("unselected")) {
			System.out.println("1");
			return codeBoardDAO.codeFilter_all(user_id, criteria, problem_level, category);
			
		}
		// 난이도
		else if(problem_level != 0) {
			System.out.println("2");
			return codeBoardDAO.codeFilter_level(user_id, criteria, problem_level);
			//return codeBoardDAO.codeFilter_level(user_id, criteria, problem_level);
		}
		else {
			System.out.println("3");
			return codeBoardDAO.codeFilter_category(user_id, criteria, category);
		}
		
	}
	
	
	@Override
	public List<CodeBoardVO> getCodeBoardListBySearch(String user_id, String category, String search) throws Exception {
		return codeBoardDAO.getCodeBoardListBySearch(user_id, category, search);
	}
	
	@Override
	public List<CodeBoardVO> getCodeBoardListBySearch(
			String user_id, 
			String category, 
			String search, 
			Criteria criteria) throws Exception {
		return codeBoardDAO.getCodeBoardListBySearch(user_id, category, search, criteria);
	}

}
