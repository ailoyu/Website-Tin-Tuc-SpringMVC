package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.LikeEntity;
import com.laptrinhjavaweb.entity.PostEntity;
import com.laptrinhjavaweb.entity.UserEntity;

public interface LikeRespository extends JpaRepository<LikeEntity, Long> {
	
	List<LikeEntity> findByUserAndStatus(UserEntity user, String status);
	
	LikeEntity findOneByUserAndPost(UserEntity user, PostEntity post);
	

}
