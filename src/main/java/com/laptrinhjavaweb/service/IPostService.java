package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.PostDTO;

public interface IPostService {
	
	PostDTO save(PostDTO postDTO);
	List<PostDTO> getAllPostsById(Long id);
}
