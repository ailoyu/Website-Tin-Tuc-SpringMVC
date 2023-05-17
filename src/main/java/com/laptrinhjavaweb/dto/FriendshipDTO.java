package com.laptrinhjavaweb.dto;

public class FriendshipDTO extends AbstractDTO<FriendshipDTO>{
	
	private Long requesterId;
	
	private Long addresseeId;
	
	private Boolean status;

	public Long getRequesterId() {
		return requesterId;
	}

	public void setRequesterId(Long requesterId) {
		this.requesterId = requesterId;
	}

	public Long getAddresseeId() {
		return addresseeId;
	}

	public void setAddresseeId(Long addresseeId) {
		this.addresseeId = addresseeId;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}
}
