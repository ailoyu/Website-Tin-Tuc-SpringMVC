package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.laptrinhjavaweb.util.ImageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.CommentPostConverter;
import com.laptrinhjavaweb.converter.LikeConverter;
import com.laptrinhjavaweb.converter.PostConverter;
import com.laptrinhjavaweb.converter.UserConverter;
import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.dto.LikeDTO;
import com.laptrinhjavaweb.dto.PostDTO;
import com.laptrinhjavaweb.entity.CommentPostEntity;
import com.laptrinhjavaweb.entity.LikeEntity;
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
	
	@Autowired
	private CommentPostConverter commentPostConverter;
	
	@Autowired
	private LikeConverter likeConverter;
	
	@Autowired
	private UserConverter userConverter;

	@Autowired
	private ImageUtils imageUtils;

	@Override
	public PostDTO save(PostDTO postDTO) {
		
		UserEntity user = userRepository.findOne(postDTO.getUserId());
		if(postDTO.getThumbnail() != "")
			postDTO.setThumbnail(imageUtils.convertBase64toCloudinaryImage(postDTO.getThumbnail()));
		PostEntity postEntity = postConverter.toEntity(postDTO);
		postEntity.setUser(user);

		
		return postConverter.toDTO(postRespository.save(postEntity));
	}

	@Override
	public List<PostDTO> getAllPostsByUserId(Long id) {
		List<PostEntity> listEntity = postRespository.getAllPostsByUserId(id);
		List<PostDTO> listDTO = new ArrayList<>();
		for (PostEntity postEntity : listEntity) {
			PostDTO dto = postConverter.toDTO(postEntity);
			
			List<CommentPostEntity> commentPosts = postEntity.getCommentPosts();
			List<CommentDTO> commentDTO = new ArrayList<>();
			for (CommentPostEntity commentPostEntity : commentPosts) {
				CommentDTO dto2 = commentPostConverter.toDTO(commentPostEntity);
				commentDTO.add(dto2);
			}
			
			List<LikeEntity> likes = postEntity.getLikes();
			List<LikeDTO> likeDTO = new ArrayList<>();
			for (LikeEntity likeEntity : likes) {
				LikeDTO dto2 = likeConverter.toDTO(likeEntity);
				UserEntity user = likeEntity.getUser();
				dto2.setUserDTO(userConverter.toDTO(user));
				likeDTO.add(dto2);
			}
			dto.setLikes(likeDTO);
			dto.setComments(commentDTO);
			
			listDTO.add(dto);
		}
		return listDTO;
	}

	@Override
	public void delete(long id) {
		postRespository.delete(id);
	}

	@Override
	public List<PostDTO> getFriendPostsForNewfeeds(Long id) {
		List<PostEntity> listEntity = postRespository.getFriendPostForNewfeeds(id);
		List<PostDTO> listDTO = new ArrayList<>();
		for (PostEntity postEntity : listEntity) {
			PostDTO dto = postConverter.toDTO(postEntity);
			
			List<CommentPostEntity> commentPosts = postEntity.getCommentPosts();
			List<CommentDTO> commentDTO = new ArrayList<>();
			for (CommentPostEntity commentPostEntity : commentPosts) {
				CommentDTO dto2 = commentPostConverter.toDTO(commentPostEntity);
				commentDTO.add(dto2);
			}
			
			List<LikeEntity> likes = postEntity.getLikes();
			List<LikeDTO> likeDTO = new ArrayList<>();
			for (LikeEntity likeEntity : likes) {
				LikeDTO dto2 = likeConverter.toDTO(likeEntity);
				UserEntity user = likeEntity.getUser();
				dto2.setUserDTO(userConverter.toDTO(user));
				likeDTO.add(dto2);
			}
			dto.setLikes(likeDTO);
			dto.setComments(commentDTO);
			
			listDTO.add(dto);
		}
		return listDTO;
	}
	
}
