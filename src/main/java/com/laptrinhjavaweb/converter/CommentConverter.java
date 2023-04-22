package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.entity.CommentEntity;

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
		
		return result;
	}
	
}
