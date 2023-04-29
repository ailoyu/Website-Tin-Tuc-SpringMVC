<%@page import="com.laptrinhjavaweb.util.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="myTags"%>

<c:url var="commentAPI" value="/api/comment" />
<c:url var="newURL" value="/dang-nhap" />
<c:url var="registerURL" value="/dang-ky" />
<c:url var="info" value="/thong-tin-bai-viet" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="container">

		<h1 style="text-align: justify">
			<strong> ${model.title }</strong>
		</h1>
		<b>${model.shortDescription}</b> ${model.content}

	</div>

	<h1>Comment</h1>

	<%
		if (SecurityUtils.getPrincipal() != null) {
	%>
	<h5>Id Bài viết: ${ model.id }</h5>
	<h5>
		Id User:
		<%=SecurityUtils.getPrincipal().getId()%></h5>
	<h5>
		Tên:
		<%=SecurityUtils.getPrincipal().getFullName()%></h5>
	<h5>
		Username:
		<%=SecurityUtils.getPrincipal().getUserName()%></h5>
	<h5>
		Email:
		<%=SecurityUtils.getPrincipal().getEmail()%></h5>
	<form method="post" id="formSubmit">
		<textarea rows="5" cols="140" placeholder="Enter your comment..."
			id="content" name="content"></textarea>

		<input type="hidden"
			value="<%=SecurityUtils.getPrincipal().getId()%>" id="userId"
			name="userId"> <input type="hidden" value="${model.id}"
			id="newId" name="newId"> <br>
		<br> <input type="button" id="btnComment" value="Bình Luận">
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
								<c:forEach var="child" items="${comment.listComment}">
									<myTags:folderGroups item="${child }" />
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</section>



	<script type="text/javascript">
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

		$('#btnComment1').click(function(e) {
			e.preventDefault(); // Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
			// cần truyền vào url: /api/new

			var formData = $('#formSubmit1').serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
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

		$('#reply1').click(function(e) {

			$('#formSubmit1').removeClass("d-none")

		});
	</script>

</body>
</html>