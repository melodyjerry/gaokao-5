package shixun.gaokao.service;

import java.util.List;

import shixun.gaokao.pojo.Result2Pojo;

public interface SelectProByScoreService {
	public List<Result2Pojo> selectProByScore(int myScore, int year,
			String area, String type, String batch, String pro);
}
