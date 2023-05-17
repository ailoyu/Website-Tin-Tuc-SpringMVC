package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.entity.CommentEntity;

import java.sql.Timestamp;

@Component
public class CommentConverter {
	
	public CommentEntity toEntity(CommentDTO dto) {
		CommentEntity result = new CommentEntity();

		result.setId(dto.getId());
		result.setContent(dto.getContent());
		result.setParentId(dto.getParentId());

		return result;
	}
	
	public CommentDTO toDTO(CommentEntity dto) {
		CommentDTO result = new CommentDTO();
		
		result.setId(dto.getId());
		result.setContent(dto.getContent());
		result.setParentId(dto.getParentId());
		result.setFullName(dto.getUser().getFullName());
		result.setUserId(dto.getUser().getId());
		result.setNewId(dto.getNews().getId());
		result.setAvatar(dto.getUser().getAvatar());
		Timestamp ts = new Timestamp(dto.getCreatedDate().getTime());
		result.setCreatedDate(ts);
		
		return result;
	}
	
}
