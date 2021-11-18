package model;
import java.sql.Date;
public class Member {
	private int m_no;
	private String m_id; 
	private String m_pass;
	private String m_nick;
	private String m_email;
	private String m_name;
	private String tel;
	private Date birth;
	private String address;
	private String address_d;
	private Date reg_date;
	private String del;
	
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress_d() {
		return address_d;
	}
	public void setAddress_d(String address_d) {
		this.address_d = address_d;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
}