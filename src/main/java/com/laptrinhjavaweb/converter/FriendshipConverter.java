package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.FriendshipDTO;
import com.laptrinhjavaweb.entity.FriendshipEntity;

@Component
public class FriendshipConverter {
	
	public FriendshipDTO toDTO(FriendshipEntity entity) {
		FriendshipDTO dto = new FriendshipDTO();
		dto.setAddresseeId(entity.getAddressee().getId());
		dto.setRequesterId(entity.getRequester().getId());
		dto.setStatus(entity.getStatus());
		
		return dto;
	}
	
}
