package shixun.gaokao.dao.impl;

import java.util.List;

import org.hibernate.Session;

import shixun.gaokao.dao.ProRankingDao;
import shixun.gaokao.pojo.Profession;
import shixun.gaokao.utils.HibernateUtils;

public class ProRankingDaoImpl implements ProRankingDao {

	@Override
	public List<Profession> getProRanking() {
		Session session = HibernateUtils.openSession();

		try {
			session.beginTransaction(); // 开始事务
			List<Profession> list = session.createQuery("FROM Profession").list();
			session.getTransaction().commit(); // 提交事务

			if (list.size() == 0) {
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
