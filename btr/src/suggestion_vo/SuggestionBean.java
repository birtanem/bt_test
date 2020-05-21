package suggestion_vo;

import java.sql.*;

public class SuggestionBean {

	private int num;
	private String id;
	private String email;
	private String subject;
	private String content;
	private Date date;
	private String check;
	
	public SuggestionBean() {}

	public SuggestionBean(int num, String id, String email, String subject, String content, Date date, String check) {
		super();
		this.num = num;
		this.id = id;
		this.email = email;
		this.subject = subject;
		this.content = content;
		this.date = date;
		this.check = check;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	
	
}