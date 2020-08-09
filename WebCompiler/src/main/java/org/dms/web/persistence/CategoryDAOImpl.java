package org.dms.web.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.dms.web.domain.CategoryVO;
import org.dms.web.domain.StudentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "org.dms.web.mapper.Mapper";
	
	@Override
	public List<CategoryVO> readList() throws Exception {
		// TODO Auto-generated method stub
		List<CategoryVO> categorylist = new ArrayList<CategoryVO>();
		categorylist = sqlSession.selectList(namespace + ".category_selectAll");
		return categorylist;
	}

}
