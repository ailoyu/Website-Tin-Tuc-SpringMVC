package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.UserDTO;

public interface IUserService {
	UserDTO save(UserDTO dto);
	UserDTO findById(Long id);
	UserDTO update(UserDTO dto);
	void delete(Long id);
	UserDTO findByUserName(String userName);
	UserDTO update1(UserDTO dto);
	UserDTO updatePassword(UserDTO userDTO);
	UserDTO findOneByEmailAndUserName(String email, String userName);
	UserDTO update2(UserDTO dto);
}
