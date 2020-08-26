package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.BoardVO;
import org.dms.web.domain.Criteria;
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

	@Override
	public List<BoardVO> readBoardList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.readList(cri);
	}

	@Override
	public int boardCount() throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.boardCount();
	}

	@Override
	public BoardVO readBoard(int board_id) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.read(board_id);
	}

	@Override
	public void deleteBoard(int board_id) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.delete(board_id);
		
	}

	@Override
	public void updateBoard(BoardVO bvo) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.update(bvo);
		
	}

}
