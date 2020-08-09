package org.dms.web.persistence;

import java.util.List;
import org.dms.web.domain.UserVO;

public interface UserDAO {
	public void insert(UserDAO user) throws Exception;
	public UserVO read(int id) throws Exception;
	public List<UserVO> readList() throws Exception;	
	public void delete(String id) throws Exception;
	public void update(UserVO user) throws Exception;
}
