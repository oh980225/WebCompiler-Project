package org.dms.web.service;

import java.util.List;

import org.dms.web.domain.Criteria;
import org.dms.web.domain.ProblemVO;


public interface ProblemService {	
	public List<ProblemVO> readProblemList(int level, String category) throws Exception;
	public List<ProblemVO> readProblemList(int level, String category, Criteria cri) throws Exception;
	public List<ProblemVO> readProblemList() throws Exception;
	public ProblemVO readProblem(int id) throws Exception;
	public void insertProblem(ProblemVO problem) throws Exception;
	public List<ProblemVO> test() throws Exception;
	
	// 문제 총 갯수
	public int ProblemCount() throws Exception;
	public int ProblemCount(int level, String category) throws Exception;
	
	// 문제 목록 조회
	public List<ProblemVO> readProblemList(Criteria cri) throws Exception;
	List<ProblemVO> readProblemList(String category, Criteria cri) throws Exception;
	public int ProblemCount(String category) throws Exception;
}
