package org.dms.web.persistence;

import java.util.List;

import org.dms.web.domain.BoardVO;
import org.dms.web.domain.Criteria;
import org.dms.web.domain.ProblemVO;
public interface BoardDAO {
	public void insert(BoardVO bvo) throws Exception;
	public List<BoardVO> readList(Criteria criteria) throws Exception;
	public BoardVO read(int board_id) throws Exception;
	public int boardCount() throws Exception;
	public void delete(int board_id) throws Exception;
	public void update(BoardVO bvo) throws Exception;
	
}
