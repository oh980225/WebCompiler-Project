package org.dms.web.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.dms.web.domain.UserVO;
import org.dms.web.domain.VulVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VulDAOImpl implements VulDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "org.dms.web.mapper.Mapper";
	

	public List<VulVO> readList() throws Exception {
		List<VulVO> vulList = new ArrayList<VulVO>();
		vulList = sqlSession.selectList(namespace + ".getVul_list");
		return vulList;
		
	}
	
	

}
