package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.LikeConverter;
import com.laptrinhjavaweb.dto.LikeDTO;
import com.laptrinhjavaweb.entity.LikeEntity;
import com.laptrinhjavaweb.entity.PostEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.LikeRespository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.ILikeService;

@Service
public class LikeService implements ILikeService {
	
	@Autowired
	private LikeRespository likeRespository;
	
	@Autowired
	private LikeConverter likeConverter;
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public LikeDTO saveLike(LikeDTO dto) {
		LikeEntity entity = new LikeEntity();
		
		UserEntity user = new UserEntity();
		user.setId(dto.getUserId());
		PostEntity post = new PostEntity();
		post.setId(dto.getPostId());
		
		entity.setUser(user);
		entity.setPost(post);
		entity.setStatus("LIKE");
		
		return likeConverter.toDTO(likeRespository.save(entity));
	}

	@Override
	public List<LikeDTO> getLikedPost(Long userId, String status) {
		
		UserEntity userEntity = userRepository.findOne(userId);
		
		List<LikeEntity> findByUserAndStatus = likeRespository.findByUserAndStatus(userEntity, status);
		List<LikeDTO> listLikedPost = new ArrayList<>();
		
		for (LikeEntity likeEntity : findByUserAndStatus) {
			LikeDTO dto = likeConverter.toDTO(likeEntity);
			listLikedPost.add(dto);
		}
		
		return listLikedPost;
	}

	@Override
	public LikeDTO deleteLike(LikeDTO dto) {
		UserEntity user = new UserEntity();
		user.setId(dto.getUserId());
		PostEntity post = new PostEntity();
		post.setId(dto.getPostId());
		
		LikeEntity entity = likeRespository.findOneByUserAndPost(user, post);
		likeRespository.delete(entity);
		return likeConverter.toDTO(entity);
		
	}


}
