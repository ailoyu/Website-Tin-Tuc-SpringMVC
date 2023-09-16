package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// Chỉ cần username, vì password xử lý ngầm
		UserEntity userEntity = userRepository.findOneByUserNameAndStatus(username, 1);
		
		// Authentication
		if(userEntity == null) { // Đăng nhập thất bại (username or password sai!)
			return null;
		}else { // Authorization
			// Lấy role của userEntity add vào authorities	
			List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
			for(RoleEntity role : userEntity.getRoles()) {
				authorities.add(new SimpleGrantedAuthority(role.getCode()));
			}
			// Sau khi đăng nhập thành công
			// put thông tin user vào trong security (session) -> để duy trì thông tin user khi login vào hệ thống
			
//			User user = new User(userEntity.getUserName(), userEntity.getPassword(),
//					true, true, true, true, authorities);
			
			MyUser myUser = new MyUser(userEntity.getUserName(), userEntity.getPassword(),
								true, true, true, true, authorities);
			myUser.setId(userEntity.getId());
			myUser.setFullName(userEntity.getFullName());
			myUser.setEmail(userEntity.getEmail());
			myUser.setPassword(userEntity.getPassword());
			myUser.setUsername(userEntity.getUserName());
			myUser.setStatus(userEntity.getStatus());
			myUser.setAvatar(userEntity.getAvatar());
			
			return myUser;//MyUser extends User(mà User implement UserDetails)=> myUser cx thuộc kiểu UserDetails
		}
	} 

}
