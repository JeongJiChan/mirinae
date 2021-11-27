package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

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

	// 세션 id를 받아 m_no 조회
	public int m_no(String m_id) {
		return (int)session.selectOne("mypickns.selectM_no",m_id);
	}

	// 마이픽한 프로젝트 조회
	public List<Mypick> my_list(int m_no, int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("m_no", m_no);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("mypickns.myList", hm);
		
	}

	public int delete(int p_no, String id) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("p_no", p_no);
		hm.put("id", id);
		return (int)session.delete("mypickns.mydelete", hm);
	}

	public int insert(int p_no, String id) {
		HashMap<String,Object> hm = new HashMap<String, Object>();
		hm.put("p_no",p_no);
		hm.put("id", id);
		return (int)session.insert("mypickns.myinsert", hm);
	}

	public int count(String id, int p_no) {
		HashMap<String,Object> hm = new HashMap<String, Object>();
		hm.put("p_no",p_no);
		hm.put("id", id);
		return (int)session.selectOne("mypickns.countMypick", hm);
	}
	
}
