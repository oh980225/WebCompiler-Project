package org.dms.web.persistence;

import java.util.List;

import org.dms.web.domain.CommentsVO;

public interface CommentsDAO {
	// read
	public List<CommentsVO> readList(int board_id) throws Exception;
	public void insert(CommentsVO comment) throws Exception;
	public int count(int board_id) throws Exception;
	public void delete(int comment_id) throws Exception;
	public void update(CommentsVO comment) throws Exception;

}
