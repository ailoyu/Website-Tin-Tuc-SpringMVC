package com.laptrinhjavaweb.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@ComponentScan(basePackages = "com.laptrinhjavaweb")
@Import({MessagingConfig.class})
public class AppConfig {

}
