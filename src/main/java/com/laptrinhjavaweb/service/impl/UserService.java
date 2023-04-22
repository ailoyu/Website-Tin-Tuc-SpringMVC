package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.UserConverter;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IUserService;

@Service // khai báo để AutoWired cho service
public class UserService implements IUserService{
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserConverter userConverter;
	
	@Bean
	public PasswordEncoder encoder() {
	    return new BCryptPasswordEncoder();
	}
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public UserDTO save(UserDTO userDTO) {
		userDTO.setStatus(1);
		System.out.println("Thêm thành công");
		userDTO.setPassword(passwordEncoder.encode(userDTO.getPassword()));
		UserEntity userEntity = userConverter.toEntity(userDTO);
		
		RoleEntity r1 = new RoleEntity();
		r1.setId(2L); // set role là Nhân Viên
		
		List<RoleEntity> role = new ArrayList<RoleEntity>();
		role.add(r1);
		
		userEntity.setRoles(role);
		return userConverter.toDTO(userRepository.save(userEntity));
	}

}
