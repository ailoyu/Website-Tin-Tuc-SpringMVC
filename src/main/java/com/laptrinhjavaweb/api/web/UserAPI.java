package com.laptrinhjavaweb.api.web;

import com.laptrinhjavaweb.util.ImageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.*;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.IUserService;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import java.nio.file.Path;
import java.nio.file.Paths;

@RestController(value = "signupAPIOfWeb")
public class UserAPI {
		
	@Autowired
	private IUserService userService;
	
		// doPost
		@PostMapping("api/account")
		public UserDTO createAccount(@RequestBody UserDTO userDTO) { // khai báo để Map kiểu JSon -> kiểu NewDT
			return userService.save(userDTO);
		}
		
		@PutMapping("api/account")
		public UserDTO updateAccount(@RequestBody UserDTO userDTO) {
			return userService.update1(userDTO);
		}
		
		@PutMapping("api/password")
		public UserDTO updatePassword(@RequestBody UserDTO userDTO) {
			return userService.updatePassword(userDTO);
		}


	
}
