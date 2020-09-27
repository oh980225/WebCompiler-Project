package org.dms.web.persistence;

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

}
