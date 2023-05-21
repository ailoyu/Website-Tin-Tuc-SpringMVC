<%@page import="com.laptrinhjavaweb.util.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="HomeURL" value="/trang-chu" />
<c:url var="searching" value="/search" />
<c:url var="viewCountAPI" value="/api/views" />
<c:url var="personalInfo" value="/trang-ca-nhan"/>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">


<title>Trang chủ</title>
<style type="text/css">

</style>
</head>

<body>
	<!-- Page Content -->
	<div class="row">
		
		
	</div>
	<c:if test="${not empty model.categoryId }">
		<form action="<c:url value='the-loai'/>" id="formSubmit" method="get">
	</c:if>
	<c:if test="${not empty key }">
		<form action="<c:url value='search'/>" id="formSubmit" method="get">
	</c:if>
	<c:if test="${empty model.categoryId }">
		<c:if test="${empty key }">
			<form action="<c:url value='trang-chu'/>" id="formSubmit"
				method="get">
		</c:if>
	</c:if>
	<div class="row" style="margin-top: 20px; margin-bottom: 20px">

		<div class="col-lg-3">

			<h1 class="my-4">Thể Loại</h1>
			<div class="list-group">
				<c:forEach var="item" items="${categories}">
					<c:url var="editURL" value="/the-loai">
						<c:param name="categoryId" value="${item.id}" />
						<c:param name="page" value="1" />
						<%-- 							<c:param name="limit" value="6"/> --%>
						<%-- 				<c:param name="sortName" value="title"/> --%>
						<%-- 				<c:param name="sortBy" value="desc"/>  --%>
					</c:url>

					<a href="${editURL}" class="list-group-item">${item.name }</a>
				</c:forEach>
			</div>

		</div>
		<!-- /.col-lg-3 -->

		<div class="col-lg-9">
			<c:if test="${ empty model.categoryId}">
				<c:if test="${ empty key }">
					<h2>Tin mới nhất</h2>
					<div id="carouselExampleFade" class="carousel slide carousel-fade"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="<c:url value='/template/Twinkle.png'/>"
									class="d-block w-100" alt="..."
									width="1000px" height="550px">
							</div>
							<c:forEach var="item" items="${ model.listHotNews }">
								<div class="carousel-item">
									<a onclick="myFunction(${item.id})"
										href="<c:url value="/thong-tin-bai-viet?id=${ item.id }"/>">
										<img class="d-block w-100" src="${ item.thumbnail }"
										width="1000px" height="550px">
									</a>
									<div class="carousel-caption d-none d-md-block">
										<h5 style="">${ item.title }</h5>
										<p>${ item.shortDescription }</p>
									</div>
								</div>
							</c:forEach>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleFade" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleFade" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>

				</c:if>
			</c:if>

			<br>
			<br>

			<div class="row">
			
				<c:if test="${ not empty findName }">
					 <div class="col-md-12 col-lg-12">
            <div class="card">
                <div class="header">
                    <h2><strong>Danh sách người dùng</strong></h2>
                </div>
                <div class="body">
                    <ul class="new_friend_list list-unstyled row">
                    <c:forEach var="item" items="${ findName }">
                        <li class="col-lg-2 col-md-2 col-sm-6 col-4">
                            <a href="${personalInfo}/${item.id}">
                                <img src="${ item.avatar }" class="img-thumbnail" alt="User Image">
                                <h6 class="users_name">${item.fullName }</h6>
                                <h6>@${ item.userName}</h6>
                            </a>
                        </li>
                     </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
				</c:if>
				</div>
				
				<div class="row">
				<c:if test="${ not empty model.listResult }">
				<div class="header">
                    <h2><strong>Danh sách bài viết</strong></h2>
                </div>


				<c:forEach var="item" items="${model.listResult}">

					<c:url var="editURL" value="/thong-tin-bai-viet">
						<c:param name="id" value="${item.id}" />
					</c:url>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href='${editURL }'><img class="card-img-top"
								src="${item.thumbnail }" onclick="myFunction(${item.id})"></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href='${editURL }' onclick="myFunction(${item.id})">${item.title}</a>
								</h4>
								<h5>Tác giả: ${item.createdBy }</h5>
								<p class="card-text">${item.shortDescription }</p>
							</div>
							<div class="card-footer">
								<c:set var="today" value="${item.createdDate }" />
								<p>
									Ngày: <strong><fmt:formatDate
											pattern="dd-MM-yyyy HH:mm" value="${today}" /></strong>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
				</c:if>



			</div>
			<ul class="pagination" id="pagination" style="margin-left: 15em" ></ul>
			
			<c:if test="${ not empty model.categoryId }">
				<input type="hidden" value="${model.categoryId}" id="categoryId"
					name="categoryId" />
			</c:if>
			<c:if test="${ not empty key }">
				<input type="hidden" value="${key}" id="key" name="key" />
			</c:if>
			<input type="hidden" value="" id="page" name="page" />
			<!-- 				<input type="hidden" value="" id="limit" name="limit"/> -->

		</div>
		<!-- /.col-lg-9 -->


	</div>


	</form>

	<!-- /.container -->

	<script type="text/javascript">
	var totalPage = ${model.totalPage};
	var currentPage = ${model.page};
	var categoryId = null;
		var totalPage = ${model.totalPage};
		var currentPage = ${model.page};
	$(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPage,
            visiblePages: 10,
            startPage: currentPage,
            onPageClick: function (event, page) { // page: là page muốn chuyển tiếp
            	if (currentPage != page) { // currentPage: là page hiện tại đang đứng
//             		$('#limit').val(6);
					$('#page').val(page); // page: là page muốn chuyển tiếp
					$('#formSubmit').submit();
				}
            }
        });
    });
	
	<%if (SecurityUtils.getPrincipal() != null) {%>
		function myFunction(newId) {
			var data = {};
			data["userId"] = <%=SecurityUtils.getPrincipal().getId()%>;
			data["newId"] = newId;
			
			addNew(data);
		}
		
		function addNew(data) {
			$.ajax({
				url : '${viewCountAPI}', // gửi tới url api
				type : 'POST',
				contentType : 'application/json', // ép kiểu json từ client -> server
				data : JSON.stringify(data), // parse từ JavaScript Object -> JSON
				dataType : 'json', // nhận kiểu json từ server -> client
				success : function(result) {
					console.log("Thành công");
				},
				error : function(error) {
					console.log("Thất bại");
				}
			});
		}
	
	<%}%>
	
	
	
	
	</script>

</body>

</html>