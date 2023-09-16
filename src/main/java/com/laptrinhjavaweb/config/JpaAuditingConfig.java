package com.laptrinhjavaweb.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

@Configuration // Bật java config của spring framework
@EnableJpaAuditing (auditorAwareRef  = "auditorProvider") // Khai báo để dùng Jpa Auditing
public class JpaAuditingConfig {
	// JPA Auditing: tự động cập nhật, ko cần phải dùng setter
	
	@Bean
	public AuditorAware<String> auditorProvider(){
		return new AditorAwareImpl();
	}
	
	public static class AditorAwareImpl implements AuditorAware<String>{

		@Override
		public String getCurrentAuditor() { 
			// get thông tin của username, để cập nhật các field cần thiết
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			if(authentication == null) {
				// Chưa đăng nhập, ko có dữ liệu
				return null;
			}
			return authentication.getName(); // lấy tất cả thông tin của đối tượng đăng nhập
		}
		
	}
	
}


