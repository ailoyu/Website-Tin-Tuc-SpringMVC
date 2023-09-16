package com.laptrinhjavaweb.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.service.ICommentPostService;
import com.laptrinhjavaweb.service.ICommentService;

@RestController(value = "commentAPIOfWeb")
public class CommentAPI {
	
	@Autowired
	private ICommentService commentService;
	
	@Autowired
	private ICommentPostService commentPostService;
	
	// doPost
	@PostMapping("api/comment")
	public CommentDTO createComment(@RequestBody CommentDTO commentDTO) { // khai báo để Map kiểu JSon -> kiểu NewDT
		return commentService.save(commentDTO);
	}
	
	// doPost
	@PostMapping("api/commentPost")
	public CommentDTO createCommentPost(@RequestBody CommentDTO commentDTO) { // khai báo để Map kiểu JSon -> kiểu NewDT
		return commentPostService.save(commentDTO);
	}
}
