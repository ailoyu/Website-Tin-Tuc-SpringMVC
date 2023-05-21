package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.laptrinhjavaweb.entity.PostEntity;

public interface PostRespository extends JpaRepository<PostEntity, Long>{
	
	@Query(value = "SELECT * FROM post WHERE user_id = :userId ORDER BY createddate desc ", nativeQuery = true)
	List<PostEntity> getAllPostsById(@Param("userId") Long id);
	

}
