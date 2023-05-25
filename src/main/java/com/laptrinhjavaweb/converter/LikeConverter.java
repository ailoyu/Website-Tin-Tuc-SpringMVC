package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.LikeDTO;
import com.laptrinhjavaweb.entity.LikeEntity;

@Component
public class LikeConverter {
	
	public LikeDTO toDTO(LikeEntity entity) {
		LikeDTO dto = new LikeDTO();
		dto.setId(entity.getId());
		dto.setUserId(entity.getUser().getId());
		dto.setPostId(entity.getPost().getId());
		dto.setStatus(entity.getStatus());
		return dto;
	}
}
