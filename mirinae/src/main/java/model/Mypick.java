package model;

import java.sql.Date;

public class Mypick {
	private int m_no;
	private int p_no;
	private int cate_code;
	private String p_name;
	private String p_content;
	private Date s_date;
	private Date e_date;
	private int goal_money;
	private int cur_money;
	
	public int getCate_code() {
		return cate_code;
	}
	public void setCate_code(int cate_code) {
		this.cate_code = cate_code;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	public Date getE_date() {
		return e_date;
	}
	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}
	public int getGoal_money() {
		return goal_money;
	}
	public void setGoal_money(int goal_money) {
		this.goal_money = goal_money;
	}
	public int getCur_money() {
		return cur_money;
	}
	public void setCur_money(int cur_money) {
		this.cur_money = cur_money;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	
}
