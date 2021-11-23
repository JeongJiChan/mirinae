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
		return (Member)session.selectOne("memberns.select",id);
	}
	public Member nick_Chk(String nick) {
		return (Member)session.selectOne("memberns.nick_Chk",nick);
	}
	public int insert(Member member) {
		return session.insert("memberns.insert", member);
	}
	public Member ud_nick_Chk(String nick) {
		return (Member)session.selectOne("memberns.ud_nick_Chk",nick);
	}
	public int update(Member member) {
		return session.update("memberns.update", member);
	}
	
//	public int delete(String id) {
//		return session.update("memberns.delete", id);
//	}
}
