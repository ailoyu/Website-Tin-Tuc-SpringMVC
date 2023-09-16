<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="newAPI" value="/api/account" />
<c:url var="newURL" value="/dang-nhap" />
<c:url var="registerURL" value="/dang-ky"/>
<c:url var="validateURL" value="/thong-bao" />
<!DOCTYPE html>
<html>
<head>
<title>Đăng Ký</title>
<meta charset="UTF-8">

<style type="text/css">
.red {
	color: red;
}
</style>
</head>
<body>
	<div class="container">
		<br>
		<div class="text-center">
			<h1>ĐĂNG KÝ TÀI KHOẢN</h1>
		</div>
		<div class="login-form">
			<c:if test="${not empty message }">
				<div class="alert alert-${alert}">${message}</div>
			</c:if>
			<form class="form" id="formSubmit">
				<div class="row">
					<div class="col-md-6">
						<h3>Tài Khoản</h3>
						<div class="mb-3">
							<label for="tenDangNhap" class="form-label">Tên Đăng Nhập<span
								style="color: red;">*</span></label> <input type="text"
								class="form-control" id="tenDangNhap" name="userName"
								required="required" value="">
						</div>
						<div class="mb-3">
							<label for="matKhau" class="form-label">Mật khẩu<span
								style="color: red;">*</span></label> <input type="password"
								class="form-control" id="password" name="password"
								required="required">
						</div>
						<div class="mb-3">
							<label for="matKhauNhapLai" class="form-label">Nhập Lại
								Mật khẩu<span style="color: red;">*</span> <span
								style="color: red;" id="msg"></span>
							</label> <input type="password" class="form-control" id="matKhauNhapLai"
								required="required" onkeyup="kiemTraMatKhau()">
						</div>
					</div>
					<div class="col-md-6">
						<h3>Thông tin khách hàng</h3>
						<div class="mb-3">
							<label for="hoVaTen" class="form-label">Họ Và Tên</label> <input
								type="text" class="form-control" id="hoVaTen" name="fullName"
								value="">
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email</label> <input
								type="email" class="form-control" id="email" name="email" value="">
						</div>

						<div class="mb-3">
							<input type="checkbox" class="form-check-input"
								id="dongYDieuKhoan" required="required"
								onchange="xuLyChonDongY()"> <label for="dongYDieuKhoan"
								class="form-label">Đồng ý với điều khoản của công ty<span
								class="red">*</span>
							</label>
						</div>
						<div class="mb-3">
							<input type="checkbox" class="form-check-input"
								id="dongYNhanMail"> <label
								for="dongYNhanMail" class="form-label">Đồng ý nhận thông báo của hệ thống qua email</label>
						</div>
						<div class="mb-3">
							<input class="btn btn-primary form-control" type="button"
							value="Đăng Ký" id="submit" style="visibility: hidden;" />
							<br><br>
							<div class="" role="status" id="loading" style="margin-left: 15.5em">
		 						 <span class="sr-only">Loading...</span>
							</div>
						</div>
						
					</div>
				</div>
						
			</form>
		</div>
	</div>
	
	<br>
	<script type="text/javascript">
		function kiemTraMatKhau() {
			matKhau = document.getElementById("password").value;
			matKhauNhapLai = document.getElementById("matKhauNhapLai").value;

			if (matKhau != matKhauNhapLai) {
				document.getElementById("msg").innerHTML = "(*) Mật khẩu không khớp";
				return false;
			} else {
				document.getElementById("msg").innerHTML = "";
				return true;
			}
		}
		function xuLyChonDongY() {
			dongYDieuKhoan = document.getElementById("dongYDieuKhoan");
			if (dongYDieuKhoan.checked == true) {
				document.getElementById("submit").style.visibility = "visible";
			} else {
				document.getElementById("submit").style.visibility = "hidden";
			}

		}
		

		$('#submit').click(function(e) {
			matKhau = document.getElementById("password").value;
			matKhauNhapLai = document.getElementById("matKhauNhapLai").value;
			
			var emailReceived = $('#dongYNhanMail').is(':checked');
			
			e.preventDefault(); // Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
			
			if (matKhau != matKhauNhapLai) {
				window.location.href = "${registerURL}?&message=confirm_password";			
			} else{
				$('#loading').addClass('spinner-border');
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
				addNew(data);
			}
			

		});
		

		function addNew(data) {
			$.ajax({
				url : '${newAPI}', // gửi tới url api
				type : 'POST',
				contentType : 'application/json', // ép kiểu json từ client -> server
				data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
				dataType : 'json', // nhận kiểu json từ server -> client
				success : function(result) {
					window.location.href = "${validateURL}?id="+result.id;
				},
				error : function(error) {
					window.location.href = "${registerURL}?&message=error_system";
				}
			});
		}
	</script>

</body>
</html>