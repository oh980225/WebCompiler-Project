package org.dms.web.service;

import java.util.List;
import org.dms.web.domain.UserVO;

public interface UserService {
	public UserVO readUser(int id) throws Exception;
	public void insertUser(UserVO vo) throws Exception;
	public List<UserVO> readUserList() throws Exception;
	public void deleteUser(int id) throws Exception;
	public void updateUser(UserVO vo) throws Exception;
}
