package com.laptrinhjavaweb.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.service.ICommentService;

@RestController(value = "commentAPIOfWeb")
public class CommentAPI {
	
	@Autowired
	private ICommentService commentService;
	
	// doPost
	@PostMapping("api/comment")
	public CommentDTO createComment(@RequestBody CommentDTO commentDTO) { // khai báo để Map kiểu JSon -> kiểu NewDT
		if(commentDTO.getParentId() == null) {
			commentDTO.setParentId(-1);
		}
		return commentService.save(commentDTO);
	}
	
}
