package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.UserVO;
import org.dms.web.persistence.UserDAO;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
@Component
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	public UserServiceImpl(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@Override
	public UserVO readUser(int id) throws Exception {
		return userDAO.read(id);
	}

	@Override
	public void insertUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<UserVO> readUserList() throws Exception {
		// TODO Auto-generated method stub
		return userDAO.readList();
	}

	@Override
	public void deleteUser(int id) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

}
