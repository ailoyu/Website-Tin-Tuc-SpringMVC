<%@ attribute name="item" type="com.laptrinhjavaweb.dto.CommentDTO"
	required="true"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="myTags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${ item.parentId == null }">
	<li>${ item.content }</li>
	<c:forEach var="item1" items="${ comment.listComment }">
		<c:if test="${item1.parentId == item.id }">
			<li style="margin-left: 3em">${ item1.content }</li>
			<c:forEach var="item2" items="${ comment.listComment }">
				<c:if test="${item2.parentId == item1.id }">
					<li style="margin-left: 6em">${ item2.content }</li>
					<myTags:folderGroups item="${item2 }" />
				</c:if>
			</c:forEach>
		</c:if>
	</c:forEach>
</c:if>




