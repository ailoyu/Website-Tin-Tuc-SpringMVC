package com.laptrinhjavaweb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "post")
public class PostEntity extends BaseEntity {
	
	@ManyToOne(fetch = FetchType.LAZY) // Nhiều bài viết cùng 1 thể loại
	@JoinColumn(name = "user_id")
	private UserEntity user;
	
	@Column(name = "content")
	private String content;

	@Column(name = "thumbnail")
	private String thumbnail;
	
	@OneToMany(mappedBy = "posts", cascade = CascadeType.ALL) 
	private List<CommentPostEntity> commentPosts = new ArrayList<CommentPostEntity>();
	
	@OneToMany(mappedBy = "post", cascade = CascadeType.ALL) 
	private List<LikeEntity> likes = new ArrayList<LikeEntity>();
	
	
	public List<LikeEntity> getLikes() {
		return likes;
	}

	public void setLikes(List<LikeEntity> likes) {
		this.likes = likes;
	}

	public List<CommentPostEntity> getCommentPosts() {
		return commentPosts;
	}

	public void setCommentPosts(List<CommentPostEntity> commentPosts) {
		this.commentPosts = commentPosts;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
}
