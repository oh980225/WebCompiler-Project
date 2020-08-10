package org.dms.web.persistence;

import java.util.List;


import org.dms.web.domain.VulVO;

public interface VulDAO {
	//public List<UserVO> readList() throws Exception;
	public List<VulVO> readList() throws Exception;
}
