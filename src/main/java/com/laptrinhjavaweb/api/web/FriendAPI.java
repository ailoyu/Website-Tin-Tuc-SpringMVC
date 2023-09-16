package com.laptrinhjavaweb.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.FriendshipDTO;
import com.laptrinhjavaweb.service.IFriendshipService;

@RestController(value = "friendAPIOfWeb")
public class FriendAPI {
	
	@Autowired
	private IFriendshipService friendshipService;
	
	// doPost
	@PostMapping("api/friend")
	public FriendshipDTO addFriend(@RequestBody FriendshipDTO friendshipDTO) {
		return friendshipService.addFriend(friendshipDTO);
	}
	
	// doDelete
	@DeleteMapping("api/friend")
	public FriendshipDTO unfriend(@RequestBody FriendshipDTO friendshipDTO) {
		return friendshipService.unfriend(friendshipDTO);
	}
}
