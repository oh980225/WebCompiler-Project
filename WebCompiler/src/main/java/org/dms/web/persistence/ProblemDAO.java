package org.dms.web.persistence;

import java.util.List;

import org.dms.web.domain.Criteria;
import org.dms.web.domain.ProblemVO;

public interface ProblemDAO {
	public ProblemVO read(int id);
	public List<ProblemVO> readList(int level, String category) throws Exception;
	public List<ProblemVO> readList(int level, String category, Criteria criteria) throws Exception;
	public List<ProblemVO> readList() throws Exception;
	public int ProblemCount() throws Exception;
	public int ProblemCount(int level, String category) throws Exception;
	public void update(ProblemVO problem) throws Exception;
	public void insert(ProblemVO problem) throws Exception;
	public List<ProblemVO> listPaging(int page) throws Exception;
	public List<ProblemVO> listCriteria(Criteria criteria) throws Exception;
	List<ProblemVO> readList(String category, Criteria criteria) throws Exception;
	List<ProblemVO> readList(int level, Criteria criteria) throws Exception;
	public int ProblemCount(String category) throws Exception;
	public void addSubmit (int problem_id);
	public void addSuccess (int problem_id);
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