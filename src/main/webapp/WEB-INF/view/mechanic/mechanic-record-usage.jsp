<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h3>Record product usage</h3>
<form:form method="POST" modelAttribute="tx" action="${pageContext.request.contextPath}/mechanic/recordUsage/p=${p.productNo}.html" >
<table>
<tbody>
<tr>
<td>Product Number:</td>
<td><form:input type="text" path="transactionLines[0].productNo" readOnly="true" class="form-control" /></td>
<tr>
<tr>
<td>Current Stock:</td>
<td><input type="text" value="${p.onhandQty}" class="form-control" readOnly="true"/></td>
<tr>
<td>Customer Name: </td>
<td><form:input type="text" path="createdFor" class="form-control"/></td>
<td><form:errors path="createdFor" cssStyle="color: red;" /></td>
</tr>
<tr>
<td>Quantity going to use:</td>
<td><form:input type="text" path="transactionLines[0].postedQty" class="form-control" value="1"/></td>
</tr>  
<tr>
<td><input type="submit" value="Record" class="btn btn-primary" /></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
</form:form>
