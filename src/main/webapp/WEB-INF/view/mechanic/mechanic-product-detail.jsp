<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

            <div class="container">
            <div class="row">
                <div class="col-sm-6">
<h5>Detail Product Page</h5>
	<table class="table">
	<tr><td> Product No: <td>${product.productNo}</td></td></tr> 
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
	<a href ="${pageContext.request.contextPath}/mechanic/list.html" type="back" class="btn btn-primary">Back</a>
	</td>
	</tr>
	</table>
	</div>
	</div>
	</div>