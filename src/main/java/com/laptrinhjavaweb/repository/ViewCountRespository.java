package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.laptrinhjavaweb.entity.ViewCountEntity;

public interface ViewCountRespository extends JpaRepository<ViewCountEntity, Long> {
	
	
	@Query(value = "SELECT * FROM views v INNER JOIN `new` n ON v.new_id = n.id WHERE v.user_id = :userId ORDER BY RAND() LIMIT 3", nativeQuery = true)
	List<ViewCountEntity> recommendForUser(@Param("userId") Long userId);
	
}
