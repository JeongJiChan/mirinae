package dao;

import java.io.Reader;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.SupportDetail;

public class SupportDetailDao {
	private static SupportDetailDao instance = new SupportDetailDao();
	private SupportDetailDao() {}
	public static SupportDetailDao getInstance() {
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
	public int setSupd_no() {
		return (int) session.selectOne("support_detailns.setSupd_no");
	}
	public int insert(SupportDetail detail) {
		return session.insert("support_detailns.insert", detail);		
	}
	public int insert_price(int p_no, int total_priceInt) {
		int result = 0;
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("p_no", p_no);
		data.put("total_price", total_priceInt);
		result = session.insert("support_detailns.insert_price", data);
		session.commit();
		return result;
	}
	public int delete(int sup_no) {
		return session.update("support_detailns.delete", sup_no);
	}
	public int p_del(int p_no, int total_price) {
		int result = 0;
		HashMap<String, Integer> del_data = new HashMap<String, Integer>();
		del_data.put("p_no", p_no);
		del_data.put("total_price", total_price);
		result = session.update("support_detailns.p_del", del_data);
		session.commit();
		return result;
	}
}
