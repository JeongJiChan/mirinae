package model;

import java.sql.Date;

public class Cs {
	private int cs_no;
	private String cs_title;
	private String cs_content;
	private String cs_writer;
	private Date cs_reg_date;
	private int cs_view;
	private String cs_del;
	private int cs_ref;
	private int cs_re_level;
	private int cs_re_step;
	private int m_no;
	private int admin_no;
	
	
	
	public String getCs_writer() {
		return cs_writer;
	}
	public void setCs_writer(String cs_writer) {
		this.cs_writer = cs_writer;
	}
	public int getCs_ref() {
		return cs_ref;
	}
	public void setCs_ref(int cs_ref) {
		this.cs_ref = cs_ref;
	}
	public int getCs_re_level() {
		return cs_re_level;
	}
	public void setCs_re_level(int cs_re_level) {
		this.cs_re_level = cs_re_level;
	}
	public int getCs_re_step() {
		return cs_re_step;
	}
	public void setCs_re_step(int cs_re_step) {
		this.cs_re_step = cs_re_step;
	}
	public int getCs_no() {
		return cs_no;
	}
	public void setCs_no(int cs_no) {
		this.cs_no = cs_no;
	}
	public String getCs_title() {
		return cs_title;
	}
	public void setCs_title(String cs_title) {
		this.cs_title = cs_title;
	}
	public String getCs_content() {
		return cs_content;
	}
	public void setCs_content(String cs_content) {
		this.cs_content = cs_content;
	}
	public Date getCs_reg_date() {
		return cs_reg_date;
	}
	public void setCs_reg_date(Date cs_reg_date) {
		this.cs_reg_date = cs_reg_date;
	}
	public int getCs_view() {
		return cs_view;
	}
	public void setCs_view(int cs_view) {
		this.cs_view = cs_view;
	}
	public String getCs_del() {
		return cs_del;
	}
	public void setCs_del(String cs_del) {
		this.cs_del = cs_del;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getAdmin_no() {
		return admin_no;
	}
	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}
	
	
}
