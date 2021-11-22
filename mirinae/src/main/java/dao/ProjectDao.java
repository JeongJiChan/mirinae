package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Project;

public class ProjectDao {
	private static ProjectDao instance = new ProjectDao();
	private ProjectDao () {}
	public static ProjectDao getInstance() {
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
	public int insert(Project project) {
		return session.insert("projectns.insert",project);
	}
	public int find_p_no() {
		return (int) session.selectOne("projectns.select");
	}
	public List<Project> selectList() { 
		return session.selectList("projectns.selectList"); 
	}


	
	
}
