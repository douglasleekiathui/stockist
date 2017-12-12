<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Receive or Purchase Inventory</title>
<style>
.txline{height:3em;}
</style>
<div class="container">
					<div class="row">
						<div class="col-sm-6">
<h3>Update Inventory Receipt/Purchase</h3>
<table >
<form:form method="POST" modelAttribute="tx" action="${pageContext.request.contextPath}/products/orders/new/p=${p.productNo}.html" >
<tr>
<td>Date: </td>
<td><form:input type="date" path="transactionDate" class="form-control"/></td>
<td><form:errors path="transactionDate" cssStyle="color: red;" /></td>
</tr>
<tr>
<td>Supplier Name: </td>
<td><form:input type="text" path="createdFor" class="form-control" /></td>
<td><form:errors path="createdFor" cssStyle="color: red;"  /></td>
</tr>
<c:forEach varStatus="tl" items="${tx.transactionLines}">
<tr>
<td>Line:</td>
<td><input type="text" value="${tl.index+1}" name="lineNo" class="form-control" readOnly="true"/></td>
</tr>
<tr>
<td>Part Number:</td>
<td><form:input type="text" path="transactionLines[${tl.index}].productNo" class="form-control" /></td>
</tr>
<tr>
<td>Posted Qty:</td>
<td><form:input type="text" path="transactionLines[${tl.index}].postedQty" class="form-control" value="${p.reorderQty}"/></td>
<td><form:errors  path="transactionLines[${tl.index}].postedQty" cssStyle="color: red;" /></td> 
<tr>
<td><input type="submit" value="Submit" class="btn btn-primary"/></td>
</tr>  
</c:forEach>
</form:form>
</table>
</div>
</div>
</div>
