<%@page import="com.laptrinhjavaweb.util.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="friendAPI" value="/api/friend" />
<c:url var="personalInfo" value="/trang-ca-nhan"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang cá nhân</title>
</head>
<body>
	<div class="container">
    <br>
    <br>
    <div class="text-center">
        <h1>TRANG CÁ NHÂN</h1>
    </div>

    <c:if test="${not empty message }">
        <div class="alert alert-${alert}">${message}</div>
    </c:if>


        <div class="row">
            <div class="col-md-6" style="margin-bottom: 3em">
                <br>
                <div style="margin-left:auto;margin-right:auto;text-align:center">
                    <img src="${ model.avatar }"
                         class="rounded-circle mb-3" style="width: 150px;" alt="Avatar" id="img_preview" />
                    <h5 class="mb-2">
                        <strong>${ model.fullName }</strong>
                    </h5>
                    <p class="text-muted">
                        @${ model.userName } <span class="badge bg-primary"></span>
                    </p>
                    <% String userName = request.getAttribute("userName").toString(); %>
                    <% if(SecurityUtils.getPrincipal() != null) { %>
	                    <% if (!SecurityUtils.getPrincipal().getUsername().equals(userName)) {%>
	                    <form id="formSubmit" style="display: inline-block;">
		                    <c:if test="${ friend.status == null && friend1.status == null }">
		                    <input type="hidden" name="requesterId" id="requesterId" value="<%=SecurityUtils.getPrincipal().getId() %>">
		                    <input type="hidden" name="addresseeId" id="addresseeId" value="${model.id }">
		                    <input name="addFriend" id="addFriend" type="submit" class="btn btn-primary btn-rounded" style="color: white;" value="Kết bạn">
		                    </c:if>
		                    <c:if test="${ friend.status == false }">
		                    <input type="hidden" name="requesterId" id="requesterId" value="<%=SecurityUtils.getPrincipal().getId() %>">
		                    <input type="hidden" name="addresseeId" id="addresseeId" value="${model.id }">
		                    <input name="addFriend" id="addFriend" type="submit" class="btn btn-primary btn-rounded" style="color: white;" value="Hủy kết bạn">
		                    </c:if>
		                    <c:if test="${ friend1.status == false }">
		                    <input type="hidden" name="requesterId" id="requesterId" value="${model.id }">
		                    <input type="hidden" name="addresseeId" id="addresseeId" value="<%=SecurityUtils.getPrincipal().getId() %>">
		                    <input name="addFriend" id="addFriend" type="submit" class="btn btn-primary btn-rounded" style="color: white;" value="Chấp nhận lời mời kết bạn">
		                    </c:if>
	                    </form>
	                    <c:if test="${ friend.status == true }">
	                    	<input type="hidden" name="requesterId" id="requesterId" value="<%=SecurityUtils.getPrincipal().getId() %>">
		                    <input type="hidden" name="addresseeId" id="addresseeId" value="${model.id }">
		                    <button data-toggle="tooltip" id="unfriend" type="button" onclick="warningBeforeDelete()" class="btn btn-primary btn-rounded" style="color: white;">Bạn bè</button>
		                </c:if>
		                <c:if test="${ friend1.status == true }">
		                	<input type="hidden" name="requesterId" id="requesterId" value="<%=SecurityUtils.getPrincipal().getId() %>">
		                    <input type="hidden" name="addresseeId" id="addresseeId" value="${model.id }">
		                    <button data-toggle="tooltip" id="unfriend" type="button" onclick="warningBeforeDelete()" class="btn btn-primary btn-rounded" style="color: white;">Bạn bè</button>
		                </c:if>
		                <a href='<c:url value="/tin-nhan" />' type="button" class="btn btn-primary btn-rounded" style="color: white;">Gửi tin nhắn</a>
	                   <% } else { %>
	                    <a class="btn btn-primary btn-rounded" href="<c:url value='/thay-doi-thong-tin' />" style="color: white;">Chỉnh sửa trang cá nhân</a>
	                    <% } %>
	            	<% } %>
                </div>
            </div>
            <div class="col-md-6">
                <div class="mb-3">
                    <label class="form-label"><strong>Họ Và Tên</strong> </label> <input
                        type="text" class="form-control" id="fullName" name="fullName"
                        value="${ model.fullName }" disabled="disabled">
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>Ngày khởi tạo</strong> </label><br>
                    <fmt:formatDate pattern="dd-MM-yyyy | HH:mm" value="${model.createdDate}" />
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label"><strong>Email</strong></label> <input
                        type="email" class="form-control" id="email" name="email"
                        value="${ model.email }" disabled="disabled">
                </div>
                <hr />

            </div>

            <br>
            <br>
            <br>
        </div>
        <c:if test="${ empty listFriend1 }">
        <div class="row">
        <div class="col-md-6 col-lg-4" style="margin-left:auto;margin-right:auto;text-align:center">
            <div class="card">
                <div class="header">
                    <h4><a href='<c:url value="/trang-ca-nhan/${model.id }/danh-sach-ban-be" />' ><strong style="color: graytext;">Danh sách bạn bè</strong></a></h4>
                </div>
                <div class="body">
                    <ul class="new_friend_list list-unstyled row">
                    <c:forEach var="item" items="${listFriend }">
                    	 <li class="col-lg-4 col-md-2 col-sm-6 col-4">
                            <a href='<c:url value="/trang-ca-nhan/${ item.id }" />'>
                                <img width="120em" src="${ item.avatar }" class="img-thumbnail" alt="User Image">
                                <h6 class="users_name">${ item.fullName}</h6>
                            </a>
                        </li>
                    </c:forEach>  
                       
                                                
                    </ul>
                </div>
            </div>
           
        </div>
         <div class="col-md-6"></div>
        	
        </div>
        </c:if>
        <c:if test="${ not empty listFriend1 }">
        <div class="row">
        <h4><a href='<c:url value="/trang-ca-nhan/${model.id }/danh-sach-ban-be" />' ><strong style="color: graytext;">Danh sách bạn bè</strong></a></h4>
        <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="people-nearby">
              <c:forEach var="item" items="${ listFriend1 }">
             
              <div class="nearby-user">
                <div class="row ">
                  <div class="col-md-2 col-sm-2">
                  	<a href='<c:url value="/trang-ca-nhan${ item.id }" />'>
                    	<img src="${ item.avatar }" alt="user" class="profile-photo-lg">
                  	</a>
                  </div>
                  <div class="col-md-7 col-sm-7">
                  <a href='<c:url value="/trang-ca-nhan/${ item.id }" />'>
                    <h5>${item.fullName }</h5>
                    <p class="text-muted">@${item.userName }</p>
                  </a>
                  </div>
                  <div class="col-md-3 col-sm-3">
                    <button class="btn btn-primary pull-right">Add Friend</button>
                  </div>
                </div>
              </div>
              </a>
              </c:forEach>
            </div>
    	</div>
	</div>
</div>
        
        </div>
        </c:if>


</div>

<script type="text/javascript">
	$('#addFriend').click(function(e) {
		
		e.preventDefault(); // Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
		
		// cần truyền vào url: /api/new
		var formData = $('#formSubmit').serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
		var data = {};
	
		// Chạy vòng lặp bỏ dữ liệu từ formData vào data
		$.each(formData, function(i, v) {
			data["" + v.name + ""] = v.value;
		});
		
		var buttonAddFriend = $('#addFriend').val();
		if(buttonAddFriend == 'Chấp nhận lời mời kết bạn'){
			data["status"] = true;
		}
		
		addFriend(data);
		
	
	});
	
	
	function addFriend(data) {
		$.ajax({
			url : '${friendAPI}', // gửi tới url api
			type : 'POST',
			contentType : 'application/json', // ép kiểu json từ client -> server
			data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
			dataType : 'json', // nhận kiểu json từ server -> client
			success : function(result) {
				var buttonAddFriend = $('#addFriend').val();
				if(buttonAddFriend == 'Kết bạn'){
					$('#addFriend').val('Hủy kết bạn');
				} else if(buttonAddFriend == 'Chấp nhận lời mời kết bạn'){
					window.location.href = "${personalInfo}/${model.id}";
				} else if(buttonAddFriend == 'Hủy kết bạn'){
					$('#addFriend').val('Kết bạn');
				} 
			},
			error : function(error) {
				
			}
		});
	}
	
	
	function warningBeforeDelete() {
			swal({
			  title: "Xác nhận hủy kết bạn",
			  text: "Bạn có muốn hủy kết bạn hay không?",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-success",
			  cancelButtonClass: "btn-danger",
			  confirmButtonText: "Xác nhận",
			  cancelButtonText: "Hủy bỏ",
			}).then(function(result) {
				if(result.value){
					var data = {};
					data["requesterId"] = $('#requesterId').val();
					data["addresseeId"] = $('#addresseeId').val();
					unfriend(data);			
				} 
		});
	}
	
	function unfriend(data) {
		$.ajax({
			url : '${friendAPI}', // gửi tới url api
			type : 'DELETE',
			contentType : 'application/json', // ép kiểu json từ client -> server
			data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
			dataType : 'json', // nhận kiểu json từ server -> client
			success : function(result) {
				window.location.href = "${personalInfo}/${model.id}";
			},
			error : function(error) {
				window.location.href = "${personalInfo}/${model.id}";
			}
		});
	}
</script>
	
</body>
</html>