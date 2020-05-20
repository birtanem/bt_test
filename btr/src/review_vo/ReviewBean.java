package review_vo;

import java.sql.*;

public class ReviewBean {

	private int num;
	private String id;
	private String subject;
	private String content;
	private int readcount;
	private int likecount;
	private Date date;
	
	public ReviewBean() {}


	public ReviewBean(int num, String id, String subject, String content, int readcount, int likecount,
			Date date) {
		super();
		this.num = num;
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.readcount = readcount;
		this.likecount = likecount;
		this.date = date;
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


	public int getReadcount() {
		return readcount;
	}


	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}


	public int getLikecount() {
		return likecount;
	}


	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}	
	
}
