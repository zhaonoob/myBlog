package com.zhao.module;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class ArticleInfo implements Serializable {
	private String title;
	private String content;
	private Timestamp pub_date;
	private String userName;
	private String articletype;
}
