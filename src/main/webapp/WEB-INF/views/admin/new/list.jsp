<%@include file="/common/taglib.jsp"%>
<c:url var="newAPI" value="/api/new"/>
<c:url var="newURL" value="/quan-tri/bai-viet/danh-sach"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Danh sách bài viết</title>
	</head>

	<body>
		<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="<c:url value='/quan-tri/trang-chu'/>">Trang chủ</a>
							</li>
							<li class="active">Danh sách bài viết</li>
						</ul>
						<!-- /.breadcrumb -->
					</div>
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<c:if test="${not empty message }">
								<div class="alert alert-${alert }">
									${message }
								</div>
							</c:if>
								<div class="widget-box table-filter">
									<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											<div class="dt-buttons btn-overlap btn-group">
											<c:url var="createNewURL" value="/quan-tri/bai-viet/chinh-sua" />
												<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm bài viết' href='${createNewURL}'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												<button id="btnDelete" type="button" onclick="warningBeforeDelete()"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa bài viết'>
																<span>
																	<i class="fa fa-trash-o bigger-110 pink"></i>
																</span>
												</button>
											</div>
										</div>
									</div>
								</div>
								<br><br><br>
								<div class="row" style="margin-bottom: 5em">
								<form class="form-search" action="<c:url value='/quan-tri/bai-viet/danh-sach/tim-kiem'/>"> 
									<span class="input-icon align-middle" style="margin-left: 15em;">
										<i class="ace-icon fa fa-search"></i>
										<input type="text" name="key" value="${key}" class="search-query" placeholder="Nhập bài viết muốn tìm kiếm" style="width: 45em">
									</span>
									<button class="btn btn-sm" type="submit">Tìm kiếm</button>
								</form>
								</div>
								<c:if test="${not empty key }">
									<form action="<c:url value='/quan-tri/bai-viet/danh-sach/tim-kiem'/>" id="formSubmit" method="get">	
								</c:if>
								<c:if test="${empty key }">
									<form action="<c:url value='/quan-tri/bai-viet/danh-sach'/>" id="formSubmit" method="get">
								</c:if>
								<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th><input type="checkbox" onClick="toggle(this)" id="checkAll"></th>
														<th>Tên bài viết</th>
														<th>Mô tả ngắn</th>
														<th>Hình thumbnail</th>
														<th>Thao tác</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="item" items="${model.listResult}">
														<tr>
															<td><input type="checkbox" id="checkbox_${item.id}" name="foo" value="${item.id}"></td>
															<td>${item.title}</td>
															<td>${item.shortDescription}</td>
															<td>
																<c:url var="updateNewURL" value="/quan-tri/bai-viet/chinh-sua">
																	<c:param name="id" value="${item.id }"></c:param>
																</c:url>
																<a class=""
																   title="Cập nhật bài viết" href='${updateNewURL}'>
																<img src="${item.thumbnail }" width="150" height="80">
																</a>
															</td>
															<td>
															<c:url var="updateNewURL" value="/quan-tri/bai-viet/chinh-sua">
																<c:param name="id" value="${item.id }"></c:param>
															</c:url>
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật bài viết" href='${updateNewURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<div class="row" style="text-align: center; margin-right: 3em">
											<ul class="pagination" id="pagination" ></ul>
											</div>
											<input type="hidden" value="" id="page" name="page"/>
											<c:if test="${ not empty key }">
												<input type="hidden" value="${key}" id="key" name="key"/>
											</c:if>
<!-- 											<input type="hidden" value="" id="limit" name="limit"/> -->
										</div>
									</div>
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
		
		</div>
		<!-- /.main-content -->
		<script>
		var totalPage = ${model.totalPage};
		var currentPage = ${model.page};
		$(function () {
	        window.pagObj = $('#pagination').twbsPagination({
	            totalPages: totalPage,
	            visiblePages: 10,
	            startPage: currentPage,
	            onPageClick: function (event, page) { // page: là page muốn chuyển tiếp
	            	if (currentPage != page) { // currentPage: là page hiện tại đang đứng
// 	            		$('#limit').val(5);
						$('#page').val(page); // page: là page muốn chuyển tiếp
	            		$('#formSubmit').submit();
					}
	            }
	        });
	    });
		
		function toggle(source) {
			  checkboxes = document.getElementsByName('foo');
			  for(var i=0, n=checkboxes.length;i<n;i++) {
			    checkboxes[i].checked = source.checked;
			  }
		}
		
		
		function warningBeforeDelete() {
			swal({
				  title: "Xác nhận xóa",
				  text: "Bạn có muốn xóa bài viết hay không?",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonClass: "btn-success",
				  cancelButtonClass: "btn-danger",
				  confirmButtonText: "Xác nhận",
				  cancelButtonText: "Hủy bỏ",
				}).then(function(result) {
					if(result.value){
					// call api
					// tìm các id trong các checkbox đã chọn, từ phần <tbody> trở xuống
					  var ids = $('tbody input[type=checkbox]:checked').map(function () {
				            return $(this).val(); // bỏ value của các id cho vào mảng[]
				        }).get();
						deleteNew(ids);
				  } 
				});
		}
		
		function deleteNew(data) {
	        $.ajax({
	            url: '${newAPI}',
	            type: 'DELETE',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            success: function (result) {
	                window.location.href = "${newURL}?page=1&limit=5&message=delete_success"; 
	            },
	            error: function (error) {
	            	window.location.href = "${newURL}?page=1&limit=5&message=error_system";
	            }
	        });
	    }
		</script>
	</body>

	</html>