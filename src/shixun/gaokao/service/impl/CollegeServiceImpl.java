package shixun.gaokao.service.impl;

import java.util.List;

import shixun.gaokao.dao.CollegeDao;
import shixun.gaokao.dao.impl.CollegeDaoImpl;
import shixun.gaokao.pojo.College;
import shixun.gaokao.service.CollegeService;

public class CollegeServiceImpl implements CollegeService {
	
	CollegeDao collegeDao = new CollegeDaoImpl();

	@Override
	public List<College> getCollegeByName(String collegeName, int pageNo) {
		List<College> list = collegeDao.getCollegeByName(collegeName, pageNo);
		
		return list;
	}

	@Override
	public List<College> getCollegeByConditions(String area, String type,
			String level, String _985, String _211, int pageNo) {
		List<College> list = collegeDao.getCollegeByConditions(area, type, level, _985, _211, pageNo);
		
		return list;
	}

}
