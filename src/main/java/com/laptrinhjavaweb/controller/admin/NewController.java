package com.laptrinhjavaweb.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.util.MessageUtils;

@Controller(value = "newControllerOfAdmin") // controller của thằng spring mvc
public class NewController {
	
		@Autowired
		private INewService newService;
		
		@Autowired
		private ICategoryService categoryService;
		
		@Autowired
		private MessageUtils messageUtil;
		
		
	// Request Mapping: nhận đường link url, dùng method: get
	 @RequestMapping(value = "/quan-tri/bai-viet/danh-sach", method = RequestMethod.GET)
	   public ModelAndView showList(@RequestParam(value = "page", required = false) Integer page, 
			   						HttpServletRequest request) { 
		 ModelAndView mav = new ModelAndView("admin/new/list"); 
		 
		 
		 NewDTO model = new NewDTO();
	     // truyền page và limit từ client vào
		 page = (page == null) ? 1 : page;
	     model.setPage(page);
	     // Phân trang
	     Pageable pageable = new PageRequest(page - 1, model.getLimit()); // page - 1: index đầu tiên của trang
		 
	     
		 model.setListResult(newService.findAll(pageable));
	     
	     model.setTotalItem(newService.getTotalItem());
	     model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
	     
	     if(request.getParameter("message") != null) {
	    	 Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
	    	 mav.addObject("message", message.get("message"));
	    	 mav.addObject("alert", message.get("alert"));
	      }
	     mav.addObject("model", model); // đẩy object NewModel ra ngoài 
	     return mav;
	   }
	 
	 @RequestMapping(value = "/quan-tri/bai-viet/chinh-sua", method = RequestMethod.GET)
	 								// Nếu id != null thì mới lấy id xuống, còn ko thì ko lấy id
	   public ModelAndView editNew(@RequestParam(value = "id", required = false) Long id,
			   						HttpServletRequest request) {
	      ModelAndView mav = new ModelAndView("admin/new/edit"); 
	      NewDTO model = new NewDTO();
	      if(id != null) { // cập nhật bài viết
	    	  model = newService.findById(id);
	      }
	      
	      if(request.getParameter("message") != null) {
	    	  Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
	    	  mav.addObject("message", message.get("message"));
	    	  mav.addObject("alert", message.get("alert"));
	      }
	      
	      mav.addObject("categories", categoryService.findAll());
	      mav.addObject("model", model);
	      return mav;
	   }
	 
	 @RequestMapping(value = "/quan-tri/bai-viet/danh-sach/tim-kiem", method = RequestMethod.GET)
		public ModelAndView timKiem(@RequestParam(value = "key", required = false) String key,
									@RequestParam(value = "page", required = false) Integer page) {
			if (key.isEmpty()) {
				return showList(1, null);
			} else {
				ModelAndView mav = new ModelAndView("admin/new/list");
				NewDTO model = new NewDTO();
				page = (page == null) ? 1 : page;
				model.setPage(page);
				// truyền page và limit từ client vào
				model.setListResult(newService.findByTitleName(key, (model.getPage() - 1) * model.getLimit(), model.getLimit()));
				model.setTotalItem(newService.getTotalItemByTitle(key));
				model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
				
				mav.addObject("key", key);
				mav.addObject("categories", categoryService.findAllCategory());
				mav.addObject("model", model);
				return mav;
			}
		}
	 
}
