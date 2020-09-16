package org.dms.web.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.dms.web.domain.CodeBoardVO;
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
		/*
		1. 중복되지않게 problem_id를 다 가져와 List<Integer>

		2. problem_id를 통해 각각에 대한 category_id, problem_title 가져와

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
		return null;
	}

}
