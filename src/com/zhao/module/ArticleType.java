package com.zhao.module;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ArticleType implements Serializable {
	private int id;
	private String articletype;
	public ArticleType() {}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getArticletype() {
		return articletype;
	}
	public void setArticletype(String articletype) {
		this.articletype = articletype;
	}
}
