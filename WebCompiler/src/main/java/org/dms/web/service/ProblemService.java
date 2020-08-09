package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.ProblemVO;
import org.dms.web.domain.StudentVO;
import org.dms.web.domain.UserVO;

public interface ProblemService {	
	public List<ProblemVO> readProblemList(int level, String category) throws Exception;
	public ProblemVO readProblem(int id) throws Exception;
	public void insertProblem(ProblemVO problem) throws Exception;
}
