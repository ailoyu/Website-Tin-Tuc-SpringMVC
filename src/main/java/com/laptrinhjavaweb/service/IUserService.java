package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.UserDTO;

public interface IUserService {
	UserDTO save(UserDTO dto);
	UserDTO findById(Long id);
	UserDTO update(UserDTO dto);
	void delete(Long id);
	UserDTO findByUserName(String userName);
}
