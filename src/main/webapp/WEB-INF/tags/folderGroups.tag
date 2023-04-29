<%@ attribute name="item" type="com.laptrinhjavaweb.dto.CommentDTO"
	required="true"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="myTags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">


<c:if test="${ empty item.parentId }">
	<div class="card-body p-4">
		<div class="d-flex flex-start">
			<img class="rounded-circle shadow-1-strong me-3"
				src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(23).webp"
				alt="avatar" width="60" height="60" />
			<div>
				<b>${ item.fullName }</b>
				<h6 class="fw-bold mb-1"></h6>
				<div class="d-flex align-items-center mb-3">
					<p class="mb-0">
						<c:set var="today" value="${item.createdDate }" />
						<span class="badge bg-success"><fmt:formatDate
								pattern="dd-MM-yyyy HH:mm" value="${today}" /></span>
					</p>
					<a href="#!" class="link-muted"><i
						class="fas fa-pencil-alt ms-2"></i></a> <a href="#!"
						class="link-muted"><i class="fas fa-redo-alt ms-2"></i></a> <a
						href="#!" class="link-muted"><i class="fas fa-heart ms-2"></i></a>
				</div>
				<%--                 Id comment: ${item.id }<br> --%>
				<%-- 				Parent id : ${item.parentId}                 --%>
				<p class="mb-0">${item.content }</p>
				<div class="d-flex justify-content-between align-items-center">
					<p class="small mb-0" style="color: #aaa;">
						<button class="btn btn-link" id="reply1">Reply</button>
					</p>
					<div class="d-flex flex-row">
						<i class="far fa-check-circle text-primary"></i>
					</div>
				</div>
			</div>
		</div>
		<c:forEach var="item2" items="${comment.listComment}">
			<c:if test="${item2.parentId == item.id}">
				<hr class="my-0" />
				<div class="card-body p-4" style="margin-left: 5em">
					<div class="d-flex flex-start">
						<img class="rounded-circle shadow-1-strong me-3"
							src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(23).webp"
							alt="avatar" width="60" height="60" />
						<div>
							<b>${ item2.fullName }</b>
							<h6 class="fw-bold mb-1"></h6>
							<div class="d-flex align-items-center mb-3">
								<p class="mb-0">
									<c:set var="today" value="${item2.createdDate }" />
									<span class="badge bg-success"><fmt:formatDate
											pattern="dd-MM-yyyy HH:mm" value="${today}" /></span>
								</p>
								<a href="#!" class="link-muted"><i
									class="fas fa-pencil-alt ms-2"></i></a> <a href="#!"
									class="link-muted"><i class="fas fa-redo-alt ms-2"></i></a> <a
									href="#!" class="link-muted"><i class="fas fa-heart ms-2"></i></a>
							</div>
							<%--                 Id comment: ${item2.id }<br> --%>
							<%-- 				Parent id : ${item2.parentId}                 --%>
							<p class="mb-0">${item2.content }</p>
							<div class="d-flex justify-content-between align-items-center">
								<p class="small mb-0" style="color: #aaa;">
									<button class="btn btn-link" id="reply2">Reply</button>
								</p>
								<div class="d-flex flex-row">
									<i class="far fa-check-circle text-primary"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</c:if>




