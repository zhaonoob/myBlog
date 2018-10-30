package com.zhao.module;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class CommentInfo implements Serializable {
	private int article_id;
	private int comment_id;
	private String avator;
	private String userName;
	private Timestamp comment_date;
	private String content;
	private String title;

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

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
