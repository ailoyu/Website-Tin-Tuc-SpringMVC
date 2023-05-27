package com.laptrinhjavaweb.dto;

import java.util.List;

public class PostDTO extends AbstractDTO<PostDTO> {
	
	private Long userId;
	private String thumbnail;
	private String content;
	private List<CommentDTO> comments;
	private List<LikeDTO> likes;
	private Boolean liked;
	private String fullName;
	private String avatar;
	
	
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<CommentDTO> getComments() {
		return comments;
	}
	public void setComments(List<CommentDTO> comments) {
		this.comments = comments;
	}

	public List<LikeDTO> getLikes() {
		return likes;
	}

	public void setLikes(List<LikeDTO> likes) {
		this.likes = likes;
	}

	public Boolean getLiked() {
		return liked;
	}
	public void setLiked(Boolean liked) {
		this.liked = liked;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	
}
