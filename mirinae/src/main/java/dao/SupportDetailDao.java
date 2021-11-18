package dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.SupportDetail;

public class SupportDetailDao {
	private static SupportDetailDao instance = new SupportDetailDao();
	private SupportDetailDao() {}
	public static SupportDetailDao getInstance() {
		return instance;
	}
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("연결에러 : " + e.getMessage());
		}
	}
	public int setSupd_no() {
		return (int) session.selectOne("support_detailns.select");
	}
	public int insert(SupportDetail detail) {
		return session.insert("supportns.insert", detail);		
	}
}
