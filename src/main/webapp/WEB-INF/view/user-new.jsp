<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h3>New User page</h3>
<form:form method="POST" commandName="user"
	action="${pageContext.request.contextPath}/users/create.html">
	<table>
		<tbody>
			<tr>
				<td><spring:message code="fieldLabel.user" /></td>
				<td><form:input path="user" /></td>
				<td><form:errors path="user" cssStyle="color: red;" /></td>
			</tr>
			
			<tr>
				<td><spring:message code="fieldLabel.password" /></td>
				<td><form:input path="password" /></td>
				<td><form:errors path="password" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><spring:message code="fieldLabel.user_role" /></td>
				<td><form:input path="userRole" /></td>
				<td><form:errors path="userRole" cssStyle="color: red;" /></td>
			</tr>

			<tr>
				<td><input type="submit" value="Create" /></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</form:form>

