package org.dms.web.service;

import org.dms.web.domain.BoardVO;
import org.dms.web.persistence.BoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@Component
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO boardDAO;

	@Override
	public void insertBoard(BoardVO bvo) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.insert(bvo);
		
	}

}
