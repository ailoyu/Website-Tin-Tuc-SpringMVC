package com.laptrinhjavaweb.service;

import java.util.List;

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
	void validateToChangePassword(UserDTO oldUserDTO);
	UserDTO findByIdAndVerificationCode(Long id, String token);
	void deleteTokenAndChangePasswordStatus(UserDTO dto);
	List<UserDTO> findByFullName(String userName);
	List<UserDTO> findBy9FriendList(Long id);
	List<UserDTO> findByAllFriendList(Long id);
}
