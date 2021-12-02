package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Support;
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
	public List<Integer> op_list(int temp) {
		return session.selectList("support_listns.op_list", temp);
	}
	public String opt_name(int op_code) {
		return (String) session.selectOne("support_listns.opt_name", op_code);
	}
	public List<Integer> cnt_list(int temp) {
		return session.selectList("support_listns.cnt_list", temp);
	}
	public int price_list(int temp) {
		return (int) session.selectOne("support_listns.price_list", temp);
	}
	public List<Support> list4(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    return (List<Support>)session.selectList("support_listns.list4", hm);
	}
	public SupportList admin_oneList(int temp) {
		return (SupportList) session.selectOne("support_listns.adminSp_list", temp);
	}
}
