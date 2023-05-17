package com.laptrinhjavaweb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.FriendshipConverter;
import com.laptrinhjavaweb.dto.FriendshipDTO;
import com.laptrinhjavaweb.entity.FriendshipEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.FriendshipRespository;
import com.laptrinhjavaweb.service.IFriendshipService;

@Service
public class FriendshipService implements IFriendshipService {

	@Autowired
	private FriendshipRespository friendshipRespository;
	
	@Autowired
	private FriendshipConverter friendshipConverter;
	
	@Override
	public FriendshipDTO addFriend(FriendshipDTO dto) {
		
		UserEntity requester = new UserEntity();
		requester.setId(dto.getRequesterId());
		
		UserEntity addressee = new UserEntity();
		addressee.setId(dto.getAddresseeId());
		
		FriendshipEntity find = friendshipRespository.findOneByRequesterAndAddressee(requester, addressee);
		
		if(dto.getStatus() == null && find == null) {
			FriendshipEntity entity = new FriendshipEntity();
			
			entity.setAddressee(addressee);
			entity.setRequester(requester);
			entity.setStatus(false);
			
			return friendshipConverter.toDTO(friendshipRespository.save(entity));
		} else if(dto.getStatus() == null && find != null) {
			friendshipRespository.delete(find);
			return friendshipConverter.toDTO(find);
		}
		
		if(dto.getStatus() == true) {
			FriendshipEntity friend = friendshipRespository.findOneByRequesterAndAddressee(requester, addressee);
			friend.setStatus(true);
			return friendshipConverter.toDTO(friendshipRespository.save(friend)); 
		}  
		
		return null;
		
	}

	@Override
	public FriendshipDTO findByRequesterIdAndAddresseeId(Long requesterId, Long addresseeId) {
		UserEntity requester = new UserEntity();
		requester.setId(requesterId);
		
		UserEntity addressee = new UserEntity();
		addressee.setId(addresseeId);
		
		FriendshipEntity friend = friendshipRespository.findOneByRequesterAndAddressee(requester, addressee);
		if(friend != null) {
			return friendshipConverter.toDTO(friend);
		} else {
			return null;
		}
		
	}

	@Override
	public FriendshipDTO unfriend(FriendshipDTO friendshipDTO) {
		UserEntity requester = new UserEntity();
		requester.setId(friendshipDTO.getRequesterId());
		
		UserEntity addressee = new UserEntity();
		addressee.setId(friendshipDTO.getAddresseeId());
		
		FriendshipEntity friend = friendshipRespository.findOneByRequesterAndAddressee(requester, addressee);
		if(friend == null) {
			friend = friendshipRespository.findOneByRequesterAndAddressee(addressee, requester);
			if(friend == null) {
				return null;
			} else {
				friendshipRespository.delete(friend);
				return friendshipConverter.toDTO(friend);
			}
		} else {
			friendshipRespository.delete(friend);
			return friendshipConverter.toDTO(friend);
		}
	}

}
