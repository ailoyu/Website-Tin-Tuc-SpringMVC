package com.laptrinhjavaweb.security;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.util.SecurityUtils;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler{
	
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	// Xử lý Authorization cho admin và user
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException {
		String targetUrl = determineTargetUrl(authentication); // trả về url, sau khi phân quyền xong
		if (response.isCommitted()) {
			return;
		}else {
			// nếu tài khoản chưa xác thực -> đăng xuất ra
			redirectStrategy.sendRedirect(request, response, targetUrl);
		}
	}

	public RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}

	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}


	private String determineTargetUrl(Authentication authentication) {
		String url = "";
		List<String> roles = SecurityUtils.getAuthorities(); // lấy ra code: "USER" or "ADMIN"
		
		// if role is ADMIN so redirect to controller: /quan-tri/trang-chu
		if(isAdmin(roles) && SecurityUtils.getPrincipal().getStatus() == 1) {
			url = "/twinkle";
		}else if(isUser(roles) && SecurityUtils.getPrincipal().getStatus() == 1) { // if role is USER so redirect to controller: /trang-chu
			url = "/twinkle";
		}
		return url;
	}
	
	private boolean isAdmin(List<String> roles) {
		if(roles.contains("ADMIN")) {
			return true;
		}
		return false;
	}
	
	private boolean isUser(List<String> roles) {
		if(roles.contains("USER")) {
			return true;
		}
		return false;
	}
	
}
