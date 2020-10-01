package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.CodeBoardVO;
import org.dms.web.domain.Criteria;
import org.dms.web.persistence.CodeBoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeBoardServiceImpl implements CodeBoardService {
	
	@Autowired
	CodeBoardDAO codeBoardDAO;

	@Override
	public List<CodeBoardVO> getCodeBoardList(String user_id) throws Exception {
		return codeBoardDAO.getCodeBoardList(user_id);
	}
	
	@Override
	public List<CodeBoardVO> getCodeBoardList(String user_id, Criteria criteria) throws Exception {
		return codeBoardDAO.getCodeBoardList(user_id, criteria);
	}

}
