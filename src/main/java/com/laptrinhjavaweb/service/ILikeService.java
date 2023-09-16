package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.LikeDTO;

public interface ILikeService {
	LikeDTO saveLike(LikeDTO likeDTO);
	List<LikeDTO> getLikedPost(Long userId, String status);
	LikeDTO deleteLike(LikeDTO likeDTO);
	
}
