package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.PostConverter;
import com.laptrinhjavaweb.dto.PostDTO;
import com.laptrinhjavaweb.entity.PostEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.PostRespository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IPostService;

@Service
public class PostService implements IPostService {
	
	@Autowired
	private PostRespository postRespository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PostConverter postConverter;

	@Override
	public PostDTO save(PostDTO postDTO) {
		
		UserEntity user = userRepository.findOne(postDTO.getUserId());
		PostEntity postEntity = postConverter.toEntity(postDTO);
		postEntity.setUser(user);
		
		return postConverter.toDTO(postRespository.save(postEntity));
	}

	@Override
	public List<PostDTO> getAllPostsById(Long id) {
		List<PostEntity> listEntity = postRespository.getAllPostsById(id);
		List<PostDTO> listDTO = new ArrayList<>();
		for (PostEntity postEntity : listEntity) {
			PostDTO dto = postConverter.toDTO(postEntity);
			listDTO.add(dto);
		}
		return listDTO;
	}

	@Override
	public void delete(long id) {
		postRespository.delete(id);
	}
	
}
