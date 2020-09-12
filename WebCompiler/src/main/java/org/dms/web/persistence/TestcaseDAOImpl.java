package org.dms.web.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.dms.web.domain.TestcaseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestcaseDAOImpl implements TestcaseDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "org.dms.web.mapper.Mapper";
	
	@Override
	public void insert(TestcaseVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".testcase_insert", vo);
	}

	@Override
	public TestcaseVO read(int problem_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".testcase_selectByid", problem_id);
	}
	
	@Override
	public List<String> getInputList(int problem_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".testcase_input_selectList", problem_id);
	}
	
	@Override
	public List<String> getOutputList(int problem_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".testcase_output_selectList", problem_id);
	}

}
