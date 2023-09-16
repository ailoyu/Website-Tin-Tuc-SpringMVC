package com.laptrinhjavaweb.converter;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.entity.CommentPostEntity;

@Component
public class CommentPostConverter {
	
	public CommentDTO toDTO(CommentPostEntity dto) {
		CommentDTO result = new CommentDTO();
		
		result.setId(dto.getId());
		result.setContent(dto.getContent());
		result.setParentId(dto.getParentId());
		result.setFullName(dto.getUser().getFullName());
		result.setUserId(dto.getUser().getId());
		result.setPostId(dto.getPosts().getId());
		result.setAvatar(dto.getUser().getAvatar());
		result.setThumbnail(dto.getThumbnail());
		Timestamp ts = new Timestamp(dto.getCreatedDate().getTime());
		result.setCreatedDate(ts);
		
		return result;
	}
}
