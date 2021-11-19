package model;

public class SupportDetail {
	private int supd_no;
	private int supd_cnt;
	private int opt_code;
	private int sup_no;
	public int getSupd_no() {
		return supd_no;
	}
	public void setSupd_no(int supd_no) {
		this.supd_no = supd_no;
	}
	public int getSupd_cnt() {
		return supd_cnt;
	}
	public void setSupd_cnt(int supd_cnt) {
		this.supd_cnt = supd_cnt;
	}
	public int getOpt_code() {
		return opt_code;
	}
	public void setOpt_code(int opt_code) {
		this.opt_code = opt_code;
	}
	public int getSup_no() {
		return sup_no;
	}
	public void setSup_no(int sup_no) {
		this.sup_no = sup_no;
	}
	@Override
	public String toString() {
		return "SupportDetail [supd_no=" + supd_no + ", supd_cnt=" + supd_cnt + ", opt_code=" + opt_code + ", sup_no="
				+ sup_no + "]";
	}
	
}
