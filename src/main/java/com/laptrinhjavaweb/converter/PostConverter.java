package com.laptrinhjavaweb.converter;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.PostDTO;
import com.laptrinhjavaweb.entity.PostEntity;
import com.laptrinhjavaweb.entity.UserEntity;

@Component
public class PostConverter {
	
	
	public PostDTO toDTO(PostEntity entity) {
		
		PostDTO dto = new PostDTO();
		
		dto.setId(entity.getId());
		dto.setUserId(entity.getUser().getId());
		dto.setContent(entity.getContent());
		dto.setThumbnail(entity.getThumbnail());
		
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp valueOf = Timestamp.valueOf(sm.format(entity.getCreatedDate()));
		
		
		dto.setCreatedDate(valueOf);
		dto.setCreatedBy(entity.getCreatedBy());
		
		
		dto.setFullName(entity.getUser().getFullName());
		dto.setAvatar(entity.getUser().getAvatar());
		
		return dto;
	}
	
	
	public PostEntity toEntity(PostDTO dto) {
		
		PostEntity entity = new PostEntity();
		
		UserEntity user = new UserEntity();
		user.setId(dto.getUserId());
		
		entity.setUser(user);
		if(!dto.getThumbnail().equals("")) {
			entity.setThumbnail(dto.getThumbnail());
		}
		
		entity.setContent(dto.getContent());
		
		return entity;
		
	}
}
