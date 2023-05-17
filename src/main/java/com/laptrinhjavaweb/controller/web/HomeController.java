package com.laptrinhjavaweb.controller.web;

import java.sql.Date;
import java.util.List;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.dto.FriendshipDTO;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.dto.ViewCountDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.ICommentService;
import com.laptrinhjavaweb.service.IFriendshipService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.service.IViewCountService;
import com.laptrinhjavaweb.util.MessageUtils;
import com.laptrinhjavaweb.util.SecurityUtils;

@Controller(value = "homeControllerOfWeb") // controller của thằng spring mvc
public class HomeController {

	@Autowired
	private ICategoryService categoryService;

	@Autowired
	private INewService newService;
	
	@Autowired
	private IUserService userService;

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

	@Autowired
	private ICommentService commentService;
	
	@Autowired
	private IViewCountService viewCountService;

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

	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView loginPage(HttpServletRequest request) { // modelAndView: Đẩy data từ model ra view (login.jsp)
		ModelAndView mav = new ModelAndView("web/user/login"); // login.jsp
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			System.out.println(message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		return mav;
	}

	@Autowired
	private MessageUtils messageUtil;

	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView signupPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("web/user/signup");
		if (request.getParameter("message") != null) {
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

	@RequestMapping(value = "/xac-thuc", method = RequestMethod.GET)
	public ModelAndView xacThuc(@RequestParam(value = "maKhachHang", required = false) Long id,
			@RequestParam(value = "maXacThuc", required = false) String maXacThuc) {

		UserDTO userDTO = userService.findById(id);
		ModelAndView mav = new ModelAndView("web/user/validation");
		String message = "";
		String alert = "danger";
		String token = "";

		// Xác thực khi đăng ký
		if (userDTO != null && userDTO.getStatus() == 0) {
			// Kiểm tra xem mã xác thực còn hiệu lực hay không?
			java.sql.Date now = new Date(System.currentTimeMillis());
			if (now.before(userDTO.getValidTime())) {
				// Kiểm tra mã xác thực nhập vào có giống trong mã xac thuc trong dtbase kh?
				if (userDTO.getToken().equals(maXacThuc)) {
					userDTO.setStatus(1);
					userService.update(userDTO);
					message = "Xác thực thành công";
					alert = "success";
				} else {
					message = "Mã xác thực không khớp !";
				}
			} else {
				message = "Hết thời gian xác thực, vui lòng đăng ký lại!";
				userService.delete(userDTO.getId());
			}
		} else if (userDTO != null && userDTO.getChangePasswordStatus() == false) { // Xác thực khi đổi mật khẩu
			// Kiểm tra xem mã xác thực còn hiệu lực hay không?
			java.sql.Date now = new Date(System.currentTimeMillis());
			if (now.before(userDTO.getValidTime())) {
				// Kiểm tra mã xác thực nhập vào có giống trong mã xac thuc trong dtbase kh?
				if (userDTO.getToken().equals(maXacThuc)) {
					userDTO.setChangePasswordStatus(true);
					userService.update2(userDTO);
					message = "Xác thực thành công, bạn có thể đổi mật khẩu";
					alert = "success";
					token = userDTO.getToken();
				} else {
					message = "Mã xác thực không khớp !";
				}
			} else {
				message = "Hết thời gian xác thực, vui lòng xác thực lại!";
			}
		}

		mav.addObject("message", message);
		mav.addObject("alert", alert);
		mav.addObject("id", id);
		mav.addObject("token", token);

		return mav;

	}

	@RequestMapping(value = "/thong-bao", method = RequestMethod.GET)
	public ModelAndView thongBao(@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("web/user/validation");
		mav.addObject("id", id);
		return mav;
	}

	@RequestMapping(value = "/thay-doi-thong-tin", method = RequestMethod.GET)
	public ModelAndView thayDoiThongTin(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("web/user/changeInfo");
		UserDTO userDTO = userService.findByUserName(SecurityUtils.getPrincipal().getUsername());
		mav.addObject("model", userDTO);
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		return mav;
	}


	@RequestMapping(value = "/thay-doi-mat-khau", method = RequestMethod.GET)
	public ModelAndView thayDoiMatKhau(HttpServletRequest request) {
		Long id = SecurityUtils.getPrincipal().getId();
		ModelAndView mav = new ModelAndView("web/user/changePassword");
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("id", id);
		return mav;
	}
	
	@Autowired
	private IFriendshipService friendshipService;
	
	@GetMapping(value = {"/trang-ca-nhan/{userId}", "/trang-ca-nhan" })
	public ModelAndView trangCaNhan(@PathVariable(value = "userId", required = false) Long userId) {
		ModelAndView mav = new ModelAndView("web/user/personalPage");
		UserDTO dto = new UserDTO();
		Long requesterId;
		if(userId == null){
			requesterId = SecurityUtils.getPrincipal().getId();
			dto = userService.findById(SecurityUtils.getPrincipal().getId());
		}else{
			requesterId = userId;
			dto = userService.findById(userId);
		}
		if(SecurityUtils.getPrincipal() != null) {
			if(Long.compare(requesterId, SecurityUtils.getPrincipal().getId()) != 0) {
				FriendshipDTO friend = new FriendshipDTO();
				friend = friendshipService.findByRequesterIdAndAddresseeId(SecurityUtils.getPrincipal().getId(), userId);
				if(friend == null) {
					friend = friendshipService.findByRequesterIdAndAddresseeId(userId, SecurityUtils.getPrincipal().getId());
					mav.addObject("friend1", friend);
				} else {
					mav.addObject("friend", friend);
				}
				
			}
		}
		List<UserDTO> listFriend = userService.findByFriendList(requesterId);
		mav.addObject("listFriend", listFriend);
		mav.addObject("model", dto);
		mav.addObject("userName", dto.getUserName());
		
		return mav;
	}
	
	@GetMapping(value = {"/tin-nhan"})
	public ModelAndView tinNhan() {
		ModelAndView mav = new ModelAndView("web/user/messenger");
		return mav;
	}
	

	@GetMapping(value = { "/quen-mat-khau/{message}", "/quen-mat-khau" })
	public ModelAndView quenMatKhau(@PathVariable(value = "message", required = false) String message) {
		ModelAndView mav = new ModelAndView("web/user/forgotPassword");
		if (message != null) {
			Map<String, String> message1 = messageUtil.getMessage(message);
			mav.addObject("message", message1.get("message"));
			mav.addObject("alert", message1.get("alert"));
		}
		return mav;
	}

	@GetMapping(value = { "/reset-mat-khau/{id}/{token}" })
	public ModelAndView resetMatKhau(@PathVariable Long id, @PathVariable String token,
			@RequestParam(value = "message", required = false) String message) {
		UserDTO dto = userService.findByIdAndVerificationCode(id, token);

		if (dto != null) {
			ModelAndView mav = new ModelAndView("web/user/resetPassword");
			if (message != null) {
				Map<String, String> message1 = messageUtil.getMessage(message);
				mav.addObject("message", message1.get("message"));
				mav.addObject("alert", message1.get("alert"));

				if (message.equals("change_password_success")) {
					userService.deleteTokenAndChangePasswordStatus(dto);
				}

			}
			mav.addObject("token", token);
			mav.addObject("userId", id);
			return mav;
		} else {
			return new ModelAndView("redirect:/trang-chu");
		}
	}

	@PostMapping("/forgotPassword")
	public String forgotPassword(@RequestParam String email, @RequestParam String userName) {
		UserDTO userDTO = userService.findOneByEmailAndUserName(email, userName);
		if (userDTO != null) {
			userService.validateToChangePassword(userDTO);
			return "redirect:/thong-bao?id=" + userDTO.getId();
		} else {
			return "redirect:/quen-mat-khau/invalid_username_email";
		}
	}

}
