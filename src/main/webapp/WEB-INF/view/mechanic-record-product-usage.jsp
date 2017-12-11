<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h3>Edit Products Page</h3>
<form:form method="POST" modelAttribute="products" 
	action="${pageContext.request.contextPath}/mechanic/products/recordUsage/${products.product_no}.html">
	<table>
		<tbody>
			<tr>
				<td>Part Number</td>
				<td><form:input path="productNo" disabled="true"/></td>
			</tr>
			<tr>
				<td>Customer's Name</td>
				<td><form:input path="primarySupplier" disabled="true"/></td>
			</tr>
			<tr>
				<td>Available Quantity</td>
				<td><form:input path="onhandQty" disabled="true"/></td>
			</tr>
			<tr>
				<td>Quantity to use</td>
				<td><input type="text" name="usedQuantityTextBox" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Update" /></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</form:form>
