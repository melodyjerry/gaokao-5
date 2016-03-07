package shixun.gaokao.dao;

import java.util.List;

import shixun.gaokao.pojo.Result2Pojo;

public interface SelectProByScoreDao {
	public List<Result2Pojo> selectProByScore(int myScore, int year, String area, String type, String batch, String pro);
}
