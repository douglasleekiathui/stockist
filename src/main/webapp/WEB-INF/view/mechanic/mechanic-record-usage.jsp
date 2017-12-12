<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h3>Record the usage</h3>
<form:form method="POST" modelAttribute="products" 
	action="${pageContext.request.contextPath}/mechanic/recordUsage/${products.productNo}.html">
	<table>
		<tbody>
			<tr>
				<td>Product Number</td>
				<td><form:input path="productNo" disabled="true" class="form-control"/></td>
			</tr>
			<tr>
				<td>Customer's Name</td>
				<td><input type="text" name="customerName" class="form-control"/></td>
			</tr>
			<tr>
				<td>Available Quantity</td>
				<td><form:input path="onhandQty" disabled="true" class="form-control"/></td>
			</tr>
			<tr>
				<td>Quantity going to use</td>
				<td><input type="text" name="usedQuantityTextBox" class="form-control" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Update" class="btn btn-primary" /></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</form:form>
