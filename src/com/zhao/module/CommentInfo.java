package com.zhao.module;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class CommentInfo implements Serializable {
	private String avator;
	private String userName;
	private Timestamp comment_date;
	private String content;
	public String getAvator() {
		return avator;
	}
	public void setAvator(String avator) {
		this.avator = avator;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Timestamp getComment_date() {
		return comment_date;
	}
	public void setComment_date(Timestamp comment_date) {
		this.comment_date = comment_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "CommentInfo [avator=" + avator + ", userName=" + userName + ", comment_date=" + comment_date
				+ ", content=" + content + "]";
	}
	
}
