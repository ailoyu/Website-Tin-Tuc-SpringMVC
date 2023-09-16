package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.ViewCountDTO;

public interface IViewCountService {
	ViewCountDTO addViewCounts(ViewCountDTO viewCountDTO);
	List<ViewCountDTO> recommendForUser(Long userId);
}
