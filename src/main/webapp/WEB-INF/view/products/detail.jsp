<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
                crossorigin="anonymous">
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <title>Edit products</title>
            <style type="text/css">
            
input:read-only{
	background-color: #f3f3f3;
}
           </style>
        </head>

        <body>
<h3>Detail Product Page</h3>
//
	<table class="table">
	<tr><td> Product No: ${product.productNo}</td></tr> 
	<tr><td>Product Description:  ${product.productDescription}</tr>
	<tr><td>Dimension:  ${product.dimension}</tr>
	<tr><td>Manufacturer:  ${product.manufacturer}</tr>
	<tr><td>Shelf Location:  ${product.shelfLocation}</tr>
	<tr><td>Minimum Quantity:  ${product.minQty}</tr>
	<tr><td>Reorder Quantity:  ${product.reorderQty}</tr>
	<tr><td>Onhand Quantity:  ${product.onhandQty}</tr>
	<tr><td>Price:  ${product.price}</tr>
	<td>
	<a href ="${pageContext.request.contextPath}/products/view" type="back" class="btn btn-primary">Back</a>
	</td>
	</table>