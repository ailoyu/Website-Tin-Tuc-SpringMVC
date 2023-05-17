<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="newAPI" value="/api/account" />
<c:url var="updateAccount" value="/thay-doi-thong-tin" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<br>
		<br>
		<div class="text-center">
			<h1>CHỈNH SỬA THÔNG TIN</h1>
		</div>
		
		<c:if test="${not empty message }">
				<div class="alert alert-${alert}">${message}</div>
			</c:if>

		<form id="formSubmit" class="form">
			<input type="hidden" name="hanhDong" value="thay-doi-thong-tin" />
			<div class="row">

				<div class="col-md-6">
				<br>
					<div style="margin-left:auto;margin-right:auto;text-align:center">
						<img src="${ model.avatar }"
						class="rounded-circle mb-3" style="width: 150px;" alt="Avatar" id="img_preview" />
					<h5 class="mb-2">
						<strong>${ model.fullName }</strong>
					</h5>
					<p class="text-muted">
						@${ model.userName } <span class="badge bg-primary"></span>
					</p>
					<button id="fileButton" type="button" onclick="document.getElementById('avatar').click(); return false;" class="btn btn-primary btn-rounded">Cập nhật hình ảnh</button>
					</div>
					<input id="avatar" name="avatar" type="file" onchange="previewFile()" style="visibility: hidden;">
				</div>
				<div class="col-md-6">
				<div class="mb-3">
						<label for="hoVaTen" class="form-label"><strong>Họ Và Tên</strong> </label> <input
							type="text" class="form-control" id="fullName" name="fullName"
							value="${ model.fullName }">
					</div>
					<div class="mb-3">
						<label for="ngaySinh" class="form-label"><strong>Ngày khởi tạo</strong> </label><br>
							<fmt:formatDate pattern="dd-MM-yyyy | HH:mm" value="${model.createdDate}" />
					</div>
					
					<div class="mb-3">
						<label for="email" class="form-label"><strong>Email</strong></label> <input
							type="email" class="form-control" id="email" name="email"
							value="${ model.email }">
					</div>
					<hr />
					<c:if test="${ model.emailReceived == true }">
						<div class="mb-3">
							<input type="checkbox" checked class="form-check-input"
								id="dongYNhanMail" name="dongYNhanMail"> <label
								for="dongYNhanMail" class="form-label">Đồng ý nhận thông báo của hệ thống qua email</label>
						</div>
					</c:if>

					<c:if test="${ model.emailReceived == false }">
						<div class="mb-3">
							<input type="checkbox" class="form-check-input"
								id="dongYNhanMail" name="dongYNhanMail"> <label
								for="dongYNhanMail" class="form-label">Đồng ý nhận thông báo của hệ thống qua email</label>
						</div>
					</c:if>

				</div>
				<input type="hidden" id="userName" name="userName" value="${ model.userName }" />
				<br>
				<br> <input class="btn btn-primary form-control" type="submit"
					value="Lưu thông tin" name="submit" id="submit" /> <br>
				<br>
				<div class="" role="status" id="loading" style="margin-left: 33.5em">
		 						 <span class="sr-only">Loading...</span>
							</div><br>
				<br>
							
			</div>

		</form>
	</div>
	<script type="text/javascript">
	function previewFile() {
		const preview = document.querySelector('#img_preview');
		const file = document.querySelector('#avatar').files[0];
		const reader = new FileReader();
		reader.addEventListener("load", function () {
			
			// convert image file to base64 string
			preview.src = reader.result;
			
		}, false);
		
		if(file){
			reader.readAsDataURL(file);
		}
		
	}
	
	$('#submit').click(function(e) {
		$('#loading').addClass('spinner-border');
		var emailReceived = $('#dongYNhanMail').is(':checked');
		
		e.preventDefault(); // Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
		
		// cần truyền vào url: /api/new
		var formData = $('#formSubmit').serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
		var data = {};

		// Chạy vòng lặp bỏ dữ liệu từ formData vào data
		$.each(formData, function(i, v) {
			data["" + v.name + ""] = v.value;
		});
		if(emailReceived == true){
			data["emailReceived"] = true;
		} else if(emailReceived == false){
			data["emailReceived"] = false;
		}
		data["avatar"] = document.querySelector('#img_preview').getAttribute('src');
		updateNew(data);
		

	});
	

	function updateNew(data) {
		$.ajax({
			url : '${newAPI}', // gửi tới url api
			type : 'PUT',
			contentType : 'application/json', // ép kiểu json từ client -> server
			data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
			dataType : 'json', // nhận kiểu json từ server -> client
			success : function(result) {
				window.location.href = "${updateAccount}?message=update_account_success";
			},
			error : function(error) {
				window.location.href = "${updateAccount}?message=update_account_fail";
			}
		});
	}
	
	
	</script>
</body>
</html>