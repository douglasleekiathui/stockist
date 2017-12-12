<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <div class="container">
            <div class="row">
                <div class="col-sm-6">
<h5><spring:message code="title.RecordProductUsage"></spring:message></h5>
<form:form method="POST" modelAttribute="tx" action="${pageContext.request.contextPath}/mechanic/recordUsage/p=${p.productNo}.html" >
<table>
<tbody>
<tr>
<td>Product Number:</td>
<td><form:input type="text" path="transactionLines[0].productNo" readOnly="true" class="form-control" /></td>
<td></td>
<td></td>
<td>Current Stock:</td>
<td><input type="text" value="${p.onhandQty}" class="form-control" readOnly="true"/></td>
</tr>
<tr></tr>
<tr>
<td>Customer Name: </td>
<td><form:input type="text" path="createdFor" class="form-control"/></td>
<td><form:errors path="createdFor" cssStyle="color: red;" /></td>
<td></td>
<td>Quantity going to use:</td>
<td><form:input type="text" path="transactionLines[0].postedQty" class="form-control" value="1" required="required"/></td>
</tr> 

<tr>
<td><input type="submit" value="Record" class="btn btn-primary" /></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
</form:form>
</div>
</div>
</div>

