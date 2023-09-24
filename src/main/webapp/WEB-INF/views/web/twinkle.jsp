<%@page import="com.laptrinhjavaweb.util.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="likeAPI" value="/api/like" />
<c:url var="postAPI" value="/api/post" />
<c:url var="personalInfo" value="/trang-ca-nhan" />
<c:url var="commentPostAPI" value="/api/commentPost" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="overflow-y: scroll; overflow-x: hidden;">
<div class="row">
<div class="col-lg-3">
<div class="position-fixed">
<div class="main-box clearfix" style="margin-left: 3em">
<div style="margin-left: auto; margin-right: auto; text-align: center">
                <h2>${model.fullName }</h2>
               
                <img src="${ model.avatar }" class="rounded-circle mb-3"
					style="width: 150px;" alt="Avatar" id="img_preview" />
                <div class="profile-label">
                    <span class="label label-danger">@${model.userName}</span>
                </div>

                <div class="profile-stars">
                	<span>Super User</span>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                </div>

                <div class="profile-since">
                    Member since: <fmt:formatDate pattern="dd-MM-yyyy | HH:mm"
					value="${model.createdDate}" />
                </div>

                    <a class="btn btn-primary btn-rounded"
					href="<c:url value='/trang-ca-nhan' />" style="color: white;">Trang cá nhân</a>
            </div>
</div>
</div>
</div>

<div class="col-lg-6" id="contentPost" >
				<form id="formSubmitStatus" class="panel-activity__status">
					<img src=""
						class="mb-3 img-fluid" style="width: 300px; display:block; margin-left: auto; margin-right: auto;" id="img_preview1" />
					<input id="thumbnail" name="thumbnail" type="file" onchange="previewFile()" style="visibility: hidden;">
					<div role="status" id="loading1" style="margin-left: 33.5em">
						<span class="sr-only">Loading...</span>
					</div>
                    <textarea name="content" id="content"
                    placeholder="What've you been up to, ${ name }?" 
                    rows="4" class="form-control"></textarea>
                    <input type="hidden" name="userId" value="${model.id }">

                    <div class="actions">
                            <button type="button" onclick="document.getElementById('thumbnail').click(); return false;"
                            class="btn-link" title="" data-toggle="tooltip" data-original-title="Post an Image">
                                <i class="fa fa-image"></i>
                            </button>

                            <div>
                        <button type="button" id="btnPostStatus" class="btn btn-sm btn-rounded btn-info" style="margin-left: 40em">
                            Post
                        </button>

					</div>

					</div>
                </form>
                <br>
                <hr />
		
			<c:if test="${ empty listPost }">
				<h5 align="center" style="margin-top: 3em"><strong style="color: graytext;">Hãy kết bạn thêm để có thêm xem được nhiều bài viết từ bạn bè nào!</strong></h5>
				<br>
			</c:if>
			
			<div id="newPost">
			
			</div>

			<c:forEach var="item" items="${listPost }">
				<div class="container mt-5 mb-5">
					<div class="row d-flex align-items-center justify-content-center">
						<div class="card">
							<div class="d-flex justify-content-between p-2 px-3">
								<div class="d-flex flex-row align-items-center">
									<a href='<c:url value="/trang-ca-nhan/${ item.userId }" />' style="color: #473C3C;">
									<img src="${ item.avatar }" width="50"
										class="rounded-circle">
									<div class="d-flex flex-column ml-2">
										<span class="font-weight-bold">${ item.fullName }</span> 
										<small><a href='<c:url value="/trang-ca-nhan/${ item.userId }" />' style="color: black;"><fmt:formatDate
											pattern="dd-MM-yyyy HH:mm" value="${item.createdDate}" /></a></small>
									</div>
									</a>
								</div>
								
								<div class="d-flex flex-row mt-1 ellipsis">
									<a
									class="fa fa-ellipsis-h"
									href="" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"></a>
									<ul class="dropdown-menu">
										<li><button class="dropdown-item" type="button" 
										>Xem chi tiết bài viết</button></li>
										<li><hr class="dropdown-divider"></li>
										<li><button class="dropdown-item" type="button" 
										>Ẩn bài viết</button></li>
									</ul>
								</div>
							</div>
							<p class="text-justify">${ item.content }</p>
							<c:if test="${ not empty item.thumbnail }">
								<img src="${ item.thumbnail }" class="img-fluid">
							</c:if>
							<c:if test="${ empty item.thumbnail }">
								<h1 class="text-justify" style="margin-left: 5px">${ item.content }</h1>
							</c:if>
							<div class="p-2">
								<hr>
								<div class="d-flex justify-content-between align-items-center">
									<div class="d-flex flex-row icons d-flex align-items-center">
									<form id="likeFormSubmit-${item.id }">
										<input type="hidden" name="userId" id="userId"
							value="${ model.id }">
									<input type="hidden" name="postId" id="postId"
							value="${item.id}">
									<c:if test="${ item.liked != true }">
										<i id="likeButton-${item.id }" class="far fa-heart" style="color: #FF69B4;">
										
										
										</i>
										
										<a id="likeCount-${ item.id }" style="color: #FF69B4; font-weight: bold; font-size: 25px"
										class="tags" data-gloss="<c:forEach var="user" items="${item.likes}">${user.userDTO.fullName}&#10;</c:forEach>"
										
										>${ item.likes.size() }</a>
									</c:if>
									<c:if test="${ item.liked == true }">
										<i id="likeButton-${item.id }" class="fa fa-heart" style="color: #FF69B4;">
										</i>
										
										<a id="likeCount-${ item.id }" style="color: #FF69B4; font-weight: bold; font-size: 25px"
										class="tags" data-gloss="<c:forEach var="user" items="${item.likes}">${user.userDTO.fullName}&#10;</c:forEach>"
										
										>${ item.likes.size() }</a>
									</c:if>
									</form>
									</div>
									<div class="d-flex flex-row muted-color">
										<a id="commentCount-${ item.id }">${ item.comments.size() }</a> &#160;comments
									<span class="ml-2">Share</span>
									</div>
								</div>
								<hr>
								<div id="comments-${ item.id }" class="comments" style="overflow-y: scroll; overflow-x: hidden; 
								display: flex; flex-direction: column;max-height: 350px;">
								<c:forEach var="item2" items="${ item.comments }">
									<div class="d-flex flex-row" style="margin-bottom: 10px">
									<a href='<c:url value="/trang-ca-nhan/${ item2.userId }" />'>
										<img src="${ item2.avatar }" width="40"
											class="rounded-image">
									</a>
										<div class="d-flex flex-column ml-2">
										<a href='<c:url value="/trang-ca-nhan/${ item2.userId }" />' style="color: #473C3C;">
											<span class="name">${item2.fullName }</span>
											</a>
												<c:if test="${ not empty item2.thumbnail }">
												<img src="${ item2.thumbnail }"	class="mb-3 img-fluid" style="width: 100px; margin-right: 30em;"/>
												</c:if>
												${ item2.content }
											<div class="d-flex flex-row align-items-center status">
												<small>Like</small> <small>Reply</small> <small>Translate</small>
												<small>18 mins</small>
											</div>
										</div>
										<div class="card-body p-4" style="margin-left: 3em">
<%-- 										<myTags:folderGroupsCommentPost item="${item}"></myTags:folderGroupsCommentPost> --%>
										</div>
									</div>
								</c:forEach>
									<div id="commentArea-${ item.id }">
									
									</div>
								</div>
									<div class="comment-input">
									<form id="commentSubmit-${ item.id }">
										<input type="hidden" name="userId"
											value="${ model.id }">
										<input type="hidden" name="postId"
											value="${ item.id }">
											<div>
										<img src=""	class="mb-3 img-fluid" style="width: 100px; margin-right: 30em;" id="img_preview-${item.id }" />
										<div class="" role="status" id="loading-${item.id}" style="margin-left: 33.5em">
											<span class="sr-only">Loading...</span>
										</div>

										<textarea id="content1-${ item.id }" name="content" class="form-control" placeholder="Nhập bình luận ở đây..."></textarea>
										<div class="fonts">
								
					
										</div>
                             <div class="actions">
	                            <button type="button" onclick="document.getElementById('thumbnail-${ item.id }').click(); return false;"
	                            class="btn-link fa fa-image" title="" data-toggle="tooltip" data-original-title="Post an Image" style="margin-top: 15px; display: inline-block;">
	                            </button>
	                            <input id="thumbnail-${ item.id }" name="thumbnail" type="file" onchange="previewFile2(${item.id })" style="visibility: hidden;">
		                        <input type="button" id="btnSubmitComment-${ item.id }" 
		                        class="btn btn-sm btn-rounded btn-info" 
		                        style="margin-left: 12em"
		                        value="Post">
                  		  	</div>
										</form>
									</div>
							</div>
						</div>
					</div>
				</div>
				
				
			</c:forEach>
			</div>
			<div class="col-lg-3">
			
			<div class="position-fixed" style="overflow-y: scroll; overflow-x: hidden; height: 30em; margin-left: 1em">
					<div class="d-flex align-items-center" >
							<h3 style="">Danh sách bạn bè</h3>
						</div>
					<c:forEach var="item" items="${listFriend }">
						<a href="<c:url value="/trang-ca-nhan/${ item.id }" />" class="list-group-item list-group-item-action border-0">
							<div class="d-flex align-items-start">
								<img src="${item.avatar }" class="rounded-circle mr-1" alt="Vanessa Tucker" width="40" height="40">
								<div class="flex-grow-1 ml-3">
									${item.fullName }
									<div class="small"><span class="fas fa-circle chat-online"></span> Offline</div>
								</div>
							</div>
						</a>
					</c:forEach>
					

</div>
</div>
			</div>
			</div>
			
			
			<script type="text/javascript">
$( document ).ready(function() {
	$("div[id*='comments-']").scrollTop(function() {
		return this.scrollHeight;
	});
});

function previewFile() {
	const preview = document.querySelector('#img_preview1');
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

function previewFile2(postId) {
	const preview = document.querySelector('#img_preview-'+postId);
	const file = document.querySelector('#thumbnail-'+postId).files[0];
	const reader = new FileReader();
	reader.addEventListener("load", function () {
		
		// convert image file to base64 string
		preview.src = reader.result;
		
	}, false);
	
	if(file){
		reader.readAsDataURL(file);
	}
	
}


$("i[id*='likeButton-']").click(function (e) {
	let postId = $(this).prop("id").split("-")[1];
	var formData = $('#likeFormSubmit-' + postId).serializeArray();
	var data = {};
	$.each(formData, function (i, v) {
		data[""+v.name+""] = v.value;
	});
	var classLikeButton = $('#likeButton-'+postId).attr('class');
	if(classLikeButton == 'far fa-heart'){ // chưa like -> thì like
		data["status"] = "LIKE";
		addLike(data, postId);
	} else { 							   // like rồi thì unlike
		deleteLike(data, postId)
	}
	
});

function addLike(data, postId) {
	$.ajax({
		url : '${likeAPI}', // gửi tới url api
		type : 'POST',
		contentType : 'application/json', // ép kiểu json từ client -> server
		data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
		dataType : 'json', // nhận kiểu json từ server -> client
		success : function(result) {
			$('#likeButton-'+postId).attr('class', 'fa fa-heart');
			var p = $('#likeCount-'+postId).attr('data-gloss');
			$('#likeCount-'+postId).attr('data-gloss', '<%= SecurityUtils.getPrincipal().getFullName() %>\n' + p);
			// tăng số lượng like + 1
			var likeCount = document.getElementById("likeCount-"+postId).innerHTML;
			document.getElementById("likeCount-"+postId).innerHTML = parseInt(likeCount) + 1;
		},
		error : function(error) {

		}
	});
}

function deleteLike(data, postId) {
	$.ajax({
		url : '${likeAPI}', // gửi tới url api
		type : 'DELETE',
		contentType : 'application/json', // ép kiểu json từ client -> server
		data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
		dataType : 'json', // nhận kiểu json từ server -> client
		success : function(result) {
			$('#likeButton-'+postId).attr('class', 'far fa-heart');
			
			
			var p = $('#likeCount-'+postId).attr('data-gloss');
			const myArray = p.split("\n");
			myArray.pop();
			
			for(let i = 0; i <= myArray.length - 1; i++){
				if(myArray[i] == "<%= SecurityUtils.getPrincipal().getFullName() %>"){
					for(let j = i; j < myArray.length - 1; j++){
						myArray[j] = myArray[j + 1]; 
					}
					myArray.pop();
				}	
			}
			
			const listName = myArray.map(x => x + '\n');
			
			
			$('#likeCount-'+postId).attr('data-gloss', listName.join(""));
			
			
			var likeCount = document.getElementById("likeCount-"+postId).innerHTML;
			document.getElementById("likeCount-"+postId).innerHTML = parseInt(likeCount) - 1;
		},
		error : function(error) {

		}
	});
}

$("input[id*='btnSubmitComment-']").click(function(e) {
	e.preventDefault(); // Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
	let commentId = $(this).prop("id").split("-")[1]

	$('#loading-'+commentId).addClass('spinner-border');


	var formData = $('#commentSubmit-' + commentId).serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
	var data = {};
	
	
	data["thumbnail"] = document.querySelector('#img_preview-'+commentId).getAttribute('src');
	
	
	// Chạy vòng lặp bỏ dữ liệu từ formData vào data
	$.each(formData, function (i, v) {
	data[""+v.name+""] = v.value;
	});
	
	addComment(data, commentId);
	
});


function addComment(data, commentId) {
	$.ajax({
		url : '${commentPostAPI}', // gửi tới url api
		type : 'POST',
		contentType : 'application/json', // ép kiểu json từ client -> server
		data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
		dataType : 'json', // nhận kiểu json từ server -> client
		success : function(result) {
			$('#loading-'+commentId).removeClass('spinner-border');

			<% if(SecurityUtils.getPrincipal() != null){ %>
			$( document ).ready(function() {
				$("div[id*='comments-']").scrollTop(function() {
					return this.scrollHeight;
				});
			});
			$('#content1-'+result.postId).val('');
			$('#img_preview-'+result.postId).attr('src', '');
			var commentCount = document.getElementById("commentCount-"+result.postId).innerHTML;
			document.getElementById("commentCount-"+result.postId).innerHTML = parseInt(commentCount) + 1;
			
				if(result.thumbnail != null){
					$('#commentArea-'+commentId).append('<div class="d-flex flex-row" style="margin-bottom: 10px">'+
							'<img src="<%= SecurityUtils.getPrincipal().getAvatar() %>" width="40"'+
					'class="rounded-image">'+
							'<div class="d-flex flex-column ml-2">'+
							'<span class="name"><%= SecurityUtils.getPrincipal().getFullName() %></span>'+
					'<img src="'+ result.thumbnail +'" class="mb-3 img-fluid" style="width: 100px; margin-right: 30em;"/>'+
					result.content +
					'<div class="d-flex flex-row align-items-center status">'+
						'<small>Like</small> <small>Reply</small> <small>Translate</small>'+
						'<small>18 mins</small>'+
					'</div></div></div>');
				} else {
					$('#commentArea-'+commentId).append('<div class="d-flex flex-row" style="margin-bottom: 10px">'+
							'<img src="<%= SecurityUtils.getPrincipal().getAvatar() %>" width="40"'+
					'class="rounded-image">'+
							'<div class="d-flex flex-column ml-2">'+
							'<span class="name"><%= SecurityUtils.getPrincipal().getFullName() %></span>'+
					result.content +
					'<div class="d-flex flex-row align-items-center status">'+
						'<small>Like</small> <small>Reply</small> <small>Translate</small>'+
						'<small>18 mins</small>'+
					'</div></div></div>');
				}
			
			<% } %>
				
			
		},
		error : function(error) {

		}
	});
}

$('#btnPostStatus').click(function (e) {
	$('#loading1').addClass('spinner-border');

       e.preventDefault(); 	// Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
       						// cần truyền vào url: /api/new


       	var formData = $('#formSubmitStatus').serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
       	var data = {};
       	
       	
       	data["thumbnail"] = document.querySelector('#img_preview1').getAttribute('src');


       	// Chạy vòng lặp bỏ dữ liệu từ formData vào data
       	$.each(formData, function (i, v) {
			data[""+v.name+""] = v.value;
		});
       	
       	
       	addPost(data);
       	
   });	


function addPost(data) {
	$.ajax({
		url : '${postAPI}', // gửi tới url api
		type : 'POST',
		contentType : 'application/json', // ép kiểu json từ client -> server
		data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
		dataType : 'json', // nhận kiểu json từ server -> client
		success : function(result) {
			window.location.href = "${personalInfo}/${model.id}";
		},
		error : function(error) {

		}
	});
}


</script>
</body>



</html>