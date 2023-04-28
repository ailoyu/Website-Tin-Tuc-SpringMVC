<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xác thực tài khoản</title>
</head>
<body>
<div class="container">
	<h3>Đăng ký thành công! Vui lòng kiểm tra email để xác thực tài
				khoản của bạn.</h3>
			<h3 style="display: inline;">Bạn có 2 phút để xác thực tài
				khoản!</h3>
			<br><br>
			</div>
	<c:if test="${ not empty message }">
		<div class="container">
				<div class="alert alert-${alert }">
						${message }
				</div>
				<c:if test="${message == 'Xác thực thành công' || message == 'Hết thời gian xác thực, vui lòng đăng ký lại!'}">
					<script type="text/javascript">
						setTimeout(function() {
							window.location.href = 'index.jsp';
						}, 3000);
					</script>
				</c:if>
		</div>

	</c:if>
	<c:if test="${ not empty id }">
		<div class="container">
			<h3 style="display: inline;">
				Bạn có thể<a
					style="white-space: nowrap; margin-left: 15px; display: inline;"
					href="https://gmail.com" target="_blank" rel="noopener noreferrer">Xác
					thực bằng email</a> hoặc nhập mã xác thực:
			</h3>
			<br><br>
			<form action="<c:url value ='/xac-thuc'/>">
				<input type="text" class="form-control" id="maXacThuc" name="maXacThuc" /> <input
					type="hidden" id="maKhachHang" name="maKhachHang" value="${id}" />
					<br>
				<button class="btn btn-primary" type="submit">Gửi mã xác thực</button>
			</form>
		</div>
	</c:if>
	

</body>
</html>