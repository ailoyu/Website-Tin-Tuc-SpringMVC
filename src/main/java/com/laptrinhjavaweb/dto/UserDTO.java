package com.laptrinhjavaweb.dto;

import java.sql.Timestamp;

public class UserDTO extends AbstractDTO<UserDTO> {
	private String fullName;
	private String password;
	private String userName;
	private String email;
	private int status;
	private String token;
	private Timestamp validTime;
	private Boolean emailReceived;
	private String avatar;
	private String newPassword;
	private Boolean changePasswordStatus;
	
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getValidTime() {
		return validTime;
	}
	public void setValidTime(Timestamp validTime) {
		this.validTime = validTime;
	}
	public Boolean getEmailReceived() {
		return emailReceived;
	}
	public void setEmailReceived(Boolean emailReceived) {
		this.emailReceived = emailReceived;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public Boolean getChangePasswordStatus() {
		return changePasswordStatus;
	}
	public void setChangePasswordStatus(Boolean changePasswordStatus) {
		this.changePasswordStatus = changePasswordStatus;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	
}
