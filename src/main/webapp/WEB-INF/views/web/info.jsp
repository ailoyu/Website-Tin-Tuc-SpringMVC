<%@page import="com.laptrinhjavaweb.util.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="myTags" %>

<c:url var="commentAPI" value="/api/comment" />
<c:url var="newURL" value="/dang-nhap" />
<c:url var="registerURL" value="/dang-ky"/>
<c:url var="info" value="/thong-tin-bai-viet"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="container">

<h1 style="text-align:justify"><strong> ${model.title }</strong> </h1>
<b>${model.shortDescription}</b>
	${model.content}	
	
</div>

<h1>Comment</h1>

	 <% if(SecurityUtils.getPrincipal() != null) { %>
	 	<h5>Id Bài viết: ${ model.id }</h5>
	 	<h5>Id User: <%= SecurityUtils.getPrincipal().getId() %></h5>
	 	<h5>Tên: <%= SecurityUtils.getPrincipal().getFullName() %></h5>
	 	<h5>Username: <%= SecurityUtils.getPrincipal().getUserName() %></h5>
	 	<h5>Email: <%= SecurityUtils.getPrincipal().getEmail() %></h5>
	 <form method="post" id="formSubmit">
	 	<textarea rows="5" cols="140" placeholder="Enter your comment..." id="content" name="content"></textarea>
	 	
	 	<input type="hidden" value="<%= SecurityUtils.getPrincipal().getId() %>" id="userId" name="userId">
	 	<input type="hidden" value="${model.id}" id="newId" name="newId">
	 	<br><br>
	 	<input type="button" id="btnComment" value="Bình Luận">
	 </form>
	 <% } else { %>
	 	<h5>Vui lòng đăng nhập để có thể bình luận!</h5>
	 <% } %>
	
	<div id="treeDiv1">
    <ul>
        <c:forEach var="child" items="${comment.listComment}">
            <myTags:folderGroups item="${child }"/>
        </c:forEach>
    </ul>
</div> 
		 
<!-- 	<section style="background-color: #ad655f;"> -->
<!--   <div class="container my-5 py-5"> -->
<!--     <div class="row d-flex justify-content-center"> -->
<!--       <div class="col-md-12 col-lg-10"> -->
<!--         <div class="card text-dark"> -->
<!--          <h4 class="mb-0">Recent comments</h4> -->
<!--             <p class="fw-light mb-4 pb-2">Latest Comments section by users</p> -->
<%--         <c:forEach var="item" items="${comment.listComment}"> --%>
<!--         <hr class="my-0" /> -->
<%--         <c:if test="${ empty item.parentId }"> --%>
<!--           <div class="card-body p-4"> -->
<!--             <div class="d-flex flex-start"> -->
<!--               <img class="rounded-circle shadow-1-strong me-3" -->
<!--                 src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(23).webp" alt="avatar" width="60" -->
<!--                 height="60" /> -->
<!--               <div> -->
<%--              <b>${ item.fullName }</b>  --%>
<!--                 <h6 class="fw-bold mb-1"></h6> -->
<!--                 <div class="d-flex align-items-center mb-3"> -->
<!--                   <p class="mb-0"> -->
<%--                   <c:set var="today" value="${item.createdDate }" /> --%>
<%--                     <span class="badge bg-success"><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${today}" /></span> --%>
<!--                   </p> -->
<!--                   <a href="#!" class="link-muted"><i class="fas fa-pencil-alt ms-2"></i></a> -->
<!--                   <a href="#!" class="link-muted"><i class="fas fa-redo-alt ms-2"></i></a> -->
<!--                   <a href="#!" class="link-muted"><i class="fas fa-heart ms-2"></i></a> -->
<!--                 </div> -->
<%-- <%--                 Id comment: ${item.id }<br> --%> --%>
<%-- <%-- 				Parent id : ${item.parentId}                 --%> --%>
<!--                 <p class="mb-0"> -->
<%--                   ${item.content } --%>
<!--                 </p> -->
<!--                 <div class="d-flex justify-content-between align-items-center"> -->
<!--                   <p class="small mb-0" style="color: #aaa;"> -->
<!--                     <button class="btn btn-link" id="reply1">• Reply</button>  -->
<!--                   </p> -->
<!--                   <div class="d-flex flex-row"> -->
<!--                     <i class="far fa-check-circle text-primary"></i> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<%--             <% if(SecurityUtils.getPrincipal() != null) { %> --%>
<!--             <form class="d-none" method="post" id="formSubmit1" style="margin-left: 5em"> -->
<!--             <br> -->
<!-- 	 	<textarea rows="5" cols="60" placeholder="Enter your comment..." id="content" name="content"></textarea> -->
	 	
<%-- 	 	<input type="hidden" value="<%= SecurityUtils.getPrincipal().getId() %>" id="userId" name="userId"> --%>
<%-- 	 	<input type="hidden" value="${model.id}" id="newId" name="newId"> --%>
<%-- 	 	<input type="hidden" value="${ item.id }" id="parentId" name="parentId"> --%>
<!-- 	 	<br><br> -->
<!-- 	 	<input type="button" id="btnComment1" value="Bình Luận"> -->
<!-- 	 	<br><br> -->
<!-- 	 </form> -->
<%-- 	 <% } %> --%>
            
<%--             <c:forEach var="item2" items="${comment.listComment}"> --%>
<%--           <c:if test="${item2.parentId == item.id}"> --%>
<!--           <hr class="my-0" /> -->
<!--           		 <div class="card-body p-4" style="margin-left: 5em"> -->
<!--             <div class="d-flex flex-start"> -->
<!--               <img class="rounded-circle shadow-1-strong me-3" -->
<!--                 src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(23).webp" alt="avatar" width="60" -->
<!--                 height="60" /> -->
<!--               <div> -->
<%--              <b>${ item2.fullName }</b>  --%>
<!--                 <h6 class="fw-bold mb-1"></h6> -->
<!--                 <div class="d-flex align-items-center mb-3"> -->
<!--                   <p class="mb-0"> -->
<%--                   <c:set var="today" value="${item2.createdDate }" /> --%>
<%--                     <span class="badge bg-success"><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${today}" /></span> --%>
<!--                   </p> -->
<!--                   <a href="#!" class="link-muted"><i class="fas fa-pencil-alt ms-2"></i></a> -->
<!--                   <a href="#!" class="link-muted"><i class="fas fa-redo-alt ms-2"></i></a> -->
<!--                   <a href="#!" class="link-muted"><i class="fas fa-heart ms-2"></i></a> -->
<!--                 </div> -->
<%-- <%--                 Id comment: ${item2.id }<br> --%> --%>
<%-- <%-- 				Parent id : ${item2.parentId}                 --%> --%>
<!--                 <p class="mb-0"> -->
<%--                   ${item2.content } --%>
<!--                 </p> -->
<!--                 <div class="d-flex justify-content-between align-items-center"> -->
<!--                   <p class="small mb-0" style="color: #aaa;"> -->
<!--                     <button class="btn btn-link" id="reply2">• Reply</button>  -->
<!--                   </p> -->
<!--                   <div class="d-flex flex-row"> -->
<!--                     <i class="far fa-check-circle text-primary"></i> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
            
<%--             <c:forEach var="item3" items="${comment.listComment}"> --%>
<%--           <c:if test="${item3.parentId == item2.id}"> --%>
<!--           <hr class="my-0" /> -->
<!--           		 <div class="card-body p-4" style="margin-left: 5em"> -->
<!--             <div class="d-flex flex-start"> -->
<!--               <img class="rounded-circle shadow-1-strong me-3" -->
<!--                 src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(23).webp" alt="avatar" width="60" -->
<!--                 height="60" /> -->
<!--               <div> -->
<%--              <b>${ item3.fullName }</b>  --%>
<!--                 <h6 class="fw-bold mb-1"></h6> -->
<!--                 <div class="d-flex align-items-center mb-3"> -->
<!--                   <p class="mb-0"> -->
<%--                   <c:set var="today" value="${item3.createdDate }" /> --%>
<%--                     <span class="badge bg-success"><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${today}" /></span> --%>
<!--                   </p> -->
<!--                   <a href="#!" class="link-muted"><i class="fas fa-pencil-alt ms-2"></i></a> -->
<!--                   <a href="#!" class="link-muted"><i class="fas fa-redo-alt ms-2"></i></a> -->
<!--                   <a href="#!" class="link-muted"><i class="fas fa-heart ms-2"></i></a> -->
<!--                 </div> -->
<%-- <%--                 Id comment: ${item3.id }<br> --%> --%>
<%-- <%-- 				Parent id : ${item3.parentId}                 --%> --%>
<!--                 <p class="mb-0"> -->
<%--                   ${item3.content } --%>
<!--                 </p> -->
<!--                 <div class="d-flex justify-content-between align-items-center"> -->
<!--                   <p class="small mb-0" style="color: #aaa;"> -->
<!--                     <button class="btn btn-link" id="reply3">• Reply</button>  -->
<!--                   </p> -->
<!--                   <div class="d-flex flex-row"> -->
<!--                     <i class="far fa-check-circle text-primary"></i> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
            
<!--           </div> -->
<%--           <c:forEach var="item4" items="${comment.listComment}"> --%>
<%--           <c:if test="${item4.parentId == item3.id}"> --%>
<!--           <hr class="my-0" /> -->
<!--           		 <div class="card-body p-4" style="margin-left: 5em"> -->
<!--             <div class="d-flex flex-start"> -->
<!--               <img class="rounded-circle shadow-1-strong me-3" -->
<!--                 src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(23).webp" alt="avatar" width="60" -->
<!--                 height="60" /> -->
<!--               <div> -->
<%--              <b>${ item4.fullName }</b>  --%>
<!--                 <h6 class="fw-bold mb-1"></h6> -->
<!--                 <div class="d-flex align-items-center mb-3"> -->
<!--                   <p class="mb-0"> -->
<%--                   <c:set var="today" value="${item4.createdDate }" /> --%>
<%--                     <span class="badge bg-success"><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${today}" /></span> --%>
<!--                   </p> -->
<!--                   <a href="#!" class="link-muted"><i class="fas fa-pencil-alt ms-2"></i></a> -->
<!--                   <a href="#!" class="link-muted"><i class="fas fa-redo-alt ms-2"></i></a> -->
<!--                   <a href="#!" class="link-muted"><i class="fas fa-heart ms-2"></i></a> -->
<!--                 </div> -->
<%-- <%--                 Id comment: ${item4.id }<br> --%> --%>
<%-- <%-- 				Parent id : ${item4.parentId}                 --%> --%>
<!--                 <p class="mb-0"> -->
<%--                   ${item4.content } --%>
<!--                 </p> -->
<!--                 <div class="d-flex justify-content-between align-items-center"> -->
<!--                   <p class="small mb-0" style="color: #aaa;"> -->
<!--                     <button class="btn btn-link" id="reply4">• Reply</button>  -->
<!--                   </p> -->
<!--                   <div class="d-flex flex-row"> -->
<!--                     <i class="far fa-check-circle text-primary"></i> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<%--           </c:if> --%>
<%--           </c:forEach> --%>
<%--           </c:if> --%>
<%--           </c:forEach> --%>
<!--           </div> -->
<%--           </c:if> --%>
<%--           </c:forEach> --%>
<!--           </div> -->
<%--           </c:if> --%>
          
<%-- 		</c:forEach> --%>

<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </section> -->


<script type="text/javascript">
$('#btnComment').click(function(e) {
	e.preventDefault(); // Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
	// cần truyền vào url: /api/new

	var formData = $('#formSubmit').serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
	var data = {};

	// Chạy vòng lặp bỏ dữ liệu từ formData vào data
	$.each(formData, function(i, v) {
		data["" + v.name + ""] = v.value;
	});

	addNew(data);

});

$('#btnComment1').click(function(e) {
	e.preventDefault(); // Nếu ko có, sẽ mặc định submit vào url hiện tại đang đứng
	// cần truyền vào url: /api/new

	var formData = $('#formSubmit1').serializeArray(); // các dữ liệu dc nhập (thay thế ở trên)
	var data = {};

	// Chạy vòng lặp bỏ dữ liệu từ formData vào data
	$.each(formData, function(i, v) {
		data["" + v.name + ""] = v.value;
	});

	addNew(data);

});





function addNew(data) {
	$.ajax({
		url : '${commentAPI}', // gửi tới url api
		type : 'POST',
		contentType : 'application/json', // ép kiểu json từ client -> server
		data : JSON.stringify(data), // parse từ JavaScript Object -> JSON 
		dataType : 'json', // nhận kiểu json từ server -> client
		success : function(result) {
			window.location.href = "${info}?id=${ model.id }";
		},
		error : function(error) {
			window.location.href = "${info}?id=${ model.id }";
		}
	});
}

$('#reply1').click(function(e) {
	
	$('#formSubmit1').removeClass("d-none")
	
});


</script>

</body>
</html>