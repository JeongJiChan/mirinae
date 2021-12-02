package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Admin;
import model.Cs;
import model.Member;
import model.Project;
import model.Support;


public class CsDao {
	private static CsDao instance = new CsDao();
	private CsDao() {}
	public static CsDao getInstance() {
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
	
	// BoardMain.java : order by cs_no desc
		public List<Cs> list(int startRow, int endRow) {
			HashMap<String, Integer> hm = new HashMap<>();
		    hm.put("startRow", startRow);
		    hm.put("endRow", endRow);
		    return (List<Cs>)session.selectList("csns.list", hm);
		}
		public void readcountUpdate(int cs_no) {
			session.update("csns.readcountUpdate", cs_no);
			
		}
		public Cs select(int cs_no) {
			return (Cs) session.selectOne("csns.selectOne", cs_no);
		}
		public int getTotalB() {
			return (int) session.selectOne("csns.getTotalB");
		}
		public int insert(Cs cs) {
			return session.insert("csns.insert", cs);
		}
		public Member select2(int m_no) {
			return (Member)session.selectOne("csns.select2", m_no);
		}
		public int delete(int cs_ref) {
			return session.delete("csns.delete", cs_ref);
		}
		public int insert2(Cs cs) {
			return session.insert("csns.insert2", cs);
		}
		public Admin select3(int admin_no) {
			return (Admin)session.selectOne("csns.select3", admin_no);
		}
		public int getTotalB2(int m_no) {
			return (int) session.selectOne("csns.getTotalB2", m_no);
		}
		public List<Cs> list2(int startRow, int endRow, int m_no) {
			HashMap<String, Integer> hm = new HashMap<>();
			 hm.put("startRow", startRow);
			 hm.put("endRow", endRow);
			 hm.put("m_no", m_no);
			 return (List<Cs>)session.selectList("csns.list2", hm);
		}
		
		
		
		public int getTotalP() {
			return (int) session.selectOne("csns.getTotalP");
		}
		public int getTotalS() {
			return (int) session.selectOne("csns.getTotalS");
		}
		
		
		
}
