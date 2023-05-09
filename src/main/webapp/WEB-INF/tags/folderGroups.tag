<%@ tag import="com.laptrinhjavaweb.util.SecurityUtils" %>
<%@ attribute name="item" type="com.laptrinhjavaweb.dto.CommentDTO"
			  required="true"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="myTags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta http-equiv="content-type" charset="UTF-8">
<%@ tag pageEncoding="UTF-8" %>

<c:forEach var="item2" items="${comment.listComment}">
	<c:if test="${item2.parentId == item.id}">
		<hr class="my-0" />
		<div class="card-body p-4" style="margin-left: 3em">
			<div class="d-flex flex-start">
				<img class="rounded-circle shadow-1-strong me-3"
					 src="${ item2.avatar }"
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
					<p class="mb-0">${item2.content }</p>
					<%
						if (SecurityUtils.getPrincipal() != null) {
					%>
					<div class="d-flex justify-content-between align-items-center">
						<p class="small mb-0" style="color: #aaa;">
							<button class="btn btn-link" id="replyBtn-${item2.id}">Reply</button>
						</p>
						<br><br>
						<div class="d-flex flex-row">
							<i class="far fa-check-circle text-primary"></i>
						</div>

					</div>
					<form class="d-none" method="post" id="replyForm-${item2.id}">
                                    <textarea class="form-control"
											  rows="3" cols="50" placeholder="Enter your comment..."
											  id="content1" name="content"></textarea>

						<input type="hidden"
							   value="<%=SecurityUtils.getPrincipal().getId()%>"
							   name="userId">
						<input type="hidden" value="${model.id}"
							   name="newId">
						<input type="hidden" value="${item2.id}" name="parentId">
						<br>
						<br> <input class="btn btn-primary" type="button" id="btnComment-${item2.id}" value="Bình Luận"><br><br><br>
					</form>

				<%
					}
				%>


				</div>
			</div>
			<myTags:folderGroups item="${item2}" />
		</div>
	</c:if>
</c:forEach>





