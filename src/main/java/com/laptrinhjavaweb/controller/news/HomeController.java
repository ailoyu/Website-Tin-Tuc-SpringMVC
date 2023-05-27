package com.laptrinhjavaweb.controller.news;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.dto.ViewCountDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.ICommentService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.service.IViewCountService;
import com.laptrinhjavaweb.util.SecurityUtils;

@Controller(value = "homeControllerOfWeb") // controller của thằng spring mvc
public class HomeController {

	@Autowired
	private ICategoryService categoryService;

	@Autowired
	private INewService newService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private ICommentService commentService;
	
	@Autowired
	private IViewCountService viewCountService;

	// Request Mapping: nhận đường link url, dùng method: get
	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam(value = "categoryId", required = false) Long categoryId,
			@RequestParam(value = "page", required = false) Integer page) { // modelAndView: Đẩy data từ model ra view
																			// (home.jsp)
		ModelAndView mav = new ModelAndView();
		mav = new ModelAndView("web/home"); // home.jsp
		mav.addObject("categories", categoryService.findAllCategory());
		NewDTO model = new NewDTO();
		// truyền page và limit từ client vào
		page = (page == null) ? 1 : page;
		model.setPage(page);

		Pageable pageable;

		if (categoryId != null) {
			model.setCategoryId(categoryId);
			model.setListResult(newService.findByCategoryId(categoryId, (model.getPage() - 1) * model.getLimit(),
					model.getLimit()));
			model.setTotalItem(newService.getTotalItemByCategoryId(categoryId));
		} else {
			pageable = new PageRequest(model.getPage() - 1, model.getLimit());
			model.setListResult(newService.findAll(pageable));
			model.setTotalItem(newService.getTotalItem());

			// Set tin mới nhất
			model.setListHotNews(newService.findByHotNew());
		}
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));

		mav.addObject("model", model);
		return mav;
	}

	@RequestMapping(value = "/the-loai", method = RequestMethod.GET)
	public ModelAndView showCategory(@RequestParam(value = "categoryId", required = false) Long categoryId,
			@RequestParam(value = "page", required = false) Integer page) {
		ModelAndView mav = new ModelAndView();
		mav = new ModelAndView("web/home"); // home.jsp
		mav.addObject("categories", categoryService.findAllCategory());
		NewDTO model = new NewDTO();
		// truyền page và limit từ client vào
		page = (page == null) ? 1 : page;
		model.setPage(page);

		model.setCategoryId(categoryId);
		model.setListResult(
				newService.findByCategoryId(categoryId, (model.getPage() - 1) * model.getLimit(), model.getLimit()));
		model.setTotalItem(newService.getTotalItemByCategoryId(categoryId));
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));

		mav.addObject("model", model);
		return mav;

	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView timKiem(@RequestParam(value = "key", required = false) String key,
			@RequestParam(value = "page", required = false) Integer page) {
		if (key.isEmpty()) {
			return homePage(null, null);
		} else {
			ModelAndView mav = new ModelAndView("web/home");
			NewDTO model = new NewDTO();
			page = (page == null) ? 1 : page;
			model.setPage(page);
			// truyền page và limit từ client vào
			model.setListResult(
					newService.findByTitleName(key, (model.getPage() - 1) * model.getLimit(), model.getLimit()));
			model.setTotalItem(newService.getTotalItemByTitle(key));
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
			
			
			List<UserDTO> findByFullName = userService.findByFullName(key);
			
			mav.addObject("key", key);
			mav.addObject("categories", categoryService.findAllCategory());
			mav.addObject("model", model);
			mav.addObject("findName", findByFullName);
			return mav;
		}
	}


	@RequestMapping(value = "/thong-tin-bai-viet", method = RequestMethod.GET)
	public ModelAndView showInfo(@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView();
		mav = new ModelAndView("/web/new/info");
		NewDTO model = new NewDTO();
		model.setId(id);
		model = newService.findById(id);
		CommentDTO commentDTO = new CommentDTO();
		commentDTO.setListComment(commentService.findByNewId(id));
		mav.addObject("comment", commentDTO);
		mav.addObject("model", model);
		if(SecurityUtils.getPrincipal() != null) {
			List<ViewCountDTO> recommendForUser = viewCountService.recommendForUser(SecurityUtils.getPrincipal().getId());		
			if(recommendForUser.size() == 3) {
				mav.addObject("recommendForUser", recommendForUser);
				List<NewDTO> recommendCategoryForUser = newService.recommendCategoryForUser(SecurityUtils.getPrincipal().getId());
				mav.addObject("recommendCategoryForUser", recommendCategoryForUser);
			}
		}
		return mav;
	}


}
