<%@page import="com.laptrinhjavaweb.util.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="myTags"%>
<c:url var="friendAPI" value="/api/friend" />
<c:url var="likeAPI" value="/api/like" />
<c:url var="postAPI" value="/api/post" />
<c:url var="commentPostAPI" value="/api/commentPost" />
<c:url var="personalInfo" value="/trang-ca-nhan" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang cá nhân</title>
</head>
<body>
<div class="container">
	<br>
	<br>
	<div class="text-center">
		<h1>TRANG CÁ NHÂN</h1>
	</div>

	<c:if test="${not empty message }">
		<div class="alert alert-${alert}">${message}</div>
	</c:if>


	<div class="row">
		<div class="col-md-6" style="margin-bottom: 3em">
			<br>
			<div
				style="margin-left: auto; margin-right: auto; text-align: center">
				<img src="${ model.avatar }" class="rounded-circle mb-3"
					style="width: 150px;" alt="Avatar" id="img_preview" />
				<h5 class="mb-2">
					<strong>${ model.fullName }</strong>
				</h5>
				<p class="text-muted">
					@${ model.userName } <span class="badge bg-primary"></span>
				</p>
				<%
				String userName = request.getAttribute("userName").toString();
				%>
				<%
				if (SecurityUtils.getPrincipal() != null) {
				%>
				<%
				if (!SecurityUtils.getPrincipal().getUsername().equals(userName)) {
				%>
				<form id="formSubmit" style="display: inline-block;">
					<c:if test="${ friend.status == null && friend1.status == null }">
						<input type="hidden" name="requesterId" id="requesterId"
							value="<%=SecurityUtils.getPrincipal().getId()%>">
						<input type="hidden" name="addresseeId" id="addresseeId"
							value="${model.id }">
						<input name="addFriend" id="addFriend" type="submit"
							class="btn btn-primary btn-rounded" style="color: white;"
							value="Kết bạn">
					</c:if>
					<c:if test="${ friend.status == false }">
						<input type="hidden" name="requesterId" id="requesterId"
							value="<%=SecurityUtils.getPrincipal().getId()%>">
						<input type="hidden" name="addresseeId" id="addresseeId"
							value="${model.id }">
						<input name="addFriend" id="addFriend" type="submit"
							class="btn btn-primary btn-rounded" style="color: white;"
							value="Hủy kết bạn">
					</c:if>
					<c:if test="${ friend1.status == false }">
						<input type="hidden" name="requesterId" id="requesterId"
							value="${model.id }">
						<input type="hidden" name="addresseeId" id="addresseeId"
							value="<%=SecurityUtils.getPrincipal().getId()%>">
						<input name="addFriend" id="addFriend" type="submit"
							class="btn btn-primary btn-rounded" style="color: white;"
							value="Chấp nhận lời mời kết bạn">
					</c:if>
				</form>
				<c:if test="${ friend.status == true }">
					<input type="hidden" name="requesterId" id="requesterId"
						value="<%=SecurityUtils.getPrincipal().getId()%>">
					<input type="hidden" name="addresseeId" id="addresseeId"
						value="${model.id }">
					<button data-toggle="tooltip" id="unfriend" type="button"
						onclick="warningBeforeDelete()"
						class="btn btn-primary btn-rounded" style="color: white;">Bạn
						bè</button>
				</c:if>
				<c:if test="${ friend1.status == true }">
					<input type="hidden" name="requesterId" id="requesterId"
						value="<%=SecurityUtils.getPrincipal().getId()%>">
					<input type="hidden" name="addresseeId" id="addresseeId"
						value="${model.id }">
					<button data-toggle="tooltip" id="unfriend" type="button"
						onclick="warningBeforeDelete()"
						class="btn btn-primary btn-rounded" style="color: white;">Bạn
						bè</button>
				</c:if>
				<a href='<c:url value="/tin-nhan" />' type="button"
					class="btn btn-primary btn-rounded" style="color: white;">Gửi
					tin nhắn</a>
				<%
				} else {
				%>
				<a class="btn btn-primary btn-rounded"
					href="<c:url value='/thay-doi-thong-tin' />" style="color: white;">Chỉnh
					sửa trang cá nhân</a>
				<%
				}
				%>
				<%
				}
				%>
			</div>
		</div>
		<div class="col-md-6">
			<div class="mb-3">
				<label class="form-label"><strong>Họ Và Tên</strong> </label> <input
					type="text" class="form-control" id="fullName" name="fullName"
					value="${ model.fullName }" disabled="disabled">
			</div>
			<div class="mb-3">
				<label class="form-label"><strong>Ngày tạo tài
						khoản</strong> </label><br>
				<fmt:formatDate pattern="dd-MM-yyyy | HH:mm"
					value="${model.createdDate}" />
			</div>

			<div class="mb-3">
				<label for="email" class="form-label"><strong>Email</strong></label>
				<input type="email" class="form-control" id="email" name="email"
					value="${ model.email }" disabled="disabled">
			</div>
			<hr />

		</div>

		<br> <br> <br>
	</div>
	<c:if test="${ empty listFriend1 }">
		<div class="row">
			<div class="col-md-4 col-lg-4"
				style="margin-left: auto; margin-right: auto; text-align: center">
				<div class="card">
					<div class="header">
						<h4>
							<a
								href='<c:url value="/trang-ca-nhan/${model.id }/danh-sach-ban-be" />'><strong
								style="color: graytext;">Danh sách bạn bè</strong></a>
						</h4>
					</div>
					<div class="body">
						<ul class="new_friend_list list-unstyled row">
							<c:forEach var="item" items="${listFriend }">
								<li class="col-lg-4 col-md-2 col-sm-6 col-4"><a
									href='<c:url value="/trang-ca-nhan/${ item.id }" />'> <img
										width="120em" src="${ item.avatar }" class="img-thumbnail"
										alt="User Image">
										<h6 class="users_name">${ item.fullName}</h6>
								</a></li>
							</c:forEach>


						</ul>
					</div>
				</div>

			</div>
			<div class="col-md-7" id="contentPost">
				<%
				if (SecurityUtils.getPrincipal() != null) {
				%>
				<%
				if (SecurityUtils.getPrincipal().getUsername().equals(userName)) {
				%>
				<h4 align="center"><strong style="color: graytext;">Đăng bài viết</strong></h4>
				<form id="formSubmitStatus" class="panel-activity__status">
					<img src=""
						class="mb-3 img-fluid" style="width: 300px; display:block; margin-left: auto; margin-right: auto;" id="img_preview1" />
					<input id="thumbnail" name="thumbnail" type="file" onchange="previewFile()" style="visibility: hidden;">
                    <textarea name="content" id="content"
                    placeholder="What've you been up to, ${ name }?" 
                    rows="4" class="form-control"></textarea>
                    <input type="hidden" name="userId" value="<%=SecurityUtils.getPrincipal().getId()%>">
                    <div class="actions">
                            <button type="button" onclick="document.getElementById('thumbnail').click(); return false;"
                            class="btn-link" title="" data-toggle="tooltip" data-original-title="Post an Image">
                                <i class="fa fa-image"></i>
                            </button>
                            
                        <button type="button" id="btnPostStatus" class="btn btn-sm btn-rounded btn-info" style="margin-left: 42em">
                            Post
                        </button>
                    </div>
                </form>
                <br>
                <hr />
			<% } %>
			<% } %>
			
			<c:if test="${ empty listPost }">
				<h4 align="center" style="margin-top: 3em"><strong style="color: graytext;">Người dùng chưa có bài viết nào</strong></h4>
			</c:if>

			<c:forEach var="item" items="${listPost }">
				<div class="container mt-5 mb-5">
					<div class="row d-flex align-items-center justify-content-center">
						<div class="card">
							<div class="d-flex justify-content-between p-2 px-3">
								<div class="d-flex flex-row align-items-center">
									<a href='<c:url value="/trang-ca-nhan/${ item.userId }" />' style="color: #473C3C;">
									<img src="${ item.avatar }" width="50"
										class="rounded-circle">
									<div class="d-flex flex-column ml-2">
										<span class="font-weight-bold">${ item.fullName }</span> 
										<small><a href="" style="color: black;"><fmt:formatDate
											pattern="dd-MM-yyyy HH:mm" value="${item.createdDate}" /></a></small>
									</div>
									</a>
								</div>
								<%
								if (SecurityUtils.getPrincipal() != null) {
								%>
								<%
								if (SecurityUtils.getPrincipal().getUsername().equals(userName)) {
								%>
								<div class="d-flex flex-row mt-1 ellipsis">
									<a
									class="fa fa-ellipsis-h"
									href="" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"></a>
									<ul class="dropdown-menu">
										<li><button class="dropdown-item" type="button" 
										>Chỉnh sửa bài viết</button></li>
										<li><hr class="dropdown-divider"></li>
										<li><button class="dropdown-item" id="btnDelete-${item.id }" value="${item.id }" type="button" 
										>Xóa bài viết</button></li>
									</ul>
								</div>
								<% } } %>
							</div>
							<c:if test="${ not empty item.thumbnail }">
								<p class="text-justify">${ item.content }</p>
								<img src="${ item.thumbnail }" class="img-fluid">
							</c:if>
							<c:if test="${ empty item.thumbnail }">
								<h1 class="text-justify" style="margin-left: 5px">${ item.content }</h1>
							</c:if>
							<div class="p-2">
								<hr>
								<div class="d-flex justify-content-between align-items-center">
									<div class="d-flex flex-row icons d-flex align-items-center">
									<form id="likeFormSubmit-${item.id }">
									<% if(SecurityUtils.getPrincipal() != null) { %>
										<input type="hidden" name="userId" id="userId"
							value="<%=SecurityUtils.getPrincipal().getId()%>">
									<input type="hidden" name="postId" id="postId"
							value="${item.id}">
									<% } %>
									<c:if test="${ item.liked != true }">
										<i id="likeButton-${item.id }" class="far fa-heart" style="color: #FF69B4;">
										
										
										</i>
										
										<a id="likeCount-${ item.id }" style="color: #FF69B4; font-weight: bold; font-size: 25px"
										class="tags" data-gloss="<c:forEach var="user" items="${item.likes}">${user.userDTO.fullName}&#10;</c:forEach>"
										
										>${ item.likes.size() }</a>
									</c:if>
									<c:if test="${ item.liked == true }">
										<i id="likeButton-${item.id }" class="fa fa-heart" style="color: #FF69B4;">
										</i>
										
										<a id="likeCount-${ item.id }" style="color: #FF69B4; font-weight: bold; font-size: 25px"
										class="tags" data-gloss="<c:forEach var="user" items="${item.likes}">${user.userDTO.fullName}&#10;</c:forEach>"
										
										>${ item.likes.size() }</a>
									</c:if>
									</form>
									</div>
									<div class="d-flex flex-row muted-color">
										<a id="commentCount-${ item.id }">${ item.comments.size() }</a> &#160;comments
									<span class="ml-2">Share</span>
									</div>
								</div>
								<hr>
								<div id="comments-${ item.id }" class="comments" style="overflow-y: scroll; overflow-x: hidden; 
								display: flex; flex-direction: column;max-height: 350px;">
								<c:forEach var="item2" items="${ item.comments }">
									<div class="d-flex flex-row" style="margin-bottom: 10px">
									<a href='<c:url value="/trang-ca-nhan/${ item2.userId }" />'>
										<img src="${ item2.avatar }" width="40"
											class="rounded-image">
									</a>
										<div class="d-flex flex-column ml-2">
										<a href='<c:url value="/trang-ca-nhan/${ item2.userId }" />' style="color: #473C3C;">
											<span class="name">${item2.fullName }</span>
											</a>
												<c:if test="${ not empty item2.thumbnail }">
												<img src="${ item2.thumbnail }"	class="mb-3 img-fluid" style="width: 100px; margin-right: 30em;"/>
												</c:if>
												${ item2.content }
											<div class="d-flex flex-row align-items-center status">
												<small>Like</small> <small>Reply</small> <small>Translate</small>
												<small>18 mins</small>
											</div>
										</div>
										<div class="card-body p-4" style="margin-left: 3em">
<%-- 										<myTags:folderGroupsCommentPost item="${item}"></myTags:folderGroupsCommentPost> --%>
										</div>
									</div>
								</c:forEach>
									<div id="commentArea-${ item.id }">
									
									</div>
								</div>
								<%
										if (SecurityUtils.getPrincipal() != null) {
									%>
									<div class="comment-input">
									<form id="commentSubmit-${ item.id }">
										<input type="hidden" name="userId"
											value="<%= SecurityUtils.getPrincipal().getId() %>">
										<input type="hidden" name="postId"
											value="${ item.id }">
											
										<img src=""	class="mb-3 img-fluid" style="width: 100px; margin-right: 30em;" id="img_preview-${item.id }" />
										<textarea id="content1-${ item.id }" name="content" class="form-control" placeholder="Nhập bình luận ở đây..."></textarea>
										<div class="fonts">
								
					
										</div>
                             <div class="actions">
	                            <button type="button" onclick="document.getElementById('thumbnail-${ item.id }').click(); return false;"
	                            class="btn-link fa fa-image" title="" data-toggle="tooltip" data-original-title="Post an Image" style="margin-top: 15px; display: inline-block;">
	                            </button>
	                            <input id="thumbnail-${ item.id }" name="thumbnail" type="file" onchange="previewFile2(${item.id })" style="visibility: hidden;">
		                        <input type="button" id="btnSubmitComment-${ item.id }" 
		                        class="btn btn-sm btn-rounded btn-info" 
		                        style="margin-left: 14em"
		                        value="Post">
                  		  	</div>
										</form>
									</div>
									<% } %>
							</div>
						</div>
					</div>
				</div>
				
				
			</c:forEach>
			
			
<!-- 			<button onclick="loadMore()" class="btn btn-primary">Load more</button> -->

			</div>

		</div>
	</c:if>
	<c:if test="${ not empty listFriend1 }">
		<div class="row">
			<h4>
				<a
					href='<c:url value="/trang-ca-nhan/${model.id }/danh-sach-ban-be" />'><strong
					style="color: graytext;">Danh sách bạn bè</strong></a>
			</h4>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="people-nearby">
							<c:forEach var="item" items="${ listFriend1 }">

								<div class="nearby-user">
									<div class="row ">
										<div class="col-md-2 col-sm-2">
											<a href='<c:url value="/trang-ca-nhan${ item.id }" />'> <img
												src="${ item.avatar }" alt="user" class="profile-photo-lg">
											</a>
										</div>
										<div class="col-md-7 col-sm-7">
											<a href='<c:url value="/trang-ca-nhan/${ item.id }" />'>
												<h5>${item.fullName }</h5>
												<p class="text-muted">@${item.userName }</p>
											</a>
										</div>
										<div class="col-md-3 col-sm-3">
											<button class="btn btn-primary pull-right">Add
												Friend</button>
										</div>
									</div>
								</div>
								</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

		</div>
	</c:if>
</div>


	<script type="text/javascript">

	function loadMore() {
		$.ajax({
			url: "<c:url value="/load/${model.id}" />",
			type: "GET",
			success: function(data) {
				var row = "";
				
				$.each(data, function (i, post) {

					row += '<tr><td>' + post.id + '</td><td>' + teacher.content + '</td><td>' + teacher.thumbnail + '</td></tr>';
	            });
				$('#contentPost').append(row);

			},
			error: function(xhr) {
				
			}
		});
	}
	
	$( document ).ready(function() {
		$("div[id*='comments-']").scrollTop(function() {
			return this.scrollHeight;
		});
	});


	
	
	
	function previewFile() {
		const preview = document.querySelector('#img_preview1');
		const file = document.querySelector('#thumbnail').files[0];
		const reader = new FileReader();
		reader.addEventListener("load", function () {
			
			// convert image file to base64 string
			preview.src = reader.result;
			
		}, false);
		
		if(file){
			reader.readAsDataURL(file);
		}
		
	}
	
	function previewFile2(postId) {
		const preview = document.querySelector('#img_preview-'+postId);
		const file = document.querySelector('#thumbnail-'+postId).files[0];
		const reader = new FileReader();
		reader.addEventListener("load", function () {
			
			// convert image file to base64 string
			preview.src = reader.result;
			
		}, false);
		
		if(file){
			reader.readAsDataURL(file);
		}
		
	}
	
	
	$("i[id*='likeButton-']").click(function (e) {
		let postId = $(this).prop("id").split("-")[1];
		var formData = $('#likeFormSubmit-' + postId).serializeArray();
		var data = {};
		$.each(formData, function (i, v) {
			data[""+v.name+""] = v.value;
		});
		var classLikeButton = $('#likeButton-'+postId).attr('class');
		if(classLikeButton == 'far fa-heart'){ // chưa like -> thì like
			data["status"] = "LIKE";
			addLike(data, postId);
		} else { 							   // like rồi thì unlike
			deleteLike(data, postId)
		}
		
	});
	
	function addLike(data, postId) {
		$.ajax({
			url : '${likeAPI}', // gửi tới url api
			type : 'POST',
			contentType : 'application/json', // ép kiểu json từ client -> server
			data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
			dataType : 'json', // nhận kiểu json từ server -> client
			success : function(result) {
				$('#likeButton-'+postId).attr('class', 'fa fa-heart');
				var p = $('#likeCount-'+postId).attr('data-gloss');
				$('#likeCount-'+postId).attr('data-gloss', '<%= SecurityUtils.getPrincipal().getFullName() %>\n' + p);
				// tăng số lượng like + 1
				var likeCount = document.getElementById("likeCount-"+postId).innerHTML;
				document.getElementById("likeCount-"+postId).innerHTML = parseInt(likeCount) + 1;
			},
			error : function(error) {

			}
		});
	}
	
	function deleteLike(data, postId) {
		$.ajax({
			url : '${likeAPI}', // gửi tới url api
			type : 'DELETE',
			contentType : 'application/json', // ép kiểu json từ client -> server
			data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
			dataType : 'json', // nhận kiểu json từ server -> client
			success : function(result) {
				$('#likeButton-'+postId).attr('class', 'far fa-heart');
				var p = $('#likeCount-'+postId).attr('data-gloss');
				const myArray = p.split("\n");
				myArray.pop();
				
				for(let i = 0; i <= myArray.length - 1; i++){
					if(myArray[i] == "<%= SecurityUtils.getPrincipal().getFullName() %>"){
						for(let j = i; j < myArray.length - 1; j++){
							myArray[j] = myArray[j + 1]; 
						}
						myArray.pop();
					}	
				}
				
				const listName = myArray.map(x => x + '\n');
				
				
				$('#likeCount-'+postId).attr('data-gloss', listName.join(""));
				
				
				var likeCount = document.getElementById("likeCount-"+postId).innerHTML;
				document.getElementById("likeCount-"+postId).innerHTML = parseInt(likeCount) - 1;
			},
			error : function(error) {

			}
		});
	}
	
	$("input[id*='btnSubmitComment-']").click(function(e) {
		e.preventDefault(); // Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
		let commentId = $(this).prop("id").split("-")[1]

		var formData = $('#commentSubmit-' + commentId).serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
		var data = {};
		
		
		data["thumbnail"] = document.querySelector('#img_preview-'+commentId).getAttribute('src');
		
		
		// Chạy vòng lặp bỏ dữ liệu từ formData vào data
		$.each(formData, function (i, v) {
		data[""+v.name+""] = v.value;
		});
		
		addComment(data, commentId);
		
	});
	
	
	function addComment(data, commentId) {
		$.ajax({
			url : '${commentPostAPI}', // gửi tới url api
			type : 'POST',
			contentType : 'application/json', // ép kiểu json từ client -> server
			data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
			dataType : 'json', // nhận kiểu json từ server -> client
			success : function(result) {
				<% if(SecurityUtils.getPrincipal() != null){ %>
				$( document ).ready(function() {
					$("div[id*='comments-']").scrollTop(function() {
						return this.scrollHeight;
					});
				});
				$('#content1-'+result.postId).val('');
				$('#img_preview-'+result.postId).attr('src', '');
				var commentCount = document.getElementById("commentCount-"+result.postId).innerHTML;
				document.getElementById("commentCount-"+result.postId).innerHTML = parseInt(commentCount) + 1;
				
					if(result.thumbnail != null){
						$('#commentArea-'+commentId).append('<div class="d-flex flex-row" style="margin-bottom: 10px">'+
								'<img src="<%= SecurityUtils.getPrincipal().getAvatar() %>" width="40"'+
						'class="rounded-image">'+
								'<div class="d-flex flex-column ml-2">'+
								'<span class="name"><%= SecurityUtils.getPrincipal().getFullName() %></span>'+
						'<img src="'+ result.thumbnail +'" class="mb-3 img-fluid" style="width: 100px; margin-right: 30em;"/>'+
						result.content +
						'<div class="d-flex flex-row align-items-center status">'+
							'<small>Like</small> <small>Reply</small> <small>Translate</small>'+
							'<small>18 mins</small>'+
						'</div></div></div>');
					} else {
						$('#commentArea-'+commentId).append('<div class="d-flex flex-row" style="margin-bottom: 10px">'+
								'<img src="<%= SecurityUtils.getPrincipal().getAvatar() %>" width="40"'+
						'class="rounded-image">'+
								'<div class="d-flex flex-column ml-2">'+
								'<span class="name"><%= SecurityUtils.getPrincipal().getFullName() %></span>'+
						result.content +
						'<div class="d-flex flex-row align-items-center status">'+
							'<small>Like</small> <small>Reply</small> <small>Translate</small>'+
							'<small>18 mins</small>'+
						'</div></div></div>');
					}
				
				<% } %>
					
				
			},
			error : function(error) {
				window.location.href = "${personalInfo}/${model.id}";
			}
		});
	}
	
	$('#btnPostStatus').click(function (e) {
	       e.preventDefault(); 	// Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
	       						// cần truyền vào url: /api/new


	       	var formData = $('#formSubmitStatus').serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
	       	var data = {};
	       	
	       	
	       	data["thumbnail"] = document.querySelector('#img_preview1').getAttribute('src');


	       	// Chạy vòng lặp bỏ dữ liệu từ formData vào data
	       	$.each(formData, function (i, v) {
  			data[""+v.name+""] = v.value;
			});
	       	
	       	
	       	addPost(data);
	       	
	   });	
	
	
	function addPost(data) {
		$.ajax({
			url : '${postAPI}', // gửi tới url api
			type : 'POST',
			contentType : 'application/json', // ép kiểu json từ client -> server
			data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
			dataType : 'json', // nhận kiểu json từ server -> client
			success : function(result) {
				window.location.href = "${personalInfo}/${model.id}";
			},
			error : function(error) {
				window.location.href = "${personalInfo}/${model.id}";
			}
		});
	}
	
	
		$('#addFriend').click(function(e) {

			e.preventDefault(); // Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng

			// cần truyền vào url: /api/new
			var formData = $('#formSubmit').serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
			var data = {};

			// Chạy vòng lặp bỏ dữ liệu từ formData vào data
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});

			var buttonAddFriend = $('#addFriend').val();
			if (buttonAddFriend == 'Chấp nhận lời mời kết bạn') {
				data["status"] = true;
			}

			addFriend(data);

		});

		function addFriend(data) {
			$.ajax({
				url : '${friendAPI}', // gửi tới url api
				type : 'POST',
				contentType : 'application/json', // ép kiểu json từ client -> server
				data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
				dataType : 'json', // nhận kiểu json từ server -> client
				success : function(result) {
					var buttonAddFriend = $('#addFriend').val();
					if (buttonAddFriend == 'Kết bạn') {
						$('#addFriend').val('Hủy kết bạn');
					} else if (buttonAddFriend == 'Chấp nhận lời mời kết bạn') {
						window.location.href = "${personalInfo}/${model.id}";
					} else if (buttonAddFriend == 'Hủy kết bạn') {
						$('#addFriend').val('Kết bạn');
					}
				},
				error : function(error) {

				}
			});
		}

		function warningBeforeDelete() {
			swal({
				title : "Xác nhận hủy kết bạn",
				text : "Bạn có muốn hủy kết bạn hay không?",
				type : "warning",
				showCancelButton : true,
				confirmButtonClass : "btn-success",
				cancelButtonClass : "btn-danger",
				confirmButtonText : "Xác nhận",
				cancelButtonText : "Hủy bỏ",
			}).then(function(result) {
				if (result.value) {
					var data = {};
					data["requesterId"] = $('#requesterId').val();
					data["addresseeId"] = $('#addresseeId').val();
					unfriend(data);
				}
			});
		}

		function unfriend(data) {
			$.ajax({
				url : '${friendAPI}', // gửi tới url api
				type : 'DELETE',
				contentType : 'application/json', // ép kiểu json từ client -> server
				data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
				dataType : 'json', // nhận kiểu json từ server -> client
				success : function(result) {
					window.location.href = "${personalInfo}/${model.id}";
				},
				error : function(error) {
					window.location.href = "${personalInfo}/${model.id}";
				}
			});
		}
		
		
		$("button[id*='btnDelete-']").click(function(e) {
			
			 var id = $(this).prop("id").split("-")[1];
			 warningBeforeDelete1(id);
		});
		
		function warningBeforeDelete1(id) {
			swal({
				  title: "Xác nhận xóa",
				  text: "Bạn có muốn xóa bài viết hay không?",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonClass: "btn-success",
				  cancelButtonClass: "btn-danger",
				  confirmButtonText: "Xác nhận",
				  cancelButtonText: "Hủy bỏ",
				}).then(function(result) {
					if(result.value){
					// call api
					  deletePost(id);
				  } 
				});
		}
		
		function deletePost(data) {
			$.ajax({
				url : '${postAPI}', // gửi tới url api
				type : 'DELETE',
				contentType : 'application/json', // ép kiểu json từ client -> server
				data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
				dataType : 'json', // nhận kiểu json từ server -> client
				success : function(result) {
					window.location.href = "${personalInfo}/${model.id}";
				},
				error : function(error) {
					window.location.href = "${personalInfo}/${model.id}";
				}
			});
		}
		
	</script>

</body>
</html>