package com.laptrinhjavaweb.dto;

import java.util.ArrayList;
import java.util.List;

import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.entity.UserEntity;

public class CommentDTO extends AbstractDTO<CommentDTO> {

	private String content;
	
	private Integer parentId;
	
	private Long userId;
		
	private Long newId;
	
	private String fullName;
	
	private List<CommentDTO> listComment = new ArrayList<CommentDTO>();
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
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

	

	
}
