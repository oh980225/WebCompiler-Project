package org.dms.web.persistence;

import java.util.List;

import org.dms.web.domain.CodeBoardVO;
import org.dms.web.domain.Criteria;

public interface CodeBoardDAO {
	public List<CodeBoardVO> getCodeBoardList(String user_id) throws Exception;
	public List<CodeBoardVO> getCodeBoardList(String user_id, Criteria criteria) throws Exception;
}

