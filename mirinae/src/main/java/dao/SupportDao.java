package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Project;
import model.Support;
import service.support.SupportList;

public class SupportDao {
	private static SupportDao instance = new SupportDao();
	private SupportDao() {}
	public static SupportDao getInstance() {
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
	public int setSup_no() {
		return (int) session.selectOne("supportns.setSup_no");
	}
	public String getP_name(int p_no) {
		return (String) session.selectOne("supportns.getP_name", p_no);
	}	
	public int insert(Support support) {
		return session.insert("supportns.insert", support);
	}
	public int setM_no(String id) {
		return (int) session.selectOne("supportns.setM_no", id);
	}
	public int getTotalN(int m_no) {
		return (int) session.selectOne("supportns.getTotalN", m_no);
	}
	public List<Integer> getSup_no(int m_no) {
		return session.selectList("supportns.getSup_no", m_no);
	}
	public List<Support> s_list(int startRow, int endRow, int m_no) {
		HashMap<String, Integer> sl = new HashMap<>();
		sl.put("startRow", startRow);
		sl.put("endRow", endRow);
		sl.put("m_no", m_no);
		return session.selectList("supportns.s_list", sl);
	}
	public Support select(int sup_no) {
		return (Support) session.selectOne("supportns.select", sup_no);
	}
}
