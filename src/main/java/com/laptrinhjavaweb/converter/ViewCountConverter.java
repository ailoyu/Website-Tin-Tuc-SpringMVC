package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.ViewCountDTO;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.entity.ViewCountEntity;

@Component
public class ViewCountConverter {

	public ViewCountEntity toEntity(ViewCountDTO viewCountDTO) {
		ViewCountEntity entity = new ViewCountEntity();
		entity.setId(viewCountDTO.getId());

		NewEntity n1 = new NewEntity();
		n1.setId(viewCountDTO.getNewId());

		UserEntity u1 = new UserEntity();
		u1.setId(viewCountDTO.getUserId());

		entity.setNewEntity(n1);
		entity.setUserEntity(u1);
		entity.setViewCount(viewCountDTO.getViewCount());

		return entity;
	}

	public ViewCountDTO toDTO(ViewCountEntity entity) {
		ViewCountDTO dto = new ViewCountDTO();
		dto.setId(entity.getId());
		dto.setNewId(entity.getNewEntity().getId());
		dto.setUserId(entity.getUserEntity().getId());
		dto.setViewCount(entity.getViewCount());
		dto.setTitle(entity.getNewEntity().getTitle());
		dto.setThumbnail(entity.getNewEntity().getThumbnail());
		dto.setShortDescription(entity.getNewEntity().getShortDescription());
		
		return dto;
	}
}
