package com.laptrinhjavaweb.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.PostDTO;
import com.laptrinhjavaweb.service.IPostService;

@RestController(value = "postAPIOfWeb")
public class PostAPI {
	
	@Autowired
	private IPostService postService;
	
	// doPost
	@PostMapping("api/post")
	private PostDTO addPost(@RequestBody PostDTO postDTO) {
		return postService.save(postDTO);
	}
	
	@DeleteMapping("api/post")
	private void deletePost(@RequestBody long id) {
		postService.delete(id);
	}
	
	
}
