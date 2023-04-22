package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.UserEntity;

@Component
public class UserConverter {
	
	public UserEntity toEntity(UserDTO dto) {
		UserEntity result = new UserEntity();
		
		result.setFullName(dto.getFullName());
		result.setPassword(dto.getPassword());
		result.setUserName(dto.getUserName());
		result.setEmail(dto.getEmail());
		result.setStatus(dto.getStatus());
		
		
		return result;
	}
	
	public UserDTO toDTO(UserEntity dto) {
		UserDTO result = new UserDTO();
		
		result.setFullName(dto.getFullName());
		result.setPassword(dto.getPassword());
		result.setUserName(dto.getUserName());
		result.setEmail(dto.getEmail());
		result.setStatus(dto.getStatus());
		
		
		return result;
	}
	
}
