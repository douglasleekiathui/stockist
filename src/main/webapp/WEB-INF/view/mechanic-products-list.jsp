<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<h3>Products List page</h3>
<c:if test="${fn:length(productsList) gt 0}">
<table style="cellspacing: 2; cellpadding: 2; border: 1;">

	<tr class="listHeading">
		<th>Product No.</th>
		<th>Product Description</th>
		<th>Qty</th>
		<th></th>
		<th></th>
	</tr>


	<c:forEach var="products" items="${productsList}">
		<tr class="listRecord">
			<td>${products.productNo }</td>
			<td>${products.productDescription}</td>
			<td>${products.onhandQty}</td>
			<td>
				<a href="${pageContext.request.contextPath}/products/view/${products.productNo}.html">View Details</a>
			</td>
			<td>
				<a href="${pageContext.request.contextPath}/mechanic/recordUsage/${products.productNo}.html">Record Usage</a>
			</td>
		</tr>
	</c:forEach>

</table>
</c:if>