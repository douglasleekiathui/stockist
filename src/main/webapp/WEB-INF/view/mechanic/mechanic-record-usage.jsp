<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
                crossorigin="anonymous">
         
         	      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                    crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
                    crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
                    crossorigin="anonymous"></script>
   				 <link href="css/master.css" rel="stylesheet" />
   				 <body>
            <div class="container">
            <div class="row">
                <div class="col-sm-6">
<h5>Record product usage</h5>
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

