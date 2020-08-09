package org.dms.web.persistence;

import java.util.List;

import org.dms.web.domain.CategoryVO;

public interface CategoryDAO {
	public List<CategoryVO> readList() throws Exception;

}
