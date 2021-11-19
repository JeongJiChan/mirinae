package dao;

import java.io.Reader;
import model.Admin;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class AdminDao {
	// singleton
	private static AdminDao instance = new AdminDao();
	private AdminDao() { }
	public static AdminDao getInstance() {
		return instance;
	}
	
	// database connection pool
	private static SqlSession session;
	static {  // 초기화 블록
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch(Exception e) {
			System.out.println("연결에러 : " + e.getMessage());
		}
	}
	public Admin ad_select(String id) {
		// selectOne는 데이터 한건 조회, selectList는 여러건 조회
		return (Admin)session.selectOne("adminns.ad_select",id);
	}
}