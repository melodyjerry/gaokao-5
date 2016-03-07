package shixun.gaokao.service.impl;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import shixun.gaokao.dao.NationalLineDao;
import shixun.gaokao.dao.impl.NationalLineDaoImpl;
import shixun.gaokao.pojo.NationalLine;
import shixun.gaokao.service.NationalLineService;

public class NationalLineServiceImpl implements NationalLineService {
	NationalLineDao nationalLineDao = new NationalLineDaoImpl();

	@Override
	public List<NationalLine> getNationalLines(String area, String type,
			String batch) {
		List<NationalLine> list;
		list = nationalLineDao.getNationalLines(area, type, batch);
		
		if(list != null) {
			ScoreLineComparator comparator=new ScoreLineComparator();
	        Collections.sort(list, comparator);
		}		
		
		return list;
	}
	
	private class ScoreLineComparator implements Comparator {

		@Override
		public int compare(Object o1, Object o2) {
			NationalLine nationalLine1=(NationalLine) o1;
			NationalLine nationalLine2=(NationalLine) o2;
	        
			return Integer.valueOf(nationalLine1.getYear()).
					compareTo(Integer.valueOf(nationalLine2.getYear()));
			//return 0;
		}
		
	}
	
}
