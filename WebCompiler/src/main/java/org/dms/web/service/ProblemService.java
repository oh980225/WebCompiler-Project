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
	
	// 문제 제출, 성공횟수 증가
	public void addSuccess (int problem_id);
	public void addSubmit (int problem_id);
	
	// 문제 총 갯수
	public int ProblemCount() throws Exception;
	public int ProblemCount(int level, String category) throws Exception;
	
	// 문제 목록 조회
	public List<ProblemVO> readProblemList(Criteria cri) throws Exception;
	List<ProblemVO> readProblemList(String category, Criteria cri) throws Exception;
	public List<ProblemVO> readProblemList(int level, Criteria cri) throws Exception;
	
	public int ProblemCount(String category) throws Exception;
	// 검색
	public List<ProblemVO> searchProblemList(String searchType, String searchInput, Criteria criteria) throws Exception;
	public int searchProblemCount(String searchType, String searchInput) throws Exception;
	// 검색 + 카테고리
	public List<ProblemVO> searchProblemListByCategory(String searchType, String searchInput, String category, Criteria criteria) throws Exception;
	public int searchProblemCountByCategory(String searchType, String searchInput, String category) throws Exception;
	// 검색 + 레벨
	public List<ProblemVO> searchProblemListByLevel(String searchType, String searchInput, int level, Criteria criteria) throws Exception;
	public int searchProblemCountByLevel(String searchType, String searchInput, int level) throws Exception;
	// 검색 + 카테고리 + 레벨
	public List<ProblemVO> searchProblemListByCategoryAndLevel(String searchType, String searchInput, String category, int level, Criteria criteria) throws Exception;
	public int searchProblemCountByCategoryAndLevel(String searchType, String searchInput, String category, int level) throws Exception;
	// 문제 등록시 중복 확인
	public boolean checkId(String value) throws Exception;
}
