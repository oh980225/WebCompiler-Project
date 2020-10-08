package org.dms.web.persistence;

import java.util.List;

import org.dms.web.domain.ChatVO;

public interface ChatDAO {
	public void insert(ChatVO student) throws Exception;
	public List<ChatVO> readList(int problem_id) throws Exception;
	public ChatVO read(String id) throws Exception;
	public void delete(String id) throws Exception;
	public void update(ChatVO student) throws Exception;
}
