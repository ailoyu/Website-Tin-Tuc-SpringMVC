package com.laptrinhjavaweb.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import com.laptrinhjavaweb.dto.MyUser;

public class SecurityUtils {
	
	
	// get tất cả thông tin từ user
	public static MyUser getPrincipal() { 
		try {
			MyUser myUser = (MyUser) (SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
	        return myUser;
		} catch (Exception e) {
			return null;
		}
		
    }
	
	@SuppressWarnings("unchecked")
	public static List<String> getAuthorities(){
		List<String> results = new ArrayList<String>();
		
		// get Authorities từ class CustomUserDetailsService
		List<GrantedAuthority> authorities = (List<GrantedAuthority>)(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        for (GrantedAuthority authority : authorities) {
            results.add(authority.getAuthority()); // lấy String code: "USER" or "ADMIN"
        }
		return results;
	}
	
}
