package com.laptrinhjavaweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "views")
public class ViewCountEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	UserEntity userEntity;
	
	@ManyToOne
	@JoinColumn(name = "new_id")
	NewEntity newEntity;
	
	@Column(name = "view_count")
	Long viewCount;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public NewEntity getNewEntity() {
		return newEntity;
	}

	public void setNewEntity(NewEntity newEntity) {
		this.newEntity = newEntity;
	}

	public Long getViewCount() {
		return viewCount;
	}

	public void setViewCount(Long viewCount) {
		this.viewCount = viewCount;
	}
	
}
