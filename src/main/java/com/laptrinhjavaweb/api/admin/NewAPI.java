package com.laptrinhjavaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.service.INewService;

@RestController(value = "newAPIOfAdmin")
public class NewAPI {
		
	@Autowired
		private INewService newService;
	
		// doPost
		@PostMapping("api/new")
		public NewDTO createNew(@RequestBody NewDTO newDTO) { // khai báo để Map kiểu JSon -> kiểu NewDT
			return newService.save(newDTO);
		}
		
		// doPut
		@PutMapping("api/new")
		public NewDTO updateNew(@RequestBody NewDTO updateNew) { // khai báo để Map kiểu JSon -> kiểu NewDTO
			return newService.save(updateNew);
		}
		
		
		// doDelete
		@DeleteMapping("api/new")
		public void deleteNew(@RequestBody long[] ids) { // khai báo để Map kiểu JSon -> kiểu mảng long[]
			newService.delete(ids);
		}
}
