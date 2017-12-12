<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
            <div class="row">
                <div class="col-sm">
<h5>Edit User page</h5>

<form:form method="POST" modelAttribute="user"
	action="${pageContext.request.contextPath}/admin/users/edit/${users.user}.html">
	<table>
		<tbody>
			<tr>
				<td><spring:message code="fieldLabel.user" /></td>
				<td><form:input path="user" readonly="true" class="form-control"/></td>
				<td><form:errors path="user" cssStyle="color: red;" /></td>
			</tr>
			
			<tr>
				<td><spring:message code="fieldLabel.password" /></td>
				<td><form:input path="password" class="form-control"/></td>
				<td><form:errors path="password" cssStyle="color: red;" /></td>
			</tr>
			
			<tr>
				<td><spring:message code="fieldLabel.user_role" /></td>
				<td><form:input path="userRole" class="form-control"/></td>
				<td><form:errors path="userRole" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Update" class="btn btn-primary" /></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</form:form>
</div>
</div>
</div>

