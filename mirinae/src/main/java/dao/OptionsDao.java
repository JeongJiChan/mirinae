package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Options;

public class OptionsDao {
	private static OptionsDao instance = new OptionsDao();
	private OptionsDao () {}
	public static OptionsDao getInstance() {
		return instance;
	}
	
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		}catch (Exception e) {
			System.out.println("연결에러 : " + e.getMessage());
		}
	}
	public int insert(Options options) {		
		return session.insert("optionsns.insert",options);
	}
	public int find_opt_code() {
		
		return (int) session.selectOne("optionsns.select");
	}
	public List<Options> optionsList(int p_no) {
		return session.selectList("optionsns.selectList",p_no);
	}
	public void deleteoptions(int p_no) {
		session.update("optionsns.deleteopt",p_no);
	}
}
