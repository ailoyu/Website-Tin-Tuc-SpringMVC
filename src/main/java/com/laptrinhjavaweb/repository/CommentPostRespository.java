package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.CommentPostEntity;
import com.laptrinhjavaweb.entity.PostEntity;

public interface CommentPostRespository extends JpaRepository<CommentPostEntity, Long> {
	List<CommentPostEntity> findByPosts(PostEntity posts);
}
