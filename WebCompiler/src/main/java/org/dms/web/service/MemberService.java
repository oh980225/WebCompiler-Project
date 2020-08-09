package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.StudentVO;

public interface MemberService {
	
	public StudentVO readMember(String id) throws Exception;
	public List<StudentVO> readMemberList() throws Exception;
	public void addMember(StudentVO student) throws Exception;
	public void deleteMember(String id) throws Exception; 
	public void updateMember(StudentVO student) throws Exception;
	public void updateMemberList(StudentVO student1, StudentVO student2) throws Exception;
	
}
