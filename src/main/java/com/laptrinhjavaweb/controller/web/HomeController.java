package com.laptrinhjavaweb.controller.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.ICommentService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.util.MessageUtil;

@Controller(value = "homeControllerOfWeb") // controller của thằng spring mvc
public class HomeController {

	@Autowired
	private ICategoryService categoryService;

	@Autowired
	private INewService newService;

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
			model.setListResult(newService.findByTitleName(key, (model.getPage() - 1) * model.getLimit(), model.getLimit()));
			model.setTotalItem(newService.getTotalItemByTitle(key));
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
			
			mav.addObject("key", key);
			mav.addObject("categories", categoryService.findAllCategory());
			mav.addObject("model", model);
			return mav;
		}
	}
	
	@Autowired
	private ICommentService commentService;

	@RequestMapping(value = "/thong-tin-bai-viet", method = RequestMethod.GET)
	public ModelAndView showInfo(@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView();
		mav = new ModelAndView("/web/info");
		NewDTO model = new NewDTO();
		model.setId(id);
		model = newService.findById(id);
		CommentDTO commentDTO = new CommentDTO();
		commentDTO.setListComment(commentService.findByNewId(id));
		mav.addObject("comment", commentDTO);
		mav.addObject("model", model);
		return mav;
	}

	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView loginPage(HttpServletRequest request) { // modelAndView: Đẩy data từ model ra view (login.jsp)
		ModelAndView mav = new ModelAndView("login"); // login.jsp
		if(request.getParameter("message") != null) {
	    	 Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
	    	 mav.addObject("message", message.get("message"));
	    	 mav.addObject("alert", message.get("alert"));
	      }
		return mav;
	}
	
	@Autowired
	private MessageUtil messageUtil;
	
	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView signupPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("signup");
		if(request.getParameter("message") != null) {
	    	 Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
	    	 mav.addObject("message", message.get("message"));
	    	 mav.addObject("alert", message.get("alert"));
	      }
		return mav;
	}
	

	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() { // modelAndView: Đẩy data từ model ra view (login.jsp)
		return new ModelAndView("redirect:/dang-nhap?accessDenied");
	}

	@RequestMapping(value = "/thoat", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); // isAuthenticated()
		if (auth != null) {
			// Đăng xuất
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/trang-chu");
	}

	
}
