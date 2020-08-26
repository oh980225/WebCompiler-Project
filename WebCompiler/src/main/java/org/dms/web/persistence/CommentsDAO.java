package org.dms.web.persistence;

import java.util.List;

import org.dms.web.domain.CommentsVO;

public interface CommentsDAO {
	// read
	public List<CommentsVO> readList(int board_id) throws Exception;

}
