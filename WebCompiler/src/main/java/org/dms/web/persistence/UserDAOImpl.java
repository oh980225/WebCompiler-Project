package org.dms.web.persistence;

import java.util.ArrayList;
import java.util.List;

import org.dms.web.domain.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "org.dms.web.mapper.Mapper";

	@Override
	public void insert(UserDAO user) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<UserVO> readList() throws Exception {
		// TODO Auto-generated method stub
		List<UserVO> userList=new ArrayList<UserVO>();
		userList = sqlSession.selectList(namespace + ".user_selectAll");
		for(int i = 0; i<userList.size(); i++) {
			String introduce = userList.get(i).getUser_introduce();
			introduce.replace("입니다", "바꿨다");
			System.out.println(i + ": " + introduce);
			userList.get(i).setUser_introduce(introduce);
		}
		return userList;
	}

	@Override
	public UserVO read(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String id) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(UserVO user) throws Exception {
		// TODO Auto-generated method stub

	}

}
