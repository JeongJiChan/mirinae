package dao;

import java.io.Reader;
import model.Member;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MemberDao {
	// singleton
	private static MemberDao instance = new MemberDao();
	private MemberDao() { }
	public static MemberDao getInstance() {
		return instance;
	}
	// database connection pool
	private static SqlSession session;
	static {  // 초기화 블록
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch(Exception e) {
			System.out.println("연결에러 : " + e.getMessage());
		}
	}
	public Member select(String id) {
		System.out.println("id:"+id);
		// selectOne는 데이터 한건 조회, selectList는 여러건 조회
		return (Member)session.selectOne("memberns.select",id);
	}
//	public int insert(Member member) {
//		return session.insert("memberns.insert", member);
//	}
//	public int update(Member member) {
//		return session.update("memberns.update", member);
//	}
//	public int delete(String id) {
//		return session.update("memberns.delete", id);
//	}
}
