package shixun.gaokao.dao.impl;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;

import shixun.gaokao.dao.SelectCollegeByScoreDao;
import shixun.gaokao.pojo.Result1Pojo;
import shixun.gaokao.utils.HibernateUtils;

public class SelectCollegeByScoreDaoImpl implements SelectCollegeByScoreDao {

	public List<Result1Pojo> selectCollegeByScore(int myScore, int year,
			String area, String type, String batch) {
		String acceptStu = null;
		
		if(type.equals("理科")) {
			acceptStu = " acceptSciencesStu = '是' ";
		} else if(type.equals("文科")) {
			acceptStu = " acceptLiberalStu = '是' ";
		}
		
		Session session = HibernateUtils.openSession();
		
		
		String querySql = " SELECT * FROM ( " +

		" SELECT collegeCode, collegeName, collegeIntro, batch, AVG(minDelta) AS avgMinDelta, " + myScore + 
		" -(SELECT score FROM t_nationalline AS sl WHERE sl.area = '" + area + "' AND sl.type = '" + type + "' AND sl.batch = '" + batch + "' AND sl.year = " + year + ") AS myDelta " + 
		" FROM ( SELECT enrollYear, collegeCode, ( SELECT t_college.name FROM t_college WHERE t_college.no=collegeCode) AS collegeName, " + 
		" (SELECT t_college.introductionPage FROM t_college WHERE t_college.no=collegeCode) AS collegeIntro, batch, MIN(minEnrollScore)-(SELECT score FROM t_nationalline AS sl " + 
		" WHERE sl.area = '" + area + "' AND sl.type = '" + type + "' AND sl.batch = '" + batch + "' AND sl.year = enrollYear) AS minDelta " + 
		" FROM t_enroll WHERE enrollArea='" + area + "' AND " + acceptStu + " AND batch='" + batch + "' GROUP BY collegeCode, enrollYear " + 
		" ) AS temp GROUP BY collegeCode ) AS temp2 WHERE avgMinDelta<myDelta*1.2 ORDER BY avgMinDelta DESC";

		try {
			session.beginTransaction(); // 开始事务
			
			SQLQuery query = session.createSQLQuery(querySql);
            query.addScalar("collegeCode",StandardBasicTypes.STRING);
            query.addScalar("collegeName",StandardBasicTypes.STRING);
            query.addScalar("collegeIntro",StandardBasicTypes.STRING);
            query.addScalar("batch",StandardBasicTypes.STRING);
            query.addScalar("avgMinDelta",StandardBasicTypes.INTEGER);
            query.addScalar("myDelta",StandardBasicTypes.INTEGER);
            query.setResultTransformer(Transformers.aliasToBean(Result1Pojo.class));
            List<Result1Pojo> list = query.list();			
			
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
