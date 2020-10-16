package org.dms.web.service;

import org.dms.web.domain.CodeVO;

public interface CodeService {
	public void submitCode(CodeVO code) throws Exception;
	
	public boolean IsSuccess(String user_id, int problem_id) throws Exception;
}
