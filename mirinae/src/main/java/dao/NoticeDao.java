package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Notice;

public class NoticeDao {
	// single tone 생성
	private static NoticeDao instance = new NoticeDao();

	private NoticeDao() {} 

	public static NoticeDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
//			openSession(true) : 입력/삭제/수정 후에 commit
			session = ssf.openSession(true);
			reader.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
		
	
	public List<Notice> list(int startRow, int endRow) {
		HashMap<String, Integer> nl = new HashMap<>();
		nl.put("startRow", startRow);
		nl.put("endRow", endRow);
	    return session.selectList("noticens.list", nl);	
	}

	public int getTotalN() {
		return (int) session.selectOne("noticens.getTotalN");
	}

	public void viewcountUpdate(int no_no) {
		session.update("noticens.viewcountUpdate",no_no);
	}

	public Notice select(int no_no) {
		return (Notice)session.selectOne("noticens.selectOne",no_no);
	}
}