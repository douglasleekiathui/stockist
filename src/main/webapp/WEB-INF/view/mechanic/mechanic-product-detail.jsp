<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

            <div class="container">
            <div class="row">
                <div class="col-sm-6">
<h5>Detail Product Page</h5>
	<table class="table">
	<tr><td> <spring:message code="fieldLabel.product_no"></spring:message>: <td>${product.productNo}</td></td></tr> 
	<tr><td><spring:message code="fieldLabel.product_description"></spring:message>: <td>  ${product.productDescription}</td></tr>
	<tr><td><spring:message code="fieldLabel.product_dimension"></spring:message>: <td> ${product.dimension}</td></tr>
	<tr><td><spring:message code="fieldLabel.product_manufacturer"></spring:message>: <td>  ${product.manufacturer}</td></tr>
	<tr><td><spring:message code="fieldLabel.product_shelf_location"></spring:message>: <td> ${product.shelfLocation}</td></tr>
	<tr><td><spring:message code="fieldLabel.product_min_qty"></spring:message>: <td> ${product.minQty}</td></tr>
	<tr><td><spring:message code="fieldLabel.product_reorder_qty"></spring:message>: <td> ${product.reorderQty}</td></tr>
	<tr><td><spring:message code="fieldLabel.product_onhand_qty"></spring:message>: <td> ${product.onhandQty}</td></tr>
	<tr><td><spring:message code="fieldLabel.product_price"></spring:message>: <td> ${product.price} </td></tr>
	<tr>
	<td>
	<a href ="${pageContext.request.contextPath}/mechanic/list.html" type="back" class="btn btn-primary"><spring:message code="caption.back"></spring:message></a>
	</td>
	</tr>
	</table>
	</div>
	</div>
	</div>