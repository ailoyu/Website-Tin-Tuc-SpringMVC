<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="newURL" value="/quan-tri/bai-viet/danh-sach"/>
<c:url var="editNewURL" value="/quan-tri/bai-viet/chinh-sua"/>
<c:url var="newAPI" value="/api/new"/>
<html>
<head>
    <title>Chỉnh sửa bài viết</title>
</head>
<body>
<div class="main-content"> 
	<div class="main-content-inner">
	<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="<c:url value='/quan-tri/trang-chu'/>">Trang chủ</a>
							</li>

							<li>
								<a href="<c:url value='/quan-tri/bai-viet/danh-sach'/>">Danh sách bài viết</a>
							</li>
							<li class="active">Chỉnh sửa chi tiết</li>
						</ul><!-- /.breadcrumb -->
					</div>	
					
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
							<c:if test="${not empty message }">
							<div class="alert alert-${alert }">
								 ${message }
							</div>
							</c:if>
								<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model" enctype="multipart/form-data">
									<div class="form-group">
								  <label for="categoryCode" class="col-sm-3 control-label no-padding-right">Thể loại:</label>
								  <div class="col-sm-9">
								  
								  <form:select path="categoryCode" id="categoryCode">
								  		<form:option value="" label="---Chọn thể loại bài viết---"/>
								  		<form:options items="${categories}"/> <!-- categories là map -->
								  </form:select>
								  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Tên bài viết </label>

										<div class="col-sm-9">
<%-- 											<input type="text" id="title" name="title" value="${model.title}"  /> --%>
												<form:input path="title" cssClass="col-xs-10 col-sm-5"/>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Ảnh đại diện </label>

										<div class="col-sm-9">
											<img src="${model.thumbnail }" id="img_preview"
												 style="width: 375px; height: 211px; border: 1px solid black; background-position: center; background-size: cover">
											<input id="thumbnail" name="thumbnail" type="file" onchange="previewFile()" />
											
										</div>
									</div>
									
									<div class="form-group">
										<label for="shortDescription" class="col-sm-3 control-label no-padding-right">Mô tả ngắn</label>
										<div class="col-sm-9">
<%-- 										<textarea class="form-control" rows="5" cols="10" id="shortDescription" name="shortDescription">${model.shortDescription}</textarea> --%>
										<form:textarea path="shortDescription" id="shortDescription" rows="5" cols="10" cssClass="form-control"/>
										</div>
									</div>
									
									<div class="form-group">
										<label for="content" class="col-sm-3 control-label no-padding-right">Nội dung</label>
										<div class="col-sm-9">
										<form:textarea path="content" id="content" rows="5" cols="10" cssClass="form-control"/>
<%-- 										<textarea rows="" cols="" id="content" name="content" style="width: 816px;height: 196px">${model.content }</textarea> --%>
										</div>
									</div>
									<form:hidden path="id" id="newId"/><!-- id của bài viết -->
									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
										<c:if test="${not empty model.id }">
											<button class="btn btn-info" type="button" id="btnAddOrUpdateNew">
												<i class="ace-icon fa fa-check bigger-110"></i>
												Cập nhật bài viết
											</button>
										</c:if>
										
										<c:if test="${empty model.id }">
											<button class="btn btn-info" type="button" id="btnAddOrUpdateNew">
												<i class="ace-icon fa fa-check bigger-110"></i>
												Thêm bài viết
											</button>
										</c:if>
											
											
											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												Hủy
												</button>
										</div>
										
									</div>
									
									
								</form:form>
							</div>
						</div>
					</div>
	</div>
	</div>
<!-- 	<script src="https://unpkg.com/axios/dist/axios.min.js"></script> -->
	
	<script type="text/javascript">
	
	var editor = '';
	$(document).ready(function(){ // hàm này tương tự như hàm main -> 
		// logic trong hàm này chạy đầu tiên
		editor = CKEDITOR.replace('content');
	});
	
	function previewFile() {
		const preview = document.querySelector('#img_preview');
		const file = document.querySelector('#thumbnail').files[0];
		const reader = new FileReader();
		reader.addEventListener("load", function () {
			
			// convert image file to base64 string
			preview.src = reader.result;
			
		}, false);
		
		if(file){
			reader.readAsDataURL(file);
		}
		
	}
	
		$('#btnAddOrUpdateNew').click(function (e) {
		       e.preventDefault(); 	// Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
		       						// cần truyền vào url: /api/new


		       	var formData = $('#formSubmit').serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
		       	var data = {};




		       	// Chạy vòng lặp bỏ dữ liệu từ formData vào data
		       	$.each(formData, function (i, v) {
            		data[""+v.name+""] = v.value;
        		});

				data["thumbnail"] = document.querySelector('#img_preview').getAttribute('src');

		     	// lấy riêng dữ liệu trong ckeditor ra
				data["content"] = editor.getData();

		       	
		       	// Lấy id bài viết để xét "thêm" or "cập nhật"
				var id = $('#newId').val();
				if(id == ""){ // Thêm mới bài viết
					addNew(data);
				}else{ // Cập nhật bài viết
					updateNew(data);
				}
		   });	
		
		function addNew(data) {
			$.ajax({
	            url: '${newAPI}', // gửi tới url api
	            type: 'POST',
	            contentType: 'application/json', // ép kiểu json từ client -> server
	            data: JSON.stringify(data), // parse từ JavaScript Object -> JSON 
	            dataType: 'json', // nhận kiểu json từ server -> client
	            success: function (result) {
	            	window.location.href = "${editNewURL}?id="+result.id+"&message=insert_success";
	            },
	            error: function (error) {
	            	window.location.href = "${newURL}?page=1&message=error_system";
	            }
	        });
		}
		function updateNew(data) {
			$.ajax({
	            url: '${newAPI}', // gửi tới url api
	            type: 'PUT',
	            contentType: 'application/json', // ép kiểu json từ client -> server
	            data: JSON.stringify(data),
	            dataType: 'json', // ép kiểu json từ server -> client
	            success: function (result) {
	            	window.location.href = "${editNewURL}?id="+result.id+"&message=update_success";
	            },
	            error: function (error) {
	            	window.location.href = "${newURL}?page=1&message=error_system";
	            }
	        });
		}
	</script>
</body>
</html>
