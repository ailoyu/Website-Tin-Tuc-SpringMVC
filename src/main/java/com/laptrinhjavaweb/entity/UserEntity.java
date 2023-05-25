package com.laptrinhjavaweb.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class UserEntity extends BaseEntity {
	
	@Column(name = "username")
	private String userName;
	
	@Column(name = "password") //  Cơ chế mã hóa mật khẩu của spring security là MD5
	private String password;
	
	@Column(name = "fullname")
	private String fullName;
	
	@Column(name = "status")
	private Integer status;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "token")
	private String token;
	
	@Column(name = "valid_time")
	private Date validTime;
	
	@Column(name = "emailReceived")
	private Boolean emailReceived;
	
	@Column(name = "avatar")
	private String avatar;
	
	@Column(name = "change_password_status")
	private Boolean changePasswordStatus;
	
	
	// Bảng trung gian tên "user_role", lấy userid và roleid (Chỉ cần bỏ user, ko cần bỏ bên role)
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "userid"), // id của bảng của class user này
									inverseJoinColumns = @JoinColumn(name = "roleid")) // id của class role kia
	private List<RoleEntity> roles = new ArrayList<RoleEntity>();

	@OneToMany(mappedBy = "userEntity")
	private List<ViewCountEntity> views;
	
	@OneToMany(mappedBy = "user")
	private List<CommentEntity> comments = new ArrayList<>();
	
	@OneToMany(mappedBy = "requester")
	private List<FriendshipEntity> requester;
	
	@OneToMany(mappedBy = "addressee")
	private List<FriendshipEntity> addressee;
	
	// 1 user có nhiều bài posts
	@OneToMany(mappedBy = "user") 
	private List<PostEntity> posts = new ArrayList<PostEntity>();
	
	@OneToMany(mappedBy = "user") 
	private List<CommentPostEntity> commentPosts = new ArrayList<CommentPostEntity>();
	
	@OneToMany(mappedBy = "user")
	private List<LikeEntity> likes = new ArrayList<>();
	

	public List<LikeEntity> getLikes() {
		return likes;
	}

	public void setLikes(List<LikeEntity> likes) {
		this.likes = likes;
	}

	public List<CommentPostEntity> getCommentPosts() {
		return commentPosts;
	}

	public void setCommentPosts(List<CommentPostEntity> commentPosts) {
		this.commentPosts = commentPosts;
	}

	public List<FriendshipEntity> getRequester() {
		return requester;
	}

	public void setRequester(List<FriendshipEntity> requester) {
		this.requester = requester;
	}

	public List<FriendshipEntity> getAddressee() {
		return addressee;
	}

	public void setAddressee(List<FriendshipEntity> addressee) {
		this.addressee = addressee;
	}

	public List<ViewCountEntity> getViews() {
		return views;
	}

	public void setViews(List<ViewCountEntity> views) {
		this.views = views;
	}

	public List<CommentEntity> getComments() {
		return comments;
	}

	public void setComments(List<CommentEntity> comments) {
		this.comments = comments;
	}

	public List<RoleEntity> getRoles() {
		return roles;
	}

	public void setRoles(List<RoleEntity> roles) {
		this.roles = roles;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Date getValidTime() {
		return validTime;
	}

	public void setValidTime(Date validTime) {
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
	
	public Boolean getChangePasswordStatus() {
		return changePasswordStatus;
	}

	public void setChangePasswordStatus(Boolean changePasswordStatus) {
		this.changePasswordStatus = changePasswordStatus;
	}

	public List<PostEntity> getPosts() {
		return posts;
	}

	public void setPosts(List<PostEntity> posts) {
		this.posts = posts;
	}
	
	
	
}
