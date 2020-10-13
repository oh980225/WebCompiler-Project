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

	@Override
	public void insertComment(CommentsVO comment) throws Exception {
		// TODO Auto-generated method stub
		commentsDAO.insert(comment);
	}

	@Override
	public int count(int board_id) throws Exception {
		// TODO Auto-generated method stub
		return commentsDAO.count(board_id);
	}

	@Override
	public void deleteComment(int comments_id) throws Exception {
		// TODO Auto-generated method stub
		commentsDAO.delete(comments_id);
		
	}

	@Override
	public void updateComment(CommentsVO comment) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
