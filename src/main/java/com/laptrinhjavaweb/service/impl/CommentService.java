package com.laptrinhjavaweb.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.converter.CommentConverter;
import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.entity.CommentEntity;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.repository.CommentRepository;
import com.laptrinhjavaweb.repository.NewRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.ICommentService;

@Service
public class CommentService implements ICommentService {

	@Autowired
	private CommentConverter commentConverter;

	@Autowired
	private NewRepository newRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private CommentRepository commentRepository;

	@Override
	@Transactional
	public CommentDTO save(CommentDTO dto) {

		CommentEntity entity = commentConverter.toEntity(dto);

		if (dto.getParentId() != null) {
			entity.setParentId(dto.getParentId());
		}

		entity.setNews(newRepository.findOne(dto.getNewId()));
		entity.setUser(userRepository.findOne(dto.getUserId()));
		
		return commentConverter.toDTO(commentRepository.save(entity));
	}

	@Override
	public List<CommentDTO> findByNewId(Long newId) {
		List<CommentDTO> models = new ArrayList<CommentDTO>();
		NewEntity newEntity = newRepository.findOne(newId);
		List<CommentEntity> entities = commentRepository.findByNews(newEntity);
		for (CommentEntity item : entities) {
			CommentDTO newDTO = commentConverter.toDTO(item); // convert từ entity -> dto

			// Set thuộc tính riêng trong comment
			newDTO.setFullName(item.getUser().getFullName());
			newDTO.setCreatedDate((Timestamp) item.getCreatedDate());
			newDTO.setAvatar(item.getUser().getAvatar());
			
			models.add(newDTO);
		}
		return models;
	}

}
