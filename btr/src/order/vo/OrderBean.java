package order.vo;

import java.sql.Date;

public class OrderBean {
	private int o_num;
	private int o_p_num;
	private String o_p_name;
	private int o_p_amount;
	private String o_m_id;
	private String o_recieve_name;
	private String o_recieve_addr1;
	private String o_recieve_addr2;
	private String o_recieve_phone;
	private String o_memo;
	private int o_sum_money;
	private String o_trade_type;
	private Date date;
//	private int o_status; // 주문번호 넣을곳이 없어서 잠깐 주석처리
	private long o_status; // 주문번호 넣을곳으로 임시 사용 
	
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public int getO_p_num() {
		return o_p_num;
	}
	public void setO_p_num(int o_p_num) {
		this.o_p_num = o_p_num;
	}
	public String getO_p_name() {
		return o_p_name;
	}
	public void setO_p_name(String o_p_name) {
		this.o_p_name = o_p_name;
	}
	public int getO_p_amount() {
		return o_p_amount;
	}
	public void setO_p_amount(int o_p_amount) {
		this.o_p_amount = o_p_amount;
	}
	public String getO_m_id() {
		return o_m_id;
	}
	public void setO_m_id(String o_m_id) {
		this.o_m_id = o_m_id;
	}
	public String getO_recieve_name() {
		return o_recieve_name;
	}
	public void setO_recieve_name(String o_recieve_name) {
		this.o_recieve_name = o_recieve_name;
	}
	public String getO_recieve_addr1() {
		return o_recieve_addr1;
	}
	public void setO_recieve_addr1(String o_recieve_addr1) {
		this.o_recieve_addr1 = o_recieve_addr1;
	}
	public String getO_recieve_addr2() {
		return o_recieve_addr2;
	}
	public void setO_recieve_addr2(String o_recieve_addr2) {
		this.o_recieve_addr2 = o_recieve_addr2;
	}
	public String getO_recieve_phone() {
		return o_recieve_phone;
	}
	public void setO_recieve_phone(String o_recieve_phone) {
		this.o_recieve_phone = o_recieve_phone;
	}
	public String getO_memo() {
		return o_memo;
	}
	public void setO_memo(String o_memo) {
		this.o_memo = o_memo;
	}
	public int getO_sum_money() {
		return o_sum_money;
	}
	public void setO_sum_money(int o_sum_money) {
		this.o_sum_money = o_sum_money;
	}
	public String getO_trade_type() {
		return o_trade_type;
	}
	public void setO_trade_type(String o_trade_type) {
		this.o_trade_type = o_trade_type;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
//	public int getO_status() {
//		return o_status;
//	}
//	public void setO_status(int o_status) {
//		this.o_status = o_status;
//	}
	public long getO_status() {
		return o_status;
	}
	public void setO_status(long o_status) {
		this.o_status = o_status;
	}
	
	
	



}
