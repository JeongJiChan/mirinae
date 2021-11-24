package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

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
	
	// 아이디 중복체크, m_id를 가지고 member 조회
	public Member select(String id) {
		return (Member)session.selectOne("memberns.select",id);
	}
	
	// 닉네임 중복체크, m_nick를 가지고 member 조회
	public Member nick_Chk(String nick) {
		return (Member)session.selectOne("memberns.nick_Chk",nick);
	}
	
	// 회원가입 성공하면 데이터 입력
	public int insert(Member member) {
		return session.insert("memberns.insert", member);
	}
	
	// 회원수정 닉네임 중복체크, m_nick를 가지고 member 조회
	public String ud_nick_Chk(String nick) {
		return (String)session.selectOne("memberns.ud_nick_Chk",nick);
	}
	
	// 회원정보 수정, m_id를 가지고 member 조회
	public int update(Member member) {
		return session.update("memberns.update", member);
	}
	
	// 회원탈퇴, m_id를 가지고 member 테이블에 있는 del을 y로 바꾸고 삭제한거처럼 처리
	public int delete(String id) {
		System.out.println(id);
		return session.update("memberns.delete", id);
	}
	
	// 테이블에 저장되어 있는 총 회원수
	public int getTotal() {
		return (int)session.selectOne("memberns.getTotal");
	}
	
	// 전체 회원정보 조회
	public List<Member> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return (List<Member>)session.selectList("memberns.list",hm);
	}
}