package com.laptrinhjavaweb.converter;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.NewEntity;

@Component // Khai báo để sử dụng @Autowired ở class khác
public class NewConverter {
	public NewDTO toDTO(NewEntity entity) {
		NewDTO result = new NewDTO();
		
		result.setId(entity.getId());
		result.setTitle(entity.getTitle());
		result.setShortDescription(entity.getShortDescription());
		result.setContent(entity.getContent());
		result.setThumbnail(entity.getThumbnail());
		result.setCategoryCode(entity.getCategory().getCode());
		
		
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp valueOf = Timestamp.valueOf(sm.format(entity.getCreatedDate()));
		
		result.setCreatedDate(valueOf);
		
		result.setCreatedBy(entity.getCreatedBy());
		
		return result;
	}
	
	public NewEntity toEntity(NewDTO dto) {
		NewEntity result = new NewEntity();
		
		result.setTitle(dto.getTitle());
		result.setShortDescription(dto.getShortDescription());
		result.setContent(dto.getContent());
		result.setThumbnail(dto.getThumbnail());
		
		// setCategoryCode cần phải set trên tầng service, vì data nó phức tạp
		
		return result;
	}
	
	
	public NewEntity toEntity(NewEntity result, NewDTO dto) {
		
		result.setTitle(dto.getTitle());
		result.setShortDescription(dto.getShortDescription());
		result.setContent(dto.getContent());
		result.setThumbnail(dto.getThumbnail());
		
		// setCategoryCode cần phải set trên tầng service, vì data nó phức tạp
		
		return result;
	}
}
