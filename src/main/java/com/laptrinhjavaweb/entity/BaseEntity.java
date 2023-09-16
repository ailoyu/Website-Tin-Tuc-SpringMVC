package com.laptrinhjavaweb.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;


@MappedSuperclass // Định nghĩa parent class cho tất cả các class
@EntityListeners(AuditingEntityListener.class) // JPA Auditing để tự động cập nhật, ko cần phải dùng setter
public abstract class BaseEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // Tự động tăng 
	private Long id;
	
	@Column(name = "createddate")
	@CreatedDate // tự động set ngày tạo khi cập nhật, thêm
	private Date createdDate;
	
	@Column(name = "modifieddate")
	@LastModifiedDate // tự động set ngày thay đổi khi cập nhật, thêm
	private Date modifiedDate;
	
	@Column(name = "createdby")
	@CreatedBy  // tự động set khi cập nhật, thêm
	private String createdBy;
	
	@Column(name = "modifiedby")
	@LastModifiedBy  // tự động set khi cập nhật, thêm
	private String modifiedBy;

	public Long getId() {
		return id;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}


	public String getCreatedBy() {
		return createdBy;
	}


	public String getModifiedBy() {
		return modifiedBy;
	}


	public void setId(Long id) {
		this.id = id;
	}
	
}
