package shixun.gaokao.service;

import java.util.List;

import shixun.gaokao.pojo.Result1Pojo;

public interface SelectCollegeByScoreService {
	public List<Result1Pojo> selectCollegeByScore(int myScore, int year,
			String area, String type, String batch);
}
