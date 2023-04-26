package com.laptrinhjavaweb.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.UserRepository;

@Component
public class CustomFailureHandler extends SimpleUrlAuthenticationFailureHandler{
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String username = exception.getAuthentication().getName();
		
		UserEntity userEntity = userRepository.findOneByUserName(username);
		
		if(userEntity.getStatus() == 0) {
			getRedirectStrategy().sendRedirect(request, response, "/dang-nhap?message=invalid_account");
		} else {
			getRedirectStrategy().sendRedirect(request, response, "/dang-nhap?message=incorrect_username_password");
		}
				
	}
	
	
}
