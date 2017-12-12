<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h3>Edit Supplier Page</h3>

<form:form method="POST" modelAttribute="supplier"
	action="${pageContext.request.contextPath}/admin/suppliers/edit/${suppliers.supplierNo}.html">
	<table>
		<tbody>
			<tr>
				<td><spring:message code="fieldLabel.supplier_no" /></td>
				<td><form:input path="supplierNo" readonly="true" class="form-control" /></td>
				<td><form:errors path="supplierNo" cssStyle="color: red;" /></td>
			</tr>
			
			<tr>
				<td><spring:message code="fieldLabel.supplier_name" /></td>
				<td><form:input path="supplierName" class="form-control"/></td>
				<td><form:errors path="supplierName" cssStyle="color: red;" /></td>
			</tr>
			
			<tr>
				<td><spring:message code="fieldLabel.supplier_contact" /></td>
				<td><form:input path="supplierContact" class="form-control" /></td>
				<td><form:errors path="supplierContact" cssStyle="color: red;" /></td>
			</tr>
			
			<tr>
				<td><spring:message code="fieldLabel.supplier_email" /></td>
				<td><form:input path="supplierEmail" class="form-control"/></td>
				<td><form:errors path="supplierEmail" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><spring:message code="fieldLabel.record_status" /></td>
				<td><form:input path="recordStatus" class="form-control"/></td>
				<td><form:errors path="recordStatus" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Update" class="btn btn-primary"/></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</form:form>

