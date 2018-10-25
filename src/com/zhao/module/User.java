package com.zhao.module;

public class User {
	private String userName;
	private String pwd;
	private String email;
	private String phone;
	private String qq;
	private String info;
	
	public User() {}
	
	public User(String name,String pwd,String email) {
		this.userName = name;
		this.pwd = pwd;
		this.email = email;
	}
	
	public User(String name,String pwd,String email,String phone,String qq,String info) {
		this.userName = name;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.qq = qq;
		this.info = info;
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
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}	
	@Override
	public String toString() {
		return "User [userName=" + userName + ", pwd=" + pwd + "]";
	}
}
