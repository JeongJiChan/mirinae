package model;

import java.sql.Date;

public class Support {
	private int sup_no;
	private int m_no;
	private String sup_address;
	private String address_d;
	private String sup_tel;
	private Date sup_date;
	private String sup_name;
	private int p_no;
	private String total_price;
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
	}public String getAddress_d() {
		return address_d;
	}
	public void setAddress_d(String address_d) {
		this.address_d = address_d;
	}
	public String getSup_tel() {
		return sup_tel;
	}
	public void setSup_tel(String sup_tel) {
		this.sup_tel = sup_tel;
	}
	public Date getSup_date() {
		return sup_date;
	}
	public void setSup_date(Date sup_date) {
		this.sup_date = sup_date;
	}
	public String getSup_name() {
		return sup_name;
	}
	public void setSup_name(String sup_name) {
		this.sup_name = sup_name;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
}
