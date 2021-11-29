package model;

import java.sql.Date;

public class Project {
    private int p_no;
    private int cate_code;
    private String p_name;
    private String p_content;
    private String p_writer;
    private Date s_date;
    private Date e_date;
    private int goal_money;
    private int p_view;
    private String p_del;
    private Date reg_date;
    private int cur_money;
    private String m_id;
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
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
	public String getP_writer() {
		return p_writer;
	}
	public void setP_writer(String p_writer) {
		this.p_writer = p_writer;
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
	public int getP_view() {
		return p_view;
	}
	public void setP_view(int p_view) {
		this.p_view = p_view;
	}
	public String getP_del() {
		return p_del;
	}
	public void setP_del(String p_del) {
		this.p_del = p_del;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getCur_money() {
		return cur_money;
	}
	public void setCur_money(int cur_money) {
		this.cur_money = cur_money;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	@Override
	public String toString() {
		return "Project [p_no=" + p_no + ", cate_code=" + cate_code + ", p_name=" + p_name + ", p_content=" + p_content
				+ ", p_writer=" + p_writer + ", s_date=" + s_date + ", e_date=" + e_date + ", goal_money=" + goal_money
				+ ", p_view=" + p_view + ", p_del=" + p_del + ", reg_date=" + reg_date + ", cur_money=" + cur_money
				+ ", m_id=" + m_id + "]";
	}
    

   
}
