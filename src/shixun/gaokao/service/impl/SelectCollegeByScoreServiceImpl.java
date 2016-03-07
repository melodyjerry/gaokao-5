package shixun.gaokao.service.impl;

import java.util.List;

import shixun.gaokao.dao.SelectCollegeByScoreDao;
import shixun.gaokao.dao.impl.SelectCollegeByScoreDaoImpl;
import shixun.gaokao.pojo.Result1Pojo;
import shixun.gaokao.service.SelectCollegeByScoreService;

public class SelectCollegeByScoreServiceImpl implements
		SelectCollegeByScoreService {
	
	SelectCollegeByScoreDao selectCollegeByScoreDao = new SelectCollegeByScoreDaoImpl();

	@Override
	public List<Result1Pojo> selectCollegeByScore(int myScore, int year,
			String area, String type, String batch) {
		return selectCollegeByScoreDao.selectCollegeByScore(myScore, year, area, type, batch);
	}

}
