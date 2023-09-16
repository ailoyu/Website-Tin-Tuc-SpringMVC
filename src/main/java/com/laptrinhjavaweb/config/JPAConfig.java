package com.laptrinhjavaweb.config;

import java.util.Properties;
import java.util.ResourceBundle;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration // Bật java config của spring framework
@EnableJpaRepositories(basePackages = {"com.laptrinhjavaweb.repository"}) // khai báo để dùng JPArepository
@EnableTransactionManagement   // Tự động đóng mở Transaction
public class JPAConfig {
	
	ResourceBundle resourceBundle = ResourceBundle.getBundle("db");
	
	// Khởi tạo Entity Manager Factory
	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
		// Thông tin driverName, url db, username, password
		em.setDataSource(dataSource());
		// // Khởi tạo Persistence trong file persistence.xml (chất xúc tác từ class.java -> table trong db)
		em.setPersistenceUnitName("persistence-data"); 
		JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		em.setJpaVendorAdapter(vendorAdapter);
		// Bật tính năng tự động tạo table trong db 
		em.setJpaProperties(additionalProperties());
		return em;
	}
	
	// Khởi tạo Entity Transaction
	@Bean
	JpaTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(entityManagerFactory);
		return transactionManager;
	}
	
	
	@Bean
	public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
		return new PersistenceExceptionTranslationPostProcessor();
	}
	
	// Thông tin driverName, url db, username, password
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(resourceBundle.getString("driverName"));
		dataSource.setUrl(resourceBundle.getString("url"));
		dataSource.setUsername(resourceBundle.getString("user"));
		dataSource.setPassword(resourceBundle.getString("password"));
		return dataSource;
	}
	
	Properties additionalProperties() {
		Properties properties = new Properties();
		//create-drop: cơ chế tự động drop rồi tạo lại table (STOP SERVER TỰ ĐỘNG MẤT HẾT TABLE)
//		properties.setProperty("hibernate.hbm2ddl.auto", "create-drop"); 
		//properties.setProperty("hibernate.hbm2ddl.auto", "create"); 
		//properties.setProperty("hibernate.hbm2ddl.auto", "update");
		properties.setProperty("hibernate.hbm2ddl.auto", "none");
		properties.setProperty("hibernate.enable_lazy_load_no_trans", "true"); // config lazy loading
		return properties;
	}
	
}
