package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.CategoryVO;

public interface CategoryService {
	public List<CategoryVO> readCategoryList() throws Exception;
}
