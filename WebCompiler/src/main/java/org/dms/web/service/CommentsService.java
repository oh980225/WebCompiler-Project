package org.dms.web.service;

import java.util.List;
import org.dms.web.domain.CommentsVO;

public interface CommentsService {
	public List<CommentsVO> readCommentList(int board_id) throws Exception;
	public void insertComment(CommentsVO comment) throws Exception;
	public int count(int board_id) throws Exception;
	public void deleteComment(int board_id) throws Exception;
	public void updateComment(CommentsVO comment) throws Exception;
}
