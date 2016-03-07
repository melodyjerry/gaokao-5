package shixun.gaokao.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {

	// SessionFactory全局只需要有一个就可以了
	private static SessionFactory sessionFactory;

	static {
		Configuration cfg = new Configuration();

		// 初始化SessionFactory
		sessionFactory = new Configuration()
				.configure()
				.buildSessionFactory();
		
	}

	/**
	 * 获取全局唯一的SessionFactory
	 * 
	 * @return
	 */
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
	 * 从全局唯一的SessionFactory中打开一个Session
	 * 
	 * @return
	 */
	public static Session openSession() {
		return sessionFactory.openSession();
	}
}
