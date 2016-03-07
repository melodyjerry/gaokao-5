package shixun.gaokao.dao;

import java.util.List;

import shixun.gaokao.pojo.NationalLine;

public interface NationalLineDao {
	public List<NationalLine> getNationalLines(String area, String type, String batch);
}
