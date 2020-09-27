package org.dms.web.service;

import java.util.List;
import java.util.Map;

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
	public UserVO readUser(String id) throws Exception {
		return userDAO.read(id);
	}

	@Override
	public void insertUser(UserVO vo) throws Exception {
		userDAO.insert(vo);
		// TODO Auto-generated method stub

	}

	@Override
	public List<UserVO> readUserList() throws Exception {
		// TODO Auto-generated method stub
		return userDAO.readList();
	}

	@Override
	public void deleteUser(String id) throws Exception {
		userDAO.delete(id);

	}

	@Override
	public void updateUser(UserVO user) throws Exception {
		userDAO.update(user);
	}
	
	@Override
	public void saveImage(UserVO user) throws Exception {
		userDAO.saveImg(user);
		
	}

	@Override
	public UserVO readUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.read(vo);
	}


}
