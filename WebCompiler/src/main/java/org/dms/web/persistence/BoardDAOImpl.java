package org.dms.web.persistence;

import org.apache.ibatis.session.SqlSession;
import org.dms.web.domain.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace ="org.dms.web.mapper.Mapper";
	

	@Override
	public void insert(BoardVO bvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".board_insert", bvo);
	}

}
