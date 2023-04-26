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
<c:if test="${ empty message }">
<div class="container"><h1>Đăng ký thành công! Vui lòng kiểm tra email để xác thực tài khoản của bạn</h1>
						<h1 style="display: inline;">Bạn có 2 phút để xác thực tài khoản!</h1> <a class="btn btn-primary"
					style="white-space: nowrap; margin-left: 15px;"
					href="https://gmail.com" target="_blank" rel="noopener noreferrer">Xác nhận bằng email</a>	</div>
</c:if>
<c:if test="${ not empty message }">
		<div class="container"><h1>
		${ message }
</h1></div>

<script type="text/javascript">
	setTimeout(function() {
		window.location.href = 'index.jsp';
	}, 5000);
</script>
</c:if>

</body>
</html>