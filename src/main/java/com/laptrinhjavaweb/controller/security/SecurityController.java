package com.laptrinhjavaweb.controller.security;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.util.MessageUtils;
import com.laptrinhjavaweb.util.SecurityUtils;

@RestController(value = "SecurityControllerOfWeb")
public class SecurityController {
	
	@Autowired
	private MessageUtils messageUtil;
	
	@Autowired
	private IUserService userService;
	
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
