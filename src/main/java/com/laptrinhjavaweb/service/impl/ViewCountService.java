package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.ViewCountConverter;
import com.laptrinhjavaweb.dto.ViewCountDTO;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.entity.ViewCountEntity;
import com.laptrinhjavaweb.repository.ViewCountRespository;
import com.laptrinhjavaweb.service.IViewCountService;

@Service
public class ViewCountService implements IViewCountService {
	
	@Autowired
	private ViewCountRespository viewCountRespository;
	
	@Autowired
	private ViewCountConverter viewCountConverter;

	@Override
	public ViewCountDTO addViewCounts(ViewCountDTO viewCountDTO) {
		ViewCountEntity entity = new ViewCountEntity();
		List<ViewCountEntity> findAll = viewCountRespository.findAll();
		for (ViewCountEntity v : findAll) {
			if(v.getNewEntity().getId() == viewCountDTO.getNewId() 
			&& v.getUserEntity().getId() == viewCountDTO.getUserId()) {
				entity.setId(v.getId());
				NewEntity n1 = new NewEntity();
				n1.setId(viewCountDTO.getNewId());
				UserEntity u1 = new UserEntity();
				u1.setId(viewCountDTO.getUserId());
				entity.setNewEntity(n1);
				entity.setUserEntity(u1);
				entity.setViewCount(v.getViewCount() + 1);
				return viewCountConverter.toDTO(viewCountRespository.save(entity));
			}
		}
		NewEntity n1 = new NewEntity();
		n1.setId(viewCountDTO.getNewId());
		UserEntity u1 = new UserEntity();
		u1.setId(viewCountDTO.getUserId());
		entity.setNewEntity(n1);
		entity.setUserEntity(u1);
		entity.setViewCount(1L);
		return viewCountConverter.toDTO(viewCountRespository.save(entity));
	}

	@Override
	public List<ViewCountDTO> recommendForUser(Long userId) {
		List<ViewCountDTO> list = new ArrayList<>();
		List<ViewCountEntity> recommendForUser = viewCountRespository.recommendForUser(userId);
		for (ViewCountEntity item : recommendForUser) {
			ViewCountDTO dto = viewCountConverter.toDTO(item);
			list.add(dto);
		}
		return list;
	}

	

}
