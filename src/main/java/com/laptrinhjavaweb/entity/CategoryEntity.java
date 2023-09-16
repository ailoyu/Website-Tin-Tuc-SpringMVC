package com.laptrinhjavaweb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class CategoryEntity extends BaseEntity {
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "code")
	private String code;
	
	// 1 thể loại có nhiều bài viết
	@OneToMany(mappedBy = "category") // Khai báo tên List category bên NewEntity
	private List<NewEntity> news = new ArrayList<NewEntity>();




	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public List<NewEntity> getNews() {
		return news;
	}

	public void setNews(List<NewEntity> news) {
		this.news = news;
	}
	
	
}
