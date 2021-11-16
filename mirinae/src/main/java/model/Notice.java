package model;

import java.sql.Date;

public class Notice {
	private int no_no;
	private String no_title;
	private String no_content;
	private Date no_date;
	private int no_view;
	private String no_del;
	private int admin_no;
	public int getNo_no() {
		return no_no;
	}
	public void setNo_no(int no_no) {
		this.no_no = no_no;
	}
	public String getNo_title() {
		return no_title;
	}
	public void setNo_title(String no_title) {
		this.no_title = no_title;
	}
	public String getNo_content() {
		return no_content;
	}
	public void setNo_content(String no_content) {
		this.no_content = no_content;
	}
	public Date getNo_date() {
		return no_date;
	}
	public void setNo_date(Date no_date) {
		this.no_date = no_date;
	}
	public int getNo_view() {
		return no_view;
	}
	public void setNo_view(int no_view) {
		this.no_view = no_view;
	}
	public String getNo_del() {
		return no_del;
	}
	public void setNo_del(String no_del) {
		this.no_del = no_del;
	}
	public int getAdmin_no() {
		return admin_no;
	}
	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}
}
