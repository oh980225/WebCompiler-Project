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

}