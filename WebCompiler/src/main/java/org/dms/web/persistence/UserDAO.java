package org.dms.web.persistence;

import java.util.List;
import java.util.Map;

import org.dms.web.domain.UserVO;

public interface UserDAO {
	public void insert(UserDAO user) throws Exception;
	public UserVO read(String id) throws Exception;
	public List<UserVO> readList() throws Exception;	
	public void delete(String id) throws Exception;
	public int update(UserVO user) throws Exception;
	public int saveImg(UserVO user) throws Exception;
}
