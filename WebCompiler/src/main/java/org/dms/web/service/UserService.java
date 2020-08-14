package org.dms.web.service;

import java.util.List;
import java.util.Map;

import org.dms.web.domain.UserVO;

public interface UserService {
	public UserVO readUser(String id) throws Exception;
	public void insertUser(UserVO vo) throws Exception;
	public List<UserVO> readUserList() throws Exception;
	public void deleteUser(String id) throws Exception;
	public void updateUser(UserVO user) throws Exception;
	public void saveImage(UserVO user) throws Exception;
}
