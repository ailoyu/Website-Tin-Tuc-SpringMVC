<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="chagePasswordURL" value="/reset-mat-khau"/>
<c:url var="validation" value="/thong-bao"/>
<c:url var="paswordAPI" value="/api/password" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-5">
		<div class="text-center">
			<h1>Cài đặt lại mật khẩu</h1>
		</div>
		<c:if test="${not empty message }">
			<div class="alert alert-${alert}">${message}</div>
		</c:if>
		<form id="formSubmit">
			<div class="mb-3">
				<label for="matKhauMoi" class="form-label">Mật khẩu mới</label> <input
					type="password" class="form-control" id="newPassword"
					name="newPassword" onkeyup="kiemTraMatKhauMoi_HienTai()"> <span
					id="msg" style="color: red"></span>
			</div>
			<div class="mb-3">
				<label for="matKhauMoiNhapLai" class="form-label">Nhập lại
					mật khẩu mới</label> <input type="password" class="form-control"
					id="confirmPass" onkeyup="kiemTraMatKhauMoi()"><span
					id="msg1" style="color: red"></span>
			</div>
			<input type="hidden" name="id" id="id" value="${userId }">
			<button type="button" id="submit" class="btn btn-primary">Thay
				đổi mật khẩu</button>
			<div class="" role="status" id="loading" style="margin-left: 1em">
				<span class="sr-only">Loading...</span>
			</div>
			<br> <br> <br>
		</form>
	</div>
	<script type="text/javascript">
	$('#submit').click(function(e) {
		matKhauMoi = document.getElementById("newPassword").value;
		matKhauMoiNhapLai = document.getElementById("confirmPass").value;
		
		e.preventDefault(); // Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
		
		if (matKhauMoi != matKhauMoiNhapLai) {
			window.location.href = "${chagePasswordURL}/${userId}?message=confirm_password";			
		} else {
			$('#loading').addClass('spinner-border');
			// cần truyền vào url: /api/new
			var formData = $('#formSubmit').serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
			var data = {};

			// Chạy vòng lặp bỏ dữ liệu từ formData vào data
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			addNew(data);
		}
	});
	

	function addNew(data) {
		$.ajax({
			url : '${paswordAPI}', // gửi tới url api
			type : 'PUT',
			contentType : 'application/json', // ép kiểu json từ client -> server
			data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
			dataType : 'json', // nhận kiểu json từ server -> client
			success : function(result) {
				window.location.href = "${validation}?id="+${userId};
			},
			error : function(error) {
				window.location.href = "${chagePasswordURL}/${userId}?message=error_system";
			}
		});
	}	
	</script>
</body>
</html>