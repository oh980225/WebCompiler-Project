package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.StudentVO;
import org.dms.web.persistence.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	public StudentVO readMember(String id) throws Exception {
		return memberDAO.read(id);
	}
	
	public List<StudentVO> readMemberList() throws Exception{
		return memberDAO.readList();
	}
	
	public void addMember(StudentVO student) throws Exception {
		memberDAO.add(student);
	}
	
	public void deleteMember(String id) throws Exception {
		memberDAO.delete(id);
	}
	
	public void updateMember(StudentVO student) throws Exception {
		memberDAO.update(student);
	}
	
	public void updateMemberList(StudentVO student1, StudentVO student2) throws Exception {
		memberDAO.update(student2);
		memberDAO.update(student1);
	}
}
