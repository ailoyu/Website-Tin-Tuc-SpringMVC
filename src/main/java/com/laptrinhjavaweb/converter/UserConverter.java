package com.laptrinhjavaweb.converter;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
		result.setToken(dto.getToken());
		result.setValidTime(dto.getValidTime());
		result.setEmailReceived(dto.getEmailReceived());
		result.setAvatar(dto.getAvatar());
		result.setChangePasswordStatus(dto.getChangePasswordStatus());
		
		return result;
	}
	
	public UserDTO toDTO(UserEntity dto) {
		UserDTO result = new UserDTO();
		
		if(dto.getId() != null) {
			result.setId(dto.getId());
		}
		result.setFullName(dto.getFullName());
		result.setPassword(dto.getPassword());
		result.setUserName(dto.getUserName());
		result.setEmail(dto.getEmail());
		result.setStatus(dto.getStatus());
		result.setToken(dto.getToken());
		if(dto.getValidTime() != null) {
			SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Timestamp valueOf = Timestamp.valueOf(sm.format(dto.getValidTime()));
			result.setValidTime(valueOf);
		}
		Timestamp ts = new Timestamp(dto.getCreatedDate().getTime());
		result.setCreatedDate(ts);
		result.setEmailReceived(dto.getEmailReceived());
		result.setAvatar(dto.getAvatar());
		result.setChangePasswordStatus(dto.getChangePasswordStatus());
		return result;
	}
	
}
