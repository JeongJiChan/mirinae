package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Mypick;
import model.Project;

public class MyProjectDao {
	//single ton
	private static MyProjectDao instance = new MyProjectDao();
	private MyProjectDao() {}
	public static MyProjectDao getInstance() {
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
		public int myTotal(String id) {
			return (int)session.selectOne("projectns.myTotal",id);
		}
		

}
