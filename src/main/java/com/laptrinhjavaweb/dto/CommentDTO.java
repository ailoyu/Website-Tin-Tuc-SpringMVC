package com.laptrinhjavaweb.dto;

import java.util.ArrayList;
import java.util.List;

public class CommentDTO extends AbstractDTO<CommentDTO> {

	private String content;
	
	private Long parentId;
	
	private Long userId;
		
	private Long newId;
	
	private String thumbnail;
	
	private String fullName;
	
	private String avatar;
	
	private Long postId;
	
	private List<CommentDTO> listComment = new ArrayList<CommentDTO>();
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getNewId() {
		return newId;
	}

	public void setNewId(Long newId) {
		this.newId = newId;
	}

	public List<CommentDTO> getListComment() {
		return listComment;
	}

	public void setListComment(List<CommentDTO> listComment) {
		this.listComment = listComment;
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

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public Long getPostId() {
		return postId;
	}

	public void setPostId(Long postId) {
		this.postId = postId;
	}

}
