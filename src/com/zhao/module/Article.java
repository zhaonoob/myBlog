package com.zhao.module;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class Article implements Serializable {
	private int id;
	private String title;
	private String content;
	private Timestamp pub_date;
	private int user_id;
	private int articletype_id;
	
	public Article() {}
	
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
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getArticletype_id() {
		return articletype_id;
	}
	public void setArticletype_id(int articletype_id) {
		this.articletype_id = articletype_id;
	}
	
	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", content=" + content + ", pub_date=" + pub_date
				+ ", user_id=" + user_id + ", articletype_id=" + articletype_id + "]";
	}
}
