<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h3>Edit Supplier page</h3>

<form:form method="POST" modelAttribute="supplier"
	action="${pageContext.request.contextPath}/suppliers/edit/${suppliers.supplierNo}.html">
	<table>
		<tbody>
			<tr>
				<td><spring:message code="fieldLabel.supplier_no" /></td>
				<td><form:input path="supplierNo" readonly="true" /></td>
				<td><form:errors path="supplierNo" cssStyle="color: red;" /></td>
			</tr>
			
			<tr>
				<td><spring:message code="fieldLabel.supplier_name" /></td>
				<td><form:input path="supplierName" /></td>
				<td><form:errors path="supplierName" cssStyle="color: red;" /></td>
			</tr>
			
			<tr>
				<td><spring:message code="fieldLabel.supplier_contact" /></td>
				<td><form:input path="supplierContact" /></td>
				<td><form:errors path="supplierContact" cssStyle="color: red;" /></td>
			</tr>
			
			<tr>
				<td><spring:message code="fieldLabel.supplier_email" /></td>
				<td><form:input path="supplierEmail" /></td>
				<td><form:errors path="supplierEmail" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><spring:message code="fieldLabel.record_status" /></td>
				<td><form:input path="recordStatus" /></td>
				<td><form:errors path="recordStatus" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Update" /></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</form:form>

