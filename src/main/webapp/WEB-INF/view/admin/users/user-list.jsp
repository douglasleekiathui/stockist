
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="container">
                <div class="col xs-12">
                <h5>User List page</h5>
<a href="${pageContext.request.contextPath}/admin/users/create.html">Add User</a>
<c:if test="${fn:length(uList) gt 0}">
	<table class="table">
		<thead>
			<tr class="listHeading">
				<th><spring:message code="fieldLabel.user" /></th>
				<th><spring:message code="fieldLabel.password" /></th>
				<th><spring:message code="fieldLabel.user_role" /></th>

				<th><spring:message code="caption.edit" /></th>
				<th><spring:message code="caption.delete" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="users" items="${uList}">
			 
				<tr class="listRecord">
					<td>${users.user}</td>
					<td>${users.password}</td>
					<td>${users.userRole}</td>

					<td><a
						href="${pageContext.request.contextPath}/admin/users/edit/${users.user}.html"><spring:message
								code="caption.edit" /></a></td>
					<td><a
						href="${pageContext.request.contextPath}/admin/users/delete/${users.user}.html"><spring:message
								code="caption.delete" /></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:if>
	</div>   
			</div>
