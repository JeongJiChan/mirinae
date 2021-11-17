package model;

import java.sql.Date;

public class Support {
	private int sup_no;
	private int m_no;
	private String sup_address;
	private int sub_tel;
	private Date sup_date;
	public int getSup_no() {
		return sup_no;
	}
	public void setSup_no(int sup_no) {
		this.sup_no = sup_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getSup_address() {
		return sup_address;
	}
	public void setSup_address(String sup_address) {
		this.sup_address = sup_address;
	}
	public int getSub_tel() {
		return sub_tel;
	}
	public void setSub_tel(int sub_tel) {
		this.sub_tel = sub_tel;
	}
	public Date getSup_date() {
		return sup_date;
	}
	public void setSup_date(Date sup_date) {
		this.sup_date = sup_date;
	}
}
