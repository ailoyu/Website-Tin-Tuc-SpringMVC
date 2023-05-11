package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.NewDTO;

public interface INewService {
	List<NewDTO> findAll(Pageable pageable);
	int getTotalItem();
	NewDTO findById(long id);
	NewDTO insert(NewDTO newDTO);
	NewDTO update(NewDTO updateNew);
	NewDTO save(NewDTO dto); // vừa insert và update
	void delete(long[] ids);
	List<NewDTO> findByCategoryId(Long categoryId, int page, int maxpage);
	int getTotalItemByCategoryId(Long categoryId);
	List<NewDTO> findByTitleName(String key, int page, int maxpage);
	int getTotalItemByTitle(String key);
	List<NewDTO> findByHotNew();
	List<NewDTO> recommendCategoryForUser(Long id);
}
