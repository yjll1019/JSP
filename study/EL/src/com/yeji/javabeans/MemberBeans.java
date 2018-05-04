package com.yeji.javabeans;
/*
 * 작성일 : 2018년 05월 03일
 * 내 용 : 회원가입 시 정보를 저장하고 얻기 위한 자바 빈 클래스.
 */
public class MemberBeans {
	private String name;
	private String userid;
	private String nickname;
	private String pwd;
	private String email;
	private String phone;
	
	public void MemberBeans() {}	
	
	public void MemberBeans(String name, String userid) {
		this.name = name;
		this.userid = userid;
	}
	
	public String toString() {
		return "MemeberBean [name="+name+", userid="+userid+"]";
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
