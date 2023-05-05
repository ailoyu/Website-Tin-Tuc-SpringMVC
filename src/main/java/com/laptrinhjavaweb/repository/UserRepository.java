package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
	UserEntity findOneByUserNameAndStatus(String username, int status);
	UserEntity findOneByUserName(String username);
	UserEntity findOneByEmailAndUserName(String email, String username);
	UserEntity findOneByIdAndVerificationCode(Long id, String token);
}
