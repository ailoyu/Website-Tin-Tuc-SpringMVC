<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<div class="container">
		<!-- <h1 class="form-heading">login Form</h1> -->
		<c:if test="${param.accessDenied == null }">
			<div class="login-form">
				<div class="main-div">
					<!-- Sau khi đăng ký thành công -> chuyển message & alert 
						thông bao thành công sang trang đăng nhập -->
					<c:if test="${not empty message }">
						<div class="alert alert-${alert}">${message}</div>
					</c:if>

					<form action="j_spring_security_check" id="formLogin" method="post">
						<div class="form-group">
							<input type="text" class="form-control" id="userName"
								name="j_username" placeholder="Tên đăng nhập">
						</div>

						<div class="form-group">
							<input type="password" class="form-control" id="password"
								name="j_password" placeholder="Mật khẩu">
						</div>
						<div class="form-group">
							<input type="checkbox" onclick="myFunction()">Show
							Password
						</div>
						<button type="submit" class="btn btn-primary">Đăng nhập</button>
						<br><br>
						<a href="<c:url value='/quen-mat-khau' />" class="text-decoration-none">Quên mật khẩu?</a>
					</form>


				</div>
			</div>
		</c:if>

		<c:if test="${param.accessDenied != null}">
			<h1 style="align-items: center;">Bạn ko có quyền truy cập vào
				trang này!</h1>
		</c:if>

		<script type="text/javascript">
			var x = true;
			function myFunction() {
				if (x) {
					document.getElementById('password').type = "text";
					x = false;
				} else {
					document.getElementById('password').type = "password";
					x = true;
				}
			}
		</script>

	</div>
</body>
</html>