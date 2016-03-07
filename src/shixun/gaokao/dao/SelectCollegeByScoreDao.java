package shixun.gaokao.dao;

import java.util.List;

import shixun.gaokao.pojo.Result1Pojo;

public interface SelectCollegeByScoreDao {
	public List<Result1Pojo> selectCollegeByScore(int myScore, int year, String area, String type, String batch);
}
