<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
                crossorigin="anonymous">
         
         	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                    crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
                    crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
                    crossorigin="anonymous"></script>
    			<link href="css/master.css" rel="stylesheet" />
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
<form:form method="POST" modelAttribute="tx" action="${pageContext.request.contextPath}/admin/orders/new/p=${p.productNo}.html" >
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
</c:forEach>
<tr>
<td><input type="submit" value="Submit" class="btn btn-primary"/></td>
</tr>
</form:form>
</table>
</div>
</div>
</div>
