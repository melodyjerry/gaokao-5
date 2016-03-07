package shixun.gaokao.dao;

import java.util.List;

import shixun.gaokao.pojo.College;

public interface CollegeDao {
	public List<College> getCollegeByName(String collegeName, int pageNo);
	public List<College> getCollegeByConditions(String area, String type, String level, String _985, String _211, int pageNo);
	
}
