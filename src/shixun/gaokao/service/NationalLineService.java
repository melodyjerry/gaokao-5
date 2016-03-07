package shixun.gaokao.service;

import java.util.List;

import shixun.gaokao.pojo.NationalLine;

public interface NationalLineService {
	public List<NationalLine> getNationalLines(String area, String type, String batch);
}
