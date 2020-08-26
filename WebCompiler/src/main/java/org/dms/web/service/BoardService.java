package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.BoardVO;
import org.dms.web.domain.Criteria;

public interface BoardService {
	public void insertBoard(BoardVO bvo) throws Exception;
	// 문제 목록 조회
	public List<BoardVO> readBoardList(Criteria cri) throws Exception;
	public BoardVO readBoard(int board_id) throws Exception;
	public int boardCount() throws Exception;
	public void deleteBoard(int board_id) throws Exception;
	public void updateBoard(BoardVO bvo) throws Exception;
}
