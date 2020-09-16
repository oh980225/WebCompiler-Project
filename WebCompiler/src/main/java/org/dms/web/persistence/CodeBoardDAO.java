package org.dms.web.persistence;

import java.util.List;

import org.dms.web.domain.CodeBoardVO;

public interface CodeBoardDAO {
	public List<CodeBoardVO> getCodeBoardList(String user_id) throws Exception;
}

