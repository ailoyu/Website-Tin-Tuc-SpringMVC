package com.laptrinhjavaweb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.CommentPostConverter;
import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.entity.CommentPostEntity;
import com.laptrinhjavaweb.entity.PostEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.CommentPostRespository;
import com.laptrinhjavaweb.service.ICommentPostService;

@Service
public class CommentPostService implements ICommentPostService {
	
	@Autowired
	private CommentPostRespository commentPostRespository;
	
	@Autowired
	private CommentPostConverter commentPostConverter;
	
	@Override
	public CommentDTO save(CommentDTO dto) {
		
		CommentPostEntity entity = new CommentPostEntity();
		
		entity.setContent(dto.getContent());
		
		if(dto.getThumbnail().equals("")) {
			entity.setThumbnail(null);
		}else {
			entity.setThumbnail(dto.getThumbnail());
		}
		
		
		PostEntity post = new PostEntity();
		post.setId(dto.getPostId());
		UserEntity user = new UserEntity();
		user.setId(dto.getUserId());
		
		entity.setPosts(post);
		entity.setUser(user);
		
		return commentPostConverter.toDTO(commentPostRespository.save(entity));
	}

	
}
