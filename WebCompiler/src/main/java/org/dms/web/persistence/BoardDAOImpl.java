package org.dms.web.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.dms.web.domain.BoardVO;
import org.dms.web.domain.Criteria;
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
		if(bvo.getProblem_id() > 0) {
			sqlSession.insert(namespace + ".board_insert_free", bvo);
		}
		else {
			sqlSession.insert(namespace + ".board_insert_question", bvo);
		}
		
	}


	@Override
	public List<BoardVO> readList(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".board_selectAll", criteria);
	}


	@Override
	public int boardCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".board_count");
	}


	@Override
	public BoardVO read(int board_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".board_selectByid", board_id);
	}


	@Override
	public void delete(int board_id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".board_delete", board_id);
		
	}


	@Override
	public void update(BoardVO bvo) throws Exception {
		// TODO Auto-generated method stub
		if(bvo.getProblem_id() > 0) {
			sqlSession.update(namespace + ".board_update_question", bvo);
		}
		else {
			sqlSession.update(namespace + ".board_update_free", bvo);
		}
	}

}
