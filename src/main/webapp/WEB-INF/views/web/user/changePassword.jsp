<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/common/taglib.jsp"%>
<c:url var="chagePasswordURL" value="/thay-doi-mat-khau"/>
<c:url var="paswordAPI" value="/api/password" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thay đổi mật khẩu</title>
</head>
<body>
	<div class="container mt-5">
		<div class="text-center">
			<h1>Đổi mật khẩu</h1>
		</div>
		<c:if test="${not empty message }">
				<div class="alert alert-${alert}">${message}</div>
			</c:if>
		<form id="formSubmit">
			<div class="mb-3">
				<label for="matKhauHienTai" class="form-label">Mật khẩu hiện
					tại</label> <input type="password" class="form-control" id="password"
					name="password">
			</div>
			<div class="mb-3">
				<label for="matKhauMoi" class="form-label">Mật khẩu mới</label> <input
					type="password" class="form-control" id="newPassword"
					name="newPassword" onkeyup="kiemTraMatKhauMoi_HienTai()"> <span
					id="msg" style="color: red"></span>
			</div>
			<div class="mb-3">
				<label for="matKhauMoiNhapLai" class="form-label">Nhập lại
					mật khẩu mới</label> <input type="password" class="form-control"
					id="confirmPass"
					onkeyup="kiemTraMatKhauMoi()"><span id="msg1" style="color: red"></span>
			</div>
			<input type="hidden" id="id" name="id" value="${id}" />
			<button type="submit" id="submit" class="btn btn-primary">Lưu mật khẩu</button>
			<div class="" role="status" id="loading" style="margin-left: 1em">
		 						 <span class="sr-only">Loading...</span>
							</div>
							<br><br><br>
		</form>
	</div>
	
	<script type="text/javascript">
		function kiemTraMatKhauMoi_HienTai() {
			matKhauHienTai = document.getElementById("password").value;
			matKhauMoi = document.getElementById("newPassword").value;
			matKhauMoiNhapLai = document.getElementById("confirmPass").value;

			if (matKhauHienTai == matKhauMoi) {
				document.getElementById("msg").innerHTML = "(*) Mật khẩu mới phải khác mật khẩu hiện tại";
				return false;
			} else {
				document.getElementById("msg").innerHTML = "";
				return true;
			}
		}

		function kiemTraMatKhauMoi() {
			matKhauMoi = document.getElementById("newPassword").value;
			matKhauMoiNhapLai = document.getElementById("confirmPass").value;

			if (matKhauMoi != matKhauMoiNhapLai) {
				document.getElementById("msg1").innerHTML = "(*) Mật khẩu nhập lại không khớp";
				return false;
			} else {
				document.getElementById("msg1").innerHTML = "";
				return true;
			}
		}
		
		$('#submit').click(function(e) {
			matKhauHienTai = document.getElementById("password").value;
			matKhauMoi = document.getElementById("newPassword").value;
			matKhauMoiNhapLai = document.getElementById("confirmPass").value;
			
			e.preventDefault(); // Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
			
			if (matKhauMoi != matKhauMoiNhapLai) {
				window.location.href = "${chagePasswordURL}?&message=confirm_password";			
			} else if(matKhauHienTai == matKhauMoi) {
				window.location.href = "${chagePasswordURL}?&message=same_password";
			} else if(matKhauHienTai == "" || matKhauMoi == "" || matKhauMoiNhapLai == ""){
				window.location.href = "${chagePasswordURL}?&message=blank_password"
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
					window.location.href = "${chagePasswordURL}?message=change_password_success";
				},
				error : function(error) {
					window.location.href = "${chagePasswordURL}?message=change_password_fail";
				}
			});
		}
		
	</script>
</body>
</html>