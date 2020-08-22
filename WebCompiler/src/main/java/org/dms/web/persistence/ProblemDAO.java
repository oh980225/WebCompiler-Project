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
}