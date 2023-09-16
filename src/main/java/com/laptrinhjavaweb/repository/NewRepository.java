package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.laptrinhjavaweb.entity.NewEntity;
	
public interface NewRepository extends JpaRepository<NewEntity, Long> { // Giống hàm GenericDAO
												// <Model, Kiểu dữ liệu khóa chính>
	
	// Không cần viết class cho inteface này, chỉ cần gọi hàm CRUD trong JpaRepository ra sử dụng
	
	@Query(value = "SELECT * from new where category_id = :categoryId limit :page, :maxpage", nativeQuery = true)
	List<NewEntity> findByCategoryId(@Param("categoryId") Long categoryId,@Param("page") int page, @Param("maxpage")  int maxpage);
	
	@Query(value = "select count(*) from new where category_id =:categoryId", nativeQuery = true)
	long getTotalItemByCategoryId(@Param("categoryId") Long categoryId);
	
	@Query(value = "SELECT * from new where title like %:title1% limit :page, :maxpage", nativeQuery = true)
	List<NewEntity> findByTitle(@Param("title1") String key, @Param("page") int page,@Param("maxpage") int maxpage);
	
	@Query(value = "select count(*) from new where title like %:title1%", nativeQuery = true)
	long getTotalItemByTitle(@Param("title1") String key);
	
	@Query(value = "SELECT * FROM new ORDER by modifieddate DESC LIMIT 7", nativeQuery = true)
	List<NewEntity> findByHotNew();
	
	@Query(value = "SELECT * FROM `new` n WHERE n.category_id = (SELECT n.category_id FROM `new` n INNER JOIN views v ON n.id = v.new_id\r\n"
			+ "where v.user_id = :userId AND v.view_count = (SELECT max(v.view_count) FROM views v WHERE v.user_id = :userId)\r\n"
			+ "LIMIT 1) ORDER BY RAND()", nativeQuery = true)
	List<NewEntity> recommendCategoryForUser(@Param("userId") Long userId);
	
}
 