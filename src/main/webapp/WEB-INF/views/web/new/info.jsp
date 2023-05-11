<%@page import="com.laptrinhjavaweb.util.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="myTags"%>

<c:url var="commentAPI" value="/api/comment" />
<c:url var="newURL" value="/dang-nhap" />
<c:url var="registerURL" value="/dang-ky" />
<c:url var="info" value="/thong-tin-bai-viet" />
<c:url var="viewCountAPI" value="/api/views" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">



</head>
<body>
	<div class="container">

		<h1 style="text-align: justify">
			<strong> ${model.title }</strong>
		</h1>
		<b>${model.shortDescription}</b> ${model.content}
	</div>
	
	<c:if test="${ not empty recommendForUser }">
	<h2>Đề xuất giành cho bạn</h2>
	<br>
	<br>
	<br>

	<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"> -->
	<div id="carouselExampleControls" class="carousel carousel-dark slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
		
		
			<div class="carousel-item active">
				<div class="card-wrapper container-sm d-flex justify-content-around">
					<c:forEach var="item" items="${ recommendForUser }">	
					<c:url var="editURL" value="/thong-tin-bai-viet">
						<c:param name="id" value="${item.newId}"/>
					</c:url>				
						<div class="card" style="width: 18rem; height: 23.32em">
							<a onclick="myFunction(${item.newId})" href='${editURL }'><img src="${item.thumbnail }"
								class="card-img-top" alt="..."></a>
							<div class="card-body">
								<h5 class="card-title"><a onclick="myFunction(${item.newId})" href='${editURL }'>${ item.title } </a></h5>
								<p class="card-text">${item.shortDescription }</p>
							</div>
						</div>
					</c:forEach>	
				</div>
			</div>
			
			<c:if test="${recommendCategoryForUser.size() >= 3 && recommendCategoryForUser.size() < 6}">
				<div class="carousel-item">
				<div class="card-wrapper container-sm d-flex justify-content-around">
				<c:forEach var="item" begin="0" end="2" items="${ recommendCategoryForUser }">
					<c:url var="editURL" value="/thong-tin-bai-viet">
						<c:param name="id" value="${item.id}"/>
					</c:url>				
						<div class="card" style="width: 18rem; height: 23.32em">
							<a onclick="myFunction(${item.id})" href='${editURL }'><img src="${item.thumbnail }"
								class="card-img-top" alt="..."></a>
							<div class="card-body">
								<h5 class="card-title"><a onclick="myFunction(${item.id})" href='${editURL }'>${ item.title } </a></h5>
								<p class="card-text">${item.shortDescription }</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			</c:if>
			
			
			
			<c:if test="${recommendCategoryForUser.size() >= 6 }">
				<div class="carousel-item">
				<div class="card-wrapper container-sm d-flex justify-content-around">
				<c:forEach var="item" begin="${recommendCategoryForUser.size() - 3}" end="${recommendCategoryForUser.size() - 1}" items="${ recommendCategoryForUser }">
					<c:url var="editURL" value="/thong-tin-bai-viet">
						<c:param name="id" value="${item.id}"/>
					</c:url>				
						<div class="card" style="width: 18rem; height: 23.32em">
							<a onclick="myFunction(${item.id})" href='${editURL }'><img src="${item.thumbnail }"
								class="card-img-top" alt="..."></a>
							<div class="card-body">
								<h5 class="card-title"><a onclick="myFunction(${item.id})" href='${editURL }'>${ item.title } </a></h5>
								<p class="card-text">${item.shortDescription }</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="carousel-item">
				<div class="card-wrapper container-sm d-flex justify-content-around">
				<c:forEach var="item" begin="${recommendCategoryForUser.size() - 6}" end="${recommendCategoryForUser.size() - 4}" items="${ recommendCategoryForUser }">
					<c:url var="editURL" value="/thong-tin-bai-viet">
						<c:param name="id" value="${item.id}"/>
					</c:url>				
						<div class="card" style="width: 18rem; height: 23.32em">
							<a onclick="myFunction(${item.id})" href='${editURL }'><img src="${item.thumbnail }"
								class="card-img-top" alt="..."></a>
							<div class="card-body">
								<h5 class="card-title"><a onclick="myFunction(${item.id})" href='${editURL }'>${ item.title } </a></h5>
								<p class="card-text">${item.shortDescription }</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			
			
			
			</c:if>
			
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
			
			

			
			
			
		</div>
	</div>
	

	<br>
	<br>
	<br>
	</c:if>
	




	

	<button class="btn btn-primary" id="hiddenComments" type="button">Hiển thị
		tất cả bình luận của bài viết</button>
	<br>
	<br>
	<br>


	<div hidden="true" id="comments">
		<h1>Comment</h1>

		<%
		if (SecurityUtils.getPrincipal() != null) {
		%>
		<img class="rounded-circle shadow-1-strong me-3"
			src="<%=SecurityUtils.getPrincipal().getAvatar()%>" alt="avatar"
			width="60" height="60" style="display: inline-block" /> <b><%=SecurityUtils.getPrincipal().getFullName()%></b><br>
		<br>
		<form method="post" id="formSubmit">
			<textarea class="form-control" rows="5" cols="140"
				placeholder="Enter your comment..." name="content"></textarea>

			<input type="hidden"
				value="<%=SecurityUtils.getPrincipal().getId()%>" name="userId">
			<input type="hidden" value="${model.id}" name="newId"> <br>
			<br> <input class="btn btn-primary" type="button"
				id="btnComment" value="Bình Luận">
		</form>
		<%
		} else {
		%>
		<h5>Vui lòng đăng nhập để có thể bình luận!</h5>
		<%
		}
		%>




		<section style="background-color: #ad655f;">
			<div class="container my-5 py-5">
				<div class="row d-flex justify-content-center">
					<div class="col-md-12 col-lg-10">
						<div class="card text-dark">
							<h4 class="mb-0">Recent comments</h4>
							<p class="fw-light mb-4 pb-2">Latest Comments section by
								users</p>
							<c:forEach var="item" items="${comment.listComment}">
								<c:if test="${item.parentId == null}">
									<div class="card-body p-4">
										<div class="d-flex flex-start">
											<img class="rounded-circle shadow-1-strong me-3"
												src="${ item.avatar }" alt="avatar" width="60" height="60" />
											<div>
												<b>${ item.fullName }</b>
												<h6 class="fw-bold mb-1"></h6>
												<div class="d-flex align-items-center mb-3">
													<p class="mb-0">
														<c:set var="today" value="${item.createdDate }" />
														<span class="badge bg-success"><fmt:formatDate
																pattern="dd-MM-yyyy HH:mm" value="${today}" /></span>
													</p>
													<a href="#!" class="link-muted"><i
														class="fas fa-pencil-alt ms-2"></i></a> <a href="#!"
														class="link-muted"><i class="fas fa-redo-alt ms-2"></i></a>
													<a href="#!" class="link-muted"><i
														class="fas fa-heart ms-2"></i></a>
												</div>
												<p class="mb-0">${item.content }</p>
												<%
												if (SecurityUtils.getPrincipal() != null) {
												%>
												<div
													class="d-flex justify-content-between align-items-center">
													<p class="small mb-0" style="color: #aaa;">
														<button class="btn btn-link" id="replyBtn-${item.id}">Reply</button>
													</p>
													<br>
													<br>
													<div class="d-flex flex-row">
														<i class="far fa-check-circle text-primary"></i>
													</div>

												</div>
												<form class="d-none" method="post" id="replyForm-${item.id}">
													<textarea class="form-control" rows="3" cols="50"
														placeholder="Enter your comment..." id="content1"
														name="content"></textarea>

													<input type="hidden"
														value="<%=SecurityUtils.getPrincipal().getId()%>"
														name="userId"> <input type="hidden"
														value="${model.id}" name="newId"> <input
														type="hidden" value="${item.id}" name="parentId">
													<br> <br> <input class="btn btn-primary"
														type="button" id="btnComment-${item.id}" value="Bình Luận"><br>
													<br>
													<br>
												</form>
												<%
												}
												%>
											</div>
										</div>
										<myTags:folderGroups item="${item}"></myTags:folderGroups>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>
	<script type="text/javascript">
		$("#hiddenComments").click(function() {
			var commentStatus = $("#comments").attr("hidden")
			if (commentStatus == "hidden") {
				$("#comments").attr("hidden", false);
				$("#hiddenComments").html('Ẩn tất cả bình luận của bài viết');
			}else{	
				$("#comments").attr("hidden", true);
				$("#hiddenComments").html('Hiển thị tất cả bình luận của bài viết');
			}

		})
		
		// Xử lý đóng mở reply comment
		$(function() {
			$("button[id*='replyBtn-']").click(function() {
				$("form[id*='replyForm-']:not(.d-none)").each(function() {
					let commentId = $(this).prop("id").split("-")[1]
					let formId = "replyForm-" + commentId
					console.log("formId: " + formId + " đang được ẩn!")
					$("#" + formId).addClass("d-none")
				})

				let commentId = $(this).prop("id").split("-")[1]
				let formId = "replyForm-" + commentId

				$("#" + formId).removeClass("d-none")
			})
		})
		
		// Gửi comment khi ko có comment con
		$('#btnComment').click(function(e) {
			e.preventDefault(); // Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
			// cần truyền vào url: /api/new

			var formData = $('#formSubmit').serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
			var data = {};

			// Chạy vòng lặp bỏ dữ liệu từ formData vào data
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});

			addNew(data);

		});

		// Gửi comment khi reply comment
		$("input[id*='btnComment-']").click(function(e) {
			e.preventDefault(); // Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
			// cần truyền vào url: /api/new
			let commentId = $(this).prop("id").split("-")[1]
			var formData = $('#replyForm-' + commentId).serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
			var data = {};

			// Chạy vòng lặp bỏ dữ liệu từ formData vào data
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});

			addNew(data);

		});

		function addNew(data) {
			$.ajax({
				url : '${commentAPI}', // gửi tới url api
				type : 'POST',
				contentType : 'application/json', // ép kiểu json từ client -> server
				data : JSON.stringify(data), // parse từ JavaScript Object -> JSON
				dataType : 'json', // nhận kiểu json từ server -> client
				success : function(result) {
					window.location.href = "${info}?id=${ model.id }";
				},
				error : function(error) {
					window.location.href = "${info}?id=${ model.id }";
				}
			});
		}
		
		
		<% if (SecurityUtils.getPrincipal() != null){ %>
		function myFunction(newId) {
			var data = {};
			data["userId"] = <%= SecurityUtils.getPrincipal().getId() %>;
			data["newId"] = newId;
			
			addView(data);
		}
		
		function addView(data) {
			$.ajax({
				url : '${viewCountAPI}', // gửi tới url api
				type : 'POST',
				contentType : 'application/json', // ép kiểu json từ client -> server
				data : JSON.stringify(data), // parse từ JavaScript Object -> JSON
				dataType : 'json', // nhận kiểu json từ server -> client
				success : function(result) {
					console.log("Thành công");
				},
				error : function(error) {
					console.log("Thất bại");
				}
			});
		}
	
	<% } %>
	</script>

</body>
</html>