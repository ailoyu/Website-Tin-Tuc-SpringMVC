package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.PostDTO;

public interface IPostService {
	
	PostDTO save(PostDTO postDTO);
	List<PostDTO> getAllPostsByUserId(Long id);
	List<PostDTO> getFriendPostsForNewfeeds(Long id);
	void delete(long id);
}
