package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "homeControllerOfAdmin") // controller của thằng spring mvc
public class HomeController {
	
	
	// Request Mapping: nhận đường link url, dùng method: get
	 @RequestMapping(value = "/quan-tri/trang-chu", method = RequestMethod.GET)
	   public ModelAndView homePage() { // modelAndView: Đẩy data từ model ra view (home.jsp)
	      ModelAndView mav = new ModelAndView("admin/home"); // home.jsp
	      return mav;
	   }

}
