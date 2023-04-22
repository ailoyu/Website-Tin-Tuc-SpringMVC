package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.CommentDTO;

public interface ICommentService {
	CommentDTO save(CommentDTO dto);
	List<CommentDTO> findByNewId(Long newId);
}
