package org.dms.web.persistence;

import java.util.List;

import org.dms.web.domain.ProblemVO;

public interface ProblemDAO {
	public ProblemVO read(int id);
	public List<ProblemVO> readList(int level, String category) throws Exception;
	public void update(ProblemVO problem) throws Exception;
	public void insert(ProblemVO problem) throws Exception;
}