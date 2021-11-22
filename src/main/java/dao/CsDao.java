package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Cs;


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
		
}
