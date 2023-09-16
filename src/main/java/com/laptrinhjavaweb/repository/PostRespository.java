package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.laptrinhjavaweb.entity.PostEntity;

public interface PostRespository extends JpaRepository<PostEntity, Long>{
	
	@Query(value = "SELECT * FROM post WHERE user_id = :userId ORDER BY createddate desc ", nativeQuery = true)
	List<PostEntity> getAllPostsByUserId(@Param("userId") Long id);
	
	@Query(value = "SELECT * FROM post p WHERE p.user_id IN (SELECT id FROM (SELECT requester_id, addressee_id FROM friendship \r\n"
			+ "WHERE (requester_id = :userId AND `status` = 1) OR (addressee_id = :userId AND `status` = 1))\r\n"
			+ "tbl1 JOIN `user` ON tbl1.requester_id = `user`.id OR tbl1.addressee_id = `user`.id \r\n"
			+ "WHERE `user`.id NOT LIKE :userId) ORDER BY RAND()", nativeQuery = true)
	List<PostEntity> getFriendPostForNewfeeds(@Param("userId") Long id);

}
