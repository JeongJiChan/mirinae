package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Mypick;
import model.Project;

public class MypickDao {
	// single tone 생성
	private static MypickDao instance = new MypickDao();
	
	private MypickDao() {}
	
	public static MypickDao getInstance() {
		return instance;
	}
	
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
			reader.close();
		} catch (Exception e) {
			System.out.println("연결 에러 : " + e.getMessage());
		}
	}
	public int getTotal() {
		return (int)session.selectOne("mypickns.getTotal");
	}

	public List<Mypick> m_list(int m_no) {
		List<Mypick> m_list=(List<Mypick>)session.selectList("mypickns.selectM",m_no);
		return m_list; 
	}

	public int m_no(String id) {
		return (int)session.selectOne("mypickns.selectM_no",id);
	}

	public List<Project> p_list(int m_no) {
		return session.selectList("mypickns.selectP"); 
	}

}
