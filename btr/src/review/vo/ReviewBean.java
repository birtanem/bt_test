package review.vo;

import java.sql.*;

public class ReviewBean {

	private int r_num;
	private String member_member_id;
	private String r_subject;
	private String r_content;
	private int r_readcount;
	private int r_likecount;
	private Date r_date;
	private String r_image;
	private int region_region_code;
	
	public ReviewBean() {}


	public ReviewBean(int num, String id, String subject, String content, int readcount, int likecount,
			Date date, String image, int region) {
		super();
		this.r_num = num;
		this.member_member_id = id;
		this.r_subject = subject;
		this.r_content = content;
		this.r_readcount = readcount;
		this.r_likecount = likecount;
		this.r_date = date;
		this.r_image = image;
		this.region_region_code = region;
		
	}


	public int getR_num() {
		return r_num;
	}


	public void setR_num(int r_num) {
		this.r_num = r_num;
	}


	public String getMember_member_id() {
		return member_member_id;
	}


	public void setMember_member_id(String member_member_id) {
		this.member_member_id = member_member_id;
	}


	public String getR_subject() {
		return r_subject;
	}


	public void setR_subject(String r_subject) {
		this.r_subject = r_subject;
	}


	public String getR_content() {
		return r_content;
	}


	public void setR_content(String r_content) {
		this.r_content = r_content;
	}


	public int getR_readcount() {
		return r_readcount;
	}


	public void setR_readcount(int r_readcount) {
		this.r_readcount = r_readcount;
	}


	public int getR_likecount() {
		return r_likecount;
	}


	public void setR_likecount(int r_likecount) {
		this.r_likecount = r_likecount;
	}


	public Date getR_date() {
		return r_date;
	}


	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}


	public String getR_image() {
		return r_image;
	}


	public void setR_image(String r_image) {
		this.r_image = r_image;
	}


	public int getRegion_region_code() {
		return region_region_code;
	}


	public void setRegion_region_code(int region_region_code) {
		this.region_region_code = region_region_code;
	}
	
}
