<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<h3>New User page</h3>
<form:form method="POST" commandName="user"
	action="${pageContext.request.contextPath}/users/create.html">
	<form:errors/>
	<table>
		<tbody>
			<tr>
				<td><spring:message code="fieldLabel.user" /></td>
				<td><form:input path="user" class="form-control" /></td>
				<td><form:errors path="user" cssStyle="color: red;" /></td>
			</tr>
			
			<tr>
				<td><spring:message code="fieldLabel.password" /></td>
<<<<<<< HEAD
				<td><form:input path="password" class="form-control" /></td>
=======
				<td><form:input path="password" class="form-control"/></td>
>>>>>>> branch 'master' of https://github.com/douglasleekiathui/stockist
				<td><form:errors path="password" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><spring:message code="fieldLabel.user_role" /></td>
<<<<<<< HEAD
				<td><form:input path="userRole" class="form-control"/></td>
=======
				<td><form:input path="userRole" class="form-control" /></td>
>>>>>>> branch 'master' of https://github.com/douglasleekiathui/stockist
				<td><form:errors path="userRole" cssStyle="color: red;" /></td>
			</tr>

			<tr>
				<td><input type="submit" value="Create" class="btn btn-primary" /></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</form:form>

