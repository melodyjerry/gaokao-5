package shixun.gaokao.service.impl;

import java.util.List;

import shixun.gaokao.dao.SelectProByScoreDao;
import shixun.gaokao.dao.impl.SelectProByScoreDaoImpl;
import shixun.gaokao.pojo.Result2Pojo;
import shixun.gaokao.service.SelectProByScoreService;

public class SelectProByScoreServiceImpl implements SelectProByScoreService {
	SelectProByScoreDao selectProByScoreDao = new SelectProByScoreDaoImpl();
	
	public List<Result2Pojo> selectProByScore(int myScore, int year,
			String area, String type, String batch, String pro) {
		return selectProByScoreDao.selectProByScore(myScore, year, area, type, batch, pro);
	}
}
