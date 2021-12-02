package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.SupportList;
import service.support.SupportListAll;

public class SupportListDao {
	private static SupportListDao instance = new SupportListDao();
	private SupportListDao() {}
	public static SupportListDao getInstance() {
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
	public List<SupportList> list(int temp) {
		return session.selectList("support_listns.sp_list", temp);
	}
	public SupportList oneList(int temp) {
		return (SupportList) session.selectOne("support_listns.sp_list", temp);
	}
	public int delete_s(int sup_no) {
		return session.update("support_listns.delete_s", sup_no);
	}
	public int delete_sd(int sup_no) {
		return session.update("support_listns.delete_sd", sup_no);
	}
	public int p_del(int p_no, int total_price) {
		int result = 0;
		HashMap<String, Integer> del_data = new HashMap<String, Integer>();
		del_data.put("p_no", p_no);
		del_data.put("total_price", total_price);
		result = session.update("support_listns.p_del", del_data);
		session.commit();
		return result;
	}
}
