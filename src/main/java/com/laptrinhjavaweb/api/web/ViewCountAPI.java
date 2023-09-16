package com.laptrinhjavaweb.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.ViewCountDTO;
import com.laptrinhjavaweb.service.IViewCountService;

@RestController(value = "viewCountAPIOfWeb")
public class ViewCountAPI {
	
	@Autowired
	private IViewCountService viewCountService;
	
	@PostMapping("api/views")
	public ViewCountDTO updateViewCount(@RequestBody ViewCountDTO viewsDTO) { // khai báo để Map kiểu JSon -> kiểu NewDT
		return viewCountService.addViewCounts(viewsDTO);
	}
	
}
