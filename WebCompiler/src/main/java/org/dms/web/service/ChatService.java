package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.ChatVO;
import org.dms.web.domain.StudentVO;

public interface ChatService {
	public StudentVO readChat(String user_id) throws Exception;
	public List<ChatVO> readChatList(int problem_id) throws Exception;
	public void insertChat(ChatVO cvo) throws Exception;
	public void deleteChat(String id) throws Exception; 
	public void updateChat(ChatVO cvo) throws Exception;
}
