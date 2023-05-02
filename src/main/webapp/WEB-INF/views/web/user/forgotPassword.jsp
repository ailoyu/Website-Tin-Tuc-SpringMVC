<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="forgotLink" value="/quen-mat-khau" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-5">
		<div class="text-center">
			<h1>Quên mật khẩu</h1>
		</div>
		<c:if test="${not empty message }">
			<div class="alert alert-${alert }">${message}</div>
			<script type="text/javascript">
						setTimeout(function() {
							window.location.href = "${forgotLink}";
						}, 1000);
					</script>
		</c:if>
		<form action="forgotPassword" method="post">
			<div class="mb-3">
				<label for="matKhauHienTai" class="form-label">Email</label> 
				<input type="text" class="form-control" id="email"
					name="email">
			</div>
			<div class="mb-3">
				<label for="matKhauMoi" class="form-label">Tài khoản</label> <input
					type="text" class="form-control" id="userName"
					name="userName">
			</div>
			<button type="submit" id="submit" class="btn btn-primary">Gửi</button>
			<br>
			<br>
			<br>
		</form>
	</div>
</body>
</html>