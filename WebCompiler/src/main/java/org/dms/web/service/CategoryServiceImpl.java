package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.CategoryVO;
import org.dms.web.persistence.CategoryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@Component
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDAO categoryDAO;
	
	@Override
	public List<CategoryVO> readCategoryList() throws Exception {
		// TODO Auto-generated method stub
		return categoryDAO.readList();
	}

}
