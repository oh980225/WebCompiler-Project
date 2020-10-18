package org.dms.web.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.dms.web.domain.CodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDAOImpl implements CodeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "org.dms.web.mapper.Mapper";

	@Override
	public void submitCode(CodeVO code) throws Exception {
		System.out.println("Check codeVO : " + code);
		
		sqlSession.insert(namespace + ".submit_code", code);
	}
	
	@Override
	public boolean IsSuccess(String user_id, int problem_id) throws Exception {
		
		Map<String, Object> listParam = new HashMap<String,Object>();
		
		listParam.put("user_id", user_id);
		listParam.put("problem_id", problem_id);
		
		boolean code_success;
		
		if(sqlSession.selectOne(namespace + ".code_success", listParam) == null) {
			code_success = false;
		} else {
			code_success = true;
		}
		
		return code_success;
	}
	
	

}
