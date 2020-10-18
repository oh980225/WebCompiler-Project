package org.dms.web.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.dms.web.domain.CommentsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentsDAOImpl implements CommentsDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace ="org.dms.web.mapper.Mapper";
	
	@Override
	public List<CommentsVO> readList(int board_id) throws Exception {
		// TODO Auto-generated method stub
		List<CommentsVO> commentlist = new ArrayList<CommentsVO>();
		commentlist = sqlSession.selectList(namespace + ".comment_selectAll", board_id);
		return commentlist;
	}

	@Override
	public void insert(CommentsVO comment) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".comment_insert", comment);
		
	}

	@Override
	public int count(int board_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".comment_count", board_id);
	}

	@Override
	public void delete(int comment_id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".comment_delete", comment_id);
	}

	@Override
	public void update(CommentsVO comment) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
