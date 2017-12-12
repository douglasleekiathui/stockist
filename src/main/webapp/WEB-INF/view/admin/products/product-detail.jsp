<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head runat="server">
    <!--include-->
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
<h5>Detail Product Page</h5>
	<table class="table">
	<tr><td> Product No: <td>${product.productNo}</td></tr> 
	<tr><td>Product Description: <td>  ${product.productDescription}</td></tr>
	<tr><td>Dimension: <td> ${product.dimension}</td></tr>
	<tr><td>Manufacturer: <td>  ${product.manufacturer}</td></tr>
	<tr><td>Shelf Location: <td> ${product.shelfLocation}</td></tr>
	<tr><td>Minimum Quantity: <td> ${product.minQty}</td></tr>
	<tr><td>Reorder Quantity: <td> ${product.reorderQty}</td></tr>
	<tr><td>Onhand Quantity: <td> ${product.onhandQty}</td></tr>
	<tr><td>Price: <td> ${product.price} </td></tr>
	<tr>
	<td>
	<a href ="${pageContext.request.contextPath}/mechanic//product-list" type="back" class="btn btn-primary">Back</a>
	</td>
	</tr>
	</table>
	</div>
	</div>
	</div>
	</body>
	