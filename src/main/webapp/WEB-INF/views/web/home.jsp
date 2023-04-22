<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="HomeURL" value="/trang-chu" />
<c:url var="searching" value="/search"/>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">


<title>Trang chủ</title>

</head>

<body>
	<!-- Page Content -->
	<c:if test="${not empty model.categoryId }">
		<form action="<c:url value='the-loai'/>" id="formSubmit" method="get">	
	</c:if>
	<c:if test="${not empty key }">
		<form action="<c:url value='search'/>" id="formSubmit" method="get">	
	</c:if>
	<c:if test="${empty model.categoryId }">
		<c:if test="${empty key }">
			<form action="<c:url value='trang-chu'/>" id="formSubmit" method="get">
		</c:if>
	</c:if>	
		<div class="row" style="margin-top: 20px; margin-bottom: 20px">
		
			<div class="col-lg-3">

				<h1 class="my-4">Thể Loại</h1>
				<div class="list-group">
					<c:forEach var="item" items="${categories}">
						<c:url var="editURL" value="/the-loai">
							<c:param name="categoryId" value="${item.id}"/>
							<c:param name="page" value="1"/>
<%-- 							<c:param name="limit" value="6"/> --%>
			<%-- 				<c:param name="sortName" value="title"/> --%>
			<%-- 				<c:param name="sortBy" value="desc"/>  --%>
						</c:url>

						<a href="${editURL}" class="list-group-item" >${item.name }</a>
					</c:forEach>
				</div>

			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">
				<c:if test="${ empty model.categoryId}">
				<c:if test="${ empty key }">
				<h2>Tin mới nhất</h2>
					<div id="carouselExampleIndicators" class="carousel slide my-4"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0"
								class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="7"></li>
							
						</ol>
						
						
						<div class="carousel-inner" role="listbox">
							<div class="carousel-item active">
								<img class="d-block img-fluid"
									src="<c:url value='/template/Twinkle.png'/>"
									width="1000px">
						</div>
						
						<c:forEach var="item" items="${ model.listHotNews }">
						
							<div class="carousel-item">
							<a href="<c:url value="/thong-tin-bai-viet?id=${ item.id }"/>">
								<img class="d-block img-fluid"
									src="${ item.thumbnail }"
									width="1000px" height="500px">
							</a>
							<div class="carousel-caption d-none d-md-block">
						       <h5 style="">${ item.title }</h5>
						       <p>${ item.shortDescription }</p>
							</div>	
						</div>
						</c:forEach>
						
						
							
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
			
					
					</c:if>
				</c:if>
				
				<div class="row">
			

				<c:forEach var="item" items="${model.listResult}">
				
				<c:url var="editURL" value="/thong-tin-bai-viet">
					<c:param name="id" value="${item.id}"/>
				</c:url>
					  <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href='${editURL }'><img class="card-img-top" src="${item.thumbnail }" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href='${editURL }'>${item.title}</a>
                  </h4>
                  <h5>Tác giả: ${item.createdBy }</h5>
                  <p class="card-text">${item.shortDescription }</p>
                </div>
                <div class="card-footer">
                 <c:set var="today" value="${item.createdDate }" />
				<p>Ngày: <strong><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${today}" /></strong></p>
                </div>
              </div>
            </div>	
				</c:forEach>
				</div>
				<ul class="pagination" id="pagination"></ul>
				<c:if test="${ not empty model.categoryId }">
					<input type="hidden" value="${model.categoryId}" id="categoryId" name="categoryId"/>
				</c:if>
				<c:if test="${ not empty key }">
					<input type="hidden" value="${key}" id="key" name="key"/>
				</c:if>
				<input type="hidden" value="" id="page" name="page"/>
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
	</script>

</body>

</html>