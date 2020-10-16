package org.dms.web.persistence;

import org.dms.web.domain.CodeVO;

public interface CodeDAO {
	public void submitCode(CodeVO code) throws Exception;

	boolean IsSuccess(String user_id, int problem_id) throws Exception;
}
