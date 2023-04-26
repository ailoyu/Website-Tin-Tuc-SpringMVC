package com.laptrinhjavaweb.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.IUserService;

@RestController(value = "signupAPIOfWeb")
public class SignupAPI {
		
	@Autowired
	private IUserService userService;
	
		// doPost
		@PostMapping("api/account")
		public UserDTO createAccount(@RequestBody UserDTO userDTO) { // khai báo để Map kiểu JSon -> kiểu NewDT
			return userService.save(userDTO);
		}
	
}
