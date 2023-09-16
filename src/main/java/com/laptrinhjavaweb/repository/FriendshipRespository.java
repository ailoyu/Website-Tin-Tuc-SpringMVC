package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.FriendshipEntity;
import com.laptrinhjavaweb.entity.UserEntity;

public interface FriendshipRespository extends JpaRepository<FriendshipEntity, Long> {
	FriendshipEntity findOneByRequesterAndAddressee(UserEntity requester, UserEntity addressee);
}
