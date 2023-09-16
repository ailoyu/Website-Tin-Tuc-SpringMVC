package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.FriendshipDTO;

public interface IFriendshipService {
	FriendshipDTO addFriend(FriendshipDTO dto);
	FriendshipDTO findByRequesterIdAndAddresseeId(Long requesterId, Long addresseeId);
	FriendshipDTO unfriend(FriendshipDTO friendshipDTO);
}
