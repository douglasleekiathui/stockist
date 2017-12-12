<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<h3>New Supplier Page</h3>
<form:form method="POST" commandName="supplier"
	action="${pageContext.request.contextPath}/admin/suppliers/create.html">
	<form:errors/>
	<table>
		<tbody>
			<tr>
				<td><spring:message code="fieldLabel.supplier_no" /></td>
				<td><form:input path="supplierNo" class="form-control" /></td>
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
				<td><form:input path="supplierEmail" class="form-control" /></td>
				<td><form:errors path="supplierEmail" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><spring:message code="fieldLabel.record_status" /></td>
				<td>
				<select class="custom-select" name="recordStatus" id="recordStatus">
				  <option value="0" ${supplier.recordStatus == "0" ? 'selected="selected"' : ''}>0</option>
				  <option value="1" ${supplier.recordStatus == "1" ? 'selected="selected"' : ''}>1</option>
				</select>
				</td>
				<td><form:errors path="recordStatus" cssStyle="color: red;" /></td>
			</tr>

			<tr>
				<td><input type="submit" value="Create" class="btn btn-primary"/></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</form:form>

