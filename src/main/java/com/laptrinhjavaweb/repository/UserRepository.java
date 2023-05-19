package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.laptrinhjavaweb.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
	UserEntity findOneByUserNameAndStatus(String username, int status);
	UserEntity findOneByUserName(String username);
	UserEntity findOneByEmailAndUserName(String email, String username);
	UserEntity findOneByIdAndToken(Long id, String token);
	
	@Query(value = "SELECT * from `user` u WHERE u.fullname LIKE %:key% ", nativeQuery = true)
	List<UserEntity> findByFullName(@Param("key") String key);
	
	@Query(value = "SELECT `user`.* FROM (SELECT requester_id, addressee_id FROM friendship \r\n"
			+ "WHERE (requester_id = :userId AND `status` = 1) OR (addressee_id = :userId AND `status` = 1)\r\n"
			+ "ORDER BY RAND() LIMIT 9) tbl1 JOIN `user` \r\n"
			+ "ON tbl1.requester_id = `user`.id OR tbl1.addressee_id = `user`.id \r\n"
			+ "WHERE `user`.id NOT LIKE :userId", nativeQuery = true)
	List<UserEntity> findBy9ListFriend(@Param("userId") Long id);
	
	@Query(value = "SELECT `user`.* FROM (SELECT requester_id, addressee_id FROM friendship \r\n"
			+ "WHERE (requester_id = :userId AND `status` = 1) OR (addressee_id = :userId AND `status` = 1))\r\n"
			+ " tbl1 JOIN `user` \r\n"
			+ "ON tbl1.requester_id = `user`.id OR tbl1.addressee_id = `user`.id \r\n"
			+ "WHERE `user`.id NOT LIKE :userId ORDER BY `user`.fullname asc", nativeQuery = true)
	List<UserEntity> findByListFriend(@Param("userId")Long id);
	
	
}
