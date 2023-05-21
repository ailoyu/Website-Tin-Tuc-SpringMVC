<%@page import="com.laptrinhjavaweb.util.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="friendAPI" value="/api/friend" />
<c:url var="postAPI" value="/api/post" />
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
			<div class="col-md-7">
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
                    <input type="hidden" name="userId" id="userId" value="<%=SecurityUtils.getPrincipal().getId()%>">
                    <div class="actions">
                            <button id="fileButton" type="button" onclick="document.getElementById('thumbnail').click(); return false;"
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
									<a href='<c:url value="/trang-ca-nhan/${ model.id }" />' style="color: #473C3C;">
									<img src="${ model.avatar }" width="50"
										class="rounded-circle">
									<div class="d-flex flex-column ml-2">
										<span class="font-weight-bold">${ model.fullName }</span> 
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
							<p class="text-justify">${ item.content }</p>
							<c:if test="${ not empty item.thumbnail }">
								<img src="${ item.thumbnail }" class="img-fluid">
							</c:if>
							<div class="p-2">
								<hr>
								<div class="d-flex justify-content-between align-items-center">
									<div class="d-flex flex-row icons d-flex align-items-center">
<!-- 										<i class="fa fa-heart" style="color: #FF1493;"></i> -->
										<i class="far fa-heart" style="color: #FF69B4;"></i>
									</div>
									<div class="d-flex flex-row muted-color">
										<span>2 comments</span> <span class="ml-2">Share</span>
									</div>
								</div>
								<hr>
								<div class="comments">
									<div class="d-flex flex-row mb-2">
										<img src="https://i.imgur.com/9AZ2QX1.jpg" width="40"
											class="rounded-image">
										<div class="d-flex flex-column ml-2">
											<span class="name">Daniel Frozer</span>
												I like this alot! thanks alot
											<div class="d-flex flex-row align-items-center status">
												<small>Like</small> <small>Reply</small> <small>Translate</small>
												<small>18 mins</small>
											</div>
										</div>
									</div>
									<div class="d-flex flex-row mb-2">
										<img src="https://i.imgur.com/1YrCKa1.jpg" width="40"
											class="rounded-image">
										<div class="d-flex flex-column ml-2">
											<span class="name">Elizabeth goodmen</span> Thanks for sharing!
											<div class="d-flex flex-row align-items-center status">
												<small>Like</small> <small>Reply</small> <small>Translate</small>
												<small>8 mins</small>
											</div>
										</div>
									</div>
									<div class="comment-input">
										<input type="text" class="form-control">
										<div class="fonts">
											<i class="fa fa-camera"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>


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