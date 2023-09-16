package com.laptrinhjavaweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "friendship")
public class FriendshipEntity extends BaseEntity {
	
	@ManyToOne
	@JoinColumn(name = "requester_id")
	private UserEntity requester;
	
	@ManyToOne
	@JoinColumn(name = "addressee_id")
	private UserEntity addressee;
	
	@Column(name = "status")
	private Boolean status;

	public UserEntity getRequester() {
		return requester;
	}

	public void setRequester(UserEntity requester) {
		this.requester = requester;
	}

	public UserEntity getAddressee() {
		return addressee;
	}

	public void setAddressee(UserEntity addressee) {
		this.addressee = addressee;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}
	
}
