package com.laptrinhjavaweb.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.LikeDTO;
import com.laptrinhjavaweb.service.ILikeService;

@RestController
public class LikeAPI {

	@Autowired
	private ILikeService likeService;
	
	// doPost
	@PostMapping("api/like")
	public LikeDTO createLike(@RequestBody LikeDTO likeDTO) { // khai báo để Map kiểu JSon -> kiểu NewDT
		return likeService.saveLike(likeDTO);
	}
	
	@DeleteMapping("api/like")
	public LikeDTO deleteLike(@RequestBody LikeDTO likeDTO) {
		return likeService.deleteLike(likeDTO);
	}
}
