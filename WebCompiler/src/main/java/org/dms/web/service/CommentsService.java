package org.dms.web.service;

import java.util.List;
import org.dms.web.domain.CommentsVO;

public interface CommentsService {
	public List<CommentsVO> readCommentList(int board_id) throws Exception;
}
