package org.dms.web.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.dms.web.domain.CodeBoardVO;
import org.dms.web.domain.CodeVO;
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
		List<Integer> problemIdList = sqlSession.selectList(namespace + ".codeboard_problem_id_list", user_id); // 1번 부분 완료
		List<CodeBoardVO> codeBoardVOList = new ArrayList<CodeBoardVO>();
		
		for(int problem_id : problemIdList) {
			System.out.println(problemIdList);
			
			String category_id = sqlSession.selectOne(namespace + ".codeboard_category_id", problem_id); // 2번 부분 완료
			String problem_title = sqlSession.selectOne(namespace + ".codeboard_problem_title", problem_id); // 2번 부분 완료
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
		/*
		1. 중복되지않게 problem_id를 다 가져와 List<Integer> (O)

		2. problem_id를 통해 각각에 대한 category_id, problem_title 가져와 (O)

		3. problem_id별 성공여부를 갈라

		4. 가른 다음 거기서 최근 값 가져와 이때 code_success, user_id, problem_id, code_date 이거 다 가져와

		for(1번 리스트 돌리고)
		{
		2번 각각 변수에 저장
		if로 3번 가르고
		각각 4번으로 변수에 저장
		각 변수들로 CodeBoardVO생성
		}
		*/ 
		return codeBoardVOList;
	}

}
