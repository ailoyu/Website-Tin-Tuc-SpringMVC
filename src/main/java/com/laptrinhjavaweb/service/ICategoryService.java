package com.laptrinhjavaweb.service;

import java.util.List;
import java.util.Map;

import com.laptrinhjavaweb.dto.CategoryDTO;

public interface ICategoryService {
	Map<String, String> findAll();
	List<CategoryDTO> findAllCategory();
}
