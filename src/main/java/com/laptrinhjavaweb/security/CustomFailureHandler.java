package com.laptrinhjavaweb.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.config.PasswordEncoderConfig;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.UserRepository;

@Component
public class CustomFailureHandler extends SimpleUrlAuthenticationFailureHandler{
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PasswordEncoderConfig passwordEncoder;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
//		String username = exception.getAuthentication().getName();
//		String password = exception.getAuthentication().getCredentials().toString();
		
		exception = (AuthenticationException)request.getSession().getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);

	    String username = request.getParameter("j_username");
	    String password = request.getParameter("j_password");
	    
	    System.out.println(username + " | " + password);
		
		UserEntity userEntity = userRepository.findOneByUserName(username);
		
		
		if(userEntity == null) {
			getRedirectStrategy().sendRedirect(request, response, "/dang-nhap?message=inavailable_account");
		} else {
			boolean matKhau = passwordEncoder.passwordEncoder().matches(password, userEntity.getPassword());
			if(userEntity.getStatus() == 0) {
				getRedirectStrategy().sendRedirect(request, response, "/dang-nhap?message=invalid_account");
			} else if(matKhau == false) {
				getRedirectStrategy().sendRedirect(request, response, "/dang-nhap?message=incorrect_password");
			} else {
				getRedirectStrategy().sendRedirect(request, response, "/dang-nhap?message=error_system");
			}
		}
		
		
				
	}
	
	
}
