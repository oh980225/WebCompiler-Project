package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.VulVO;


public interface VulService {
	
	public List<VulVO> readVulList() throws Exception;

}
