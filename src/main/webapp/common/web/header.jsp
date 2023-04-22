<%@ page import="com.laptrinhjavaweb.util.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbarResponsive"
			style="margin-right:;">
			<a class="navbar-brand" href="<c:url value='/index.jsp' />">Twinkle</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="navbarResponsive"
			style="margin-left: 33%;">
			<form action="<c:url value='/search'/>">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><input oninput=""
						class="form-control me-2" type="text"
						placeholder="Nội Dung Tìm Kiếm" aria-label="Search" name="key"
						value="${key}"></li>
					<li class="nav-item" style="margin-left: 1em;">
						<button class="btn btn-outline-success" type="submit">Tìm</button>
					</li>

					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/index.jsp' />">Trang Chủ <span
							class="sr-only">(current)</span>
					</a></li>
					<security:authorize access="isAnonymous()">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/dang-nhap'/>">Đăng Nhập</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/dang-ky'/>">Đăng Ký</a></li>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<security:authorize access="hasAnyRole('ADMIN')">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle"
									href="" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> Welcome, <%=SecurityUtils.getPrincipal().getFullName()%></a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="<c:url value='/quan-tri/trang-chu'/>">Trang quản trị</a></li>
										<li><a class="dropdown-item" href="">Thay đổi thông
												tin</a></li>
										<li><a class="dropdown-item" href="">Đổi mật khẩu</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item"
											href="<c:url value='/thoat' />">Đăng xuất</a></li>
									</ul></li>
							</security:authorize>
							<security:authorize access="hasAnyRole('USER')">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> Welcome, <%=SecurityUtils.getPrincipal().getFullName()%></a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="">Thay đổi thông
												tin</a></li>
										<li><a class="dropdown-item" href="">Đổi mật khẩu</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item"
											href="<c:url value='/thoat' />">Đăng xuất</a></li>
									</ul></li>
							</security:authorize>

						</ul>
					</security:authorize>
				</ul>
			</form>
		</div>
	</div>
</nav>