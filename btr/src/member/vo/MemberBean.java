package member.vo;

import java.sql.Timestamp;

public class MemberBean {

	
	private String id;
	private String pass1;
	private String pass2;
	private String email;
	private String tel;
	private String hobby;
	private String job;
	private String age;
	private Timestamp date;
	private int point;
	private int cp_3;
	private int cp_5;
	private int cp_10;
	
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass1() {
		return pass1;
	}
	public void setPass1(String pass1) {
		this.pass1 = pass1;
	}
	public String getPass2() {
		return pass2;
	}
	public void setPass2(String pass2) {
		this.pass2 = pass2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getInfo() {
		return Info;
	}
	public void setInfo(String info) {
		Info = info;
	}
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getCp_3() {
		return cp_3;
	}
	public void setCp_3(int cp_3) {
		this.cp_3 = cp_3;
	}
	public int getCp_5() {
		return cp_5;
	}
	public void setCp_5(int cp_5) {
		this.cp_5 = cp_5;
	}
	public int getCp_10() {
		return cp_10;
	}
	public void setCp_10(int cp_10) {
		this.cp_10 = cp_10;
	}
	private String Info;
	
	
}