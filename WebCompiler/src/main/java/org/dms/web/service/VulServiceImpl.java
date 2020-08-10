package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.VulVO;
import org.dms.web.persistence.UserDAO;
import org.dms.web.persistence.VulDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@Component
public class VulServiceImpl implements VulService {
	
	
	
	@Autowired
	private VulDAO vulDAO;

	@Override
	public List<VulVO> readVulList() throws Exception {
		// TODO Auto-generated method stub
		return vulDAO.readList();
	}

}
