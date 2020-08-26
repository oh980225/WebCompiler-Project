package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.CommentsVO;
import org.dms.web.persistence.CommentsDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@Component
public class CommentsServiceImpl implements CommentsService {

	@Autowired
	CommentsDAO commentsDAO;
	
	@Override
	public List<CommentsVO> readCommentList(int board_id) throws Exception {
		// TODO Auto-generated method stub
		return commentsDAO.readList(board_id);
	}

}
