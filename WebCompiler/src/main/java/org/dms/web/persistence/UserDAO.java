package org.dms.web.persistence;

import java.util.List;
import java.util.Map;

import org.dms.web.domain.CodeVO;
import org.dms.web.domain.UserVO;

public interface UserDAO {
	public void insert(UserVO user) throws Exception;
	public UserVO read(String id) throws Exception;
	public UserVO read(UserVO user) throws Exception;
	public List<UserVO> readList() throws Exception;	
	public void delete(String id) throws Exception;
	public int update(UserVO user) throws Exception;
	public int saveImg(UserVO user) throws Exception;
	public List<CodeVO> getCodeList(String id) throws Exception;
	public boolean checkId(String value) throws Exception;
}
