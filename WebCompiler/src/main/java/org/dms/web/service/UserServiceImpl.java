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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		/* 암호화*/ 
        //String encode_password = LoginUtil.encryptPassword(vo.getUser_id(), vo.getUser_passwd());
        //vo.setMbrPw(encode_password);
        //vo.setMbrPw_check(encode_password);
        //memberDAOService.insertMembership(memberVO);
		vo.setUser_authority("USER");
		userDAO.insert(vo);

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

	@Override
	public UserVO readUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.read(vo);
	}

}
