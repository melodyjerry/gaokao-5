package shixun.gaokao.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import shixun.gaokao.dao.CollegeDao;
import shixun.gaokao.pojo.College;
import shixun.gaokao.utils.HibernateUtils;

public class CollegeDaoImpl implements CollegeDao {

	@Override
	public List<College> getCollegeByName(String collegeName, int pageNo) {
		
		int pageSize = 3;
		Session session = HibernateUtils.openSession();

		try {
			session.beginTransaction(); // 开始事务
			
			Query query = session.createQuery(
					"FROM College WHERE name LIKE ?")
					.setParameter(0, "%" + collegeName + "%");
			
			//实现分页查询
			query.setFirstResult((pageNo - 1) * pageSize);
			query.setMaxResults(pageSize);
			
			List list = query.list();
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

	@Override
	public List<College> getCollegeByConditions(String area, String type,
			String level, String _985, String _211, int pageNo) {
		int pageSize = 3;
		Session session = HibernateUtils.openSession();
		String hql = "";
		
		if(_985.equals("是") && _211.equals("是")) {
			hql = " AND _985 = '是' AND _211 = '是' ";
		} else if(_985.equals("否") && _211.equals("否")) {
			hql = " ";
		} else if(_985.equals("否") && _211.equals("是")) {
			hql = " AND _211 = '是' ";
		} else if(_985.equals("是") && _211.equals("否")) {
			hql = " AND _985 = '是' ";
		}
		

		try {
			session.beginTransaction(); // 开始事务
			
			Query query = session.createQuery(
					"FROM College WHERE area = ? AND type LIKE ? AND level = ? " + hql)
					.setParameter(0, area)
					.setParameter(1, "%" + type + "%")
					.setParameter(2, level);
			
			//实现分页查询
			query.setFirstResult((pageNo - 1) * pageSize);
			query.setMaxResults(pageSize);
			
			List list = query.list();
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
