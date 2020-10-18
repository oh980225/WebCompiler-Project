package org.dms.web.service;

import org.dms.web.domain.CodeVO;
import org.dms.web.persistence.CodeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeServiceImpl implements CodeService {
	
	@Autowired
	private CodeDAO codeDAO;

	@Override
	public void submitCode(CodeVO code) throws Exception {
		codeDAO.submitCode(code);
	}
	
	@Override
	public boolean IsSuccess(String user_id, int problem_id) throws Exception {
		return codeDAO.IsSuccess(user_id, problem_id);
	}

}
