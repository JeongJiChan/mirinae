package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Notice;
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
		System.out.println(project);
		int result = session.insert("projectns.insert",project);
		session.commit();
		return result;
	}
	public int find_p_no() {
		return (int) session.selectOne("projectns.find_p_no");
	}
	public int getTotal() {
		return (int) session.selectOne("projectns.getTotal");
	}
	public List<Project> list(int startRow, int endRow) {
		HashMap<String, Integer> pro = new HashMap<>();
		pro.put("startRow", startRow);
		pro.put("endRow", endRow);
	    return (List<Project>)session.selectList("projectns.list", pro);	
	}
	public List<Project> list(int startRow, int endRow, int cate_code) {
		HashMap<String, Integer> pro = new HashMap<>();
		pro.put("startRow", startRow);
		pro.put("endRow", endRow);
		pro.put("cate_code", cate_code);
	    return (List<Project>)session.selectList("projectns.catelist", pro);	
	}
	public Project proview(int p_no) {
		return (Project)session.selectOne("projectns.proview", p_no);
	}
	public void p_viewUpload(int p_no) {
		session.update("projectns.p_viewupdate", p_no);	
	}
	public int getTotal(int cate_code) {
		return (int) session.selectOne("projectns.categetTotal",cate_code);
	}
	public int delete(int p_no) {
		return (int)session.update("projectns.prodel", p_no);
	}
	public int update(Project project) {
		return session.update("projectns.proupdate", project);
	}
	public List<Project> list2(int startRow, int endRow, String search) {
		HashMap<String, Object> pro = new HashMap<>();
		pro.put("startRow", startRow);
		pro.put("endRow", endRow);
		pro.put("search", search);
	    return (List<Project>)session.selectList("projectns.list2", pro);		
	}
	public int hot_select(int rn) {
		return (int) session.selectOne("projectns.hotselect", rn);
	}
	public int getTotal2() {
		return (int) session.selectOne("projectns.getTotal2");
	}
	
	public List<Project> my_projectList(String id) {
		return (List<Project>)session.selectList("projectns.myprojectList", id);
	}

}
