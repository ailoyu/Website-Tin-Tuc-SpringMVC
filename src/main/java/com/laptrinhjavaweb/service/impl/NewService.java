package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.converter.NewConverter;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.repository.NewRepository;
import com.laptrinhjavaweb.service.INewService;


@Service // khai báo để AutoWired cho service
public class NewService implements INewService {
	
//	@Autowired
//	private INewDAO newDao;
	
	@Autowired
	private NewRepository newRepository;
	
	@Autowired
	private NewConverter newConverter;
	
	@Autowired
	private CategoryRepository categoryRepository;
	

	@Override
	public List<NewDTO> findAll(Pageable pageable) {
		List<NewDTO> models = new ArrayList<NewDTO>();
								// tự động nhận offset và limit để phân trang
		List<NewEntity> entities = newRepository.findAll(pageable).getContent(); 
		for (NewEntity item : entities) {
			NewDTO newDTO = newConverter.toDTO(item); // convert từ entity -> dto
			models.add(newDTO);
		}
		return models;
	}
	
	@Override
	public List<NewDTO> findByCategoryId(Long categoryId, int page, int maxpage) {
		List<NewDTO> models = new ArrayList<NewDTO>();
		List<NewEntity> entities = newRepository.findByCategoryId(categoryId, page, maxpage);
		for (NewEntity item : entities) {
			NewDTO newDTO = newConverter.toDTO(item); // convert từ entity -> dto
			models.add(newDTO);
		}
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) newRepository.count();
	}
	
	@Override
	public int getTotalItemByCategoryId(Long categoryId) {
		return (int) newRepository.getTotalItemByCategoryId(categoryId);
	}
	
	

	@Override
	public NewDTO findById(long id) {
		NewEntity entity = newRepository.findOne(id);
		return newConverter.toDTO(entity);
	}

	@Override
	@Transactional // khai báo transaction (để tự động commit rollback)
	public NewDTO insert(NewDTO newDTO) {
		
		CategoryEntity category = categoryRepository.findOneByCode(newDTO.getCategoryCode());
		NewEntity newEntity = newConverter.toEntity(newDTO);
		newEntity.setCategory(category);
		
		newEntity = newRepository.save(newEntity);
		return newConverter.toDTO(newEntity);
	}

	@Override
	@Transactional // khai báo transaction (để tự động commit rollback)
	public NewDTO update(NewDTO dto) {
		
		NewEntity oldNew = newRepository.findOne(dto.getId());
		CategoryEntity category = categoryRepository.findOneByCode(dto.getCategoryCode());
		oldNew.setCategory(category);
		// cập nhật từ dto ms nhập -> newEntity
		NewEntity updateNew = newConverter.toEntity(oldNew, dto);
		
		// save dữ liệu cập nhật
		updateNew = newRepository.save(updateNew); // hàm save & update xài chung
		return newConverter.toDTO(updateNew);
	}

	@Override
	@Transactional
	public NewDTO save(NewDTO newDTO) { // Vừa insert và update
		
		CategoryEntity category = categoryRepository.findOneByCode(newDTO.getCategoryCode());
		
		NewEntity newEntity = new NewEntity();
		
		if(newDTO.getId() != null) { // Thao tác update
			
			NewEntity oldNew = newRepository.findOne(newDTO.getId());
			oldNew.setCategory(category);
		
			newEntity = newConverter.toEntity(oldNew, newDTO);
		} else { // Thao tác update
			
			newEntity = newConverter.toEntity(newDTO);
			newEntity.setCategory(category);
	
		}
		
		return newConverter.toDTO(newRepository.save(newEntity));
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		for (long id : ids) {
			newRepository.delete(id);
		}
	}


	@Override
	public List<NewDTO> findByTitleName(String key, int page, int maxPage) {
		List<NewDTO> models = new ArrayList<NewDTO>();
		List<NewEntity> entities = newRepository.findByTitle(key, page, maxPage);
		for (NewEntity item : entities) {
			NewDTO newDTO = newConverter.toDTO(item); // convert từ entity -> dto
			models.add(newDTO);
		}
		return models;
	}

	@Override
	public int getTotalItemByTitle(String key) {
		return (int) newRepository.getTotalItemByTitle(key);
	}

	@Override
	public List<NewDTO> findByHotNew() {
		List<NewDTO> models = new ArrayList<NewDTO>();
		List<NewEntity> entities = newRepository.findByHotNew();
		for (NewEntity item : entities) {
			NewDTO newDTO = newConverter.toDTO(item); // convert từ entity -> dto
			models.add(newDTO);
		}
		return models;
	}

	@Override
	public List<NewDTO> recommendCategoryForUser(Long id) {
		List<NewDTO> list = new ArrayList<>();
		List<NewEntity> recommendForUser =  newRepository.recommendCategoryForUser(id);
		for (NewEntity item : recommendForUser) {
			NewDTO newDTO = newConverter.toDTO(item); // convert từ entity -> dto
			list.add(newDTO);
		}
		return list;
	}

	

}
