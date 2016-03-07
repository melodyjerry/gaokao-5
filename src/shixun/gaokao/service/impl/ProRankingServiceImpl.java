package shixun.gaokao.service.impl;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import shixun.gaokao.dao.ProRankingDao;
import shixun.gaokao.dao.impl.ProRankingDaoImpl;
import shixun.gaokao.pojo.Profession;
import shixun.gaokao.service.ProRankingService;

public class ProRankingServiceImpl implements ProRankingService {
	ProRankingDao proRankingDao = new ProRankingDaoImpl();
	
	public List<Profession> getProRanking() {
		List<Profession> list = proRankingDao.getProRanking();

		if (list != null) {
			ProHeatComparator comparator = new ProHeatComparator();
			Collections.sort(list, comparator);
		}

		return list;
	}

	private class ProHeatComparator implements Comparator {
		public int compare(Object o1, Object o2) {
			Profession profession1 = (Profession) o1;
			Profession profession2 = (Profession) o2;

			return Integer.valueOf(profession2.getProHeat()).
					compareTo(Integer.valueOf(profession1.getProHeat()));
		}
	}

}
