package shixun.gaokao.service;

import java.util.List;

import shixun.gaokao.pojo.College;

public interface CollegeService {
	public List<College> getCollegeByName(String collegeName, int pageNo);
	public List<College> getCollegeByConditions(String area, String type,
			String level, String _985, String _211, int pageNo);
}
