package shixun.gaokao.dao.impl;

import java.util.List;

import org.hibernate.Session;

import shixun.gaokao.dao.NationalLineDao;
import shixun.gaokao.pojo.NationalLine;
import shixun.gaokao.utils.HibernateUtils;

public class NationalLineDaoImpl implements NationalLineDao {

	@Override
	public List<NationalLine> getNationalLines(String area, String type,
			String batch) {
		Session session = HibernateUtils.openSession();
		
		try {
			session.beginTransaction(); // 开始事务
			List list = session.createQuery("FROM NationalLine WHERE area = ? AND type = ? AND batch = ?")
					.setString(0, area)
					.setString(1, type)
					.setString(2, batch)
					.list();
			session.getTransaction().commit(); // 提交事务
			
			if(list.size() == 0) {
				return null;
			} else {
				return list;
			}
			
		} catch (RuntimeException e) {
			session.getTransaction().rollback(); // 回滚事务
			throw e;
		} finally {
			session.close(); // 关闭Session
		}
	}

}
