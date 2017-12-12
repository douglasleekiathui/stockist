<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
            <div class="row">
                <div class="col-sm">
<h5>New User page</h5>
<form:form method="POST" commandName="user"
	action="${pageContext.request.contextPath}/admin/users/create.html">
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
				<td><form:input path="password" class="form-control" /></td>
				<td><form:errors path="password" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><spring:message code="fieldLabel.user_role" /></td>
				<td>
				<select class="custom-select" name="userRole" id="userRole">
				  <option value="ADMIN" ${user.userRole == "ADMIN" ? 'selected="selected"' : ''}>ADMIN</option>
				  <option value="MECHANIC" ${user.userRole == "MECHANIC" ? 'selected="selected"' : ''}>MECHANIC</option>
				</select>
				</td>
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

