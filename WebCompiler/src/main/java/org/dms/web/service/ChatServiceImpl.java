package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.ChatVO;
import org.dms.web.domain.StudentVO;
import org.dms.web.persistence.ChatDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@Component
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDAO chatDAO;
	
	@Override
	public StudentVO readChat(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatVO> readChatList(int problem_id) throws Exception {
		// TODO Auto-generated method stub
		return chatDAO.readList(problem_id);
	}

	@Override
	public void insertChat(ChatVO cvo) throws Exception {
		// TODO Auto-generated method stub
		chatDAO.insert(cvo);
		
	}

	@Override
	public void deleteChat(String id) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateChat(ChatVO cvo) throws Exception {
		// TODO Auto-generated method stub

	}

}
