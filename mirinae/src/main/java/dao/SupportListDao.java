package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.SupportList;
import service.support.SupportListAll;

public class SupportListDao {
	private static SupportListDao instance = new SupportListDao();
	private SupportListDao() {}
	public static SupportListDao getInstance() {
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
	public List<SupportList> list(int temp) {
		return session.selectList("support_listns.sp_list", temp);
	}
	public SupportList oneList(int temp) {
		return (SupportList) session.selectOne("support_listns.sp_list", temp);
	}
}
