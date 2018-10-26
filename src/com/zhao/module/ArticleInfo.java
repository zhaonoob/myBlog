package com.zhao.module;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class ArticleInfo implements Serializable {
	private int id;
	private String title;
	private String content;
	private Timestamp pub_date;
	private String userName;
	private String articletype;
	private String avator;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getPub_date() {
		return pub_date;
	}
	public void setPub_date(Timestamp pub_date) {
		this.pub_date = pub_date;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getArticletype() {
		return articletype;
	}
	public void setArticletype(String articletype) {
		this.articletype = articletype;
	}
	public String getAvator() {
		return avator;
	}
	public void setAvator(String avator) {
		this.avator = avator;
	}
	@Override
	public String toString() {
		return "ArticleInfo [title=" + title + ", content=" + content + ", userName=" + userName + "]";
	}
	
}
