package org.dms.web.persistence;

import org.dms.web.domain.CodeVO;

public interface CodeDAO {
	public void submitCode(CodeVO code) throws Exception;
}
