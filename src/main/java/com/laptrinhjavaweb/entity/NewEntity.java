package com.laptrinhjavaweb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "new")
public class NewEntity extends BaseEntity{
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "thumbnail")
	private String thumbnail;
	
	@Column(name = "shortdescription", columnDefinition = "TEXT") // Kiểu dữ liệu là TEXT
	private String shortDescription;
	
	@Column(name = "content", columnDefinition = "TEXT") // Kiểu dữ liệu là TEXT
	private String content;
	
	@ManyToOne(fetch = FetchType.LAZY) // Nhiều bài viết cùng 1 thể loại
	@JoinColumn(name = "category_id")
	private CategoryEntity category;
	
	@OneToMany(mappedBy = "news", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<CommentEntity> comments = new ArrayList<CommentEntity>();

	@OneToMany(mappedBy = "newEntity",cascade = CascadeType.ALL)
	private List<ViewCountEntity> views;
	


	public List<ViewCountEntity> getViews() {
		return views;
	}

	public void setViews(List<ViewCountEntity> views) {
		this.views = views;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public CategoryEntity getCategory() {
		return category;
	}

	public void setCategory(CategoryEntity category) {
		this.category = category;
	}

	public List<CommentEntity> getComments() {
		return comments;
	}

	public void setComments(List<CommentEntity> comments) {
		this.comments = comments;
	}

}
