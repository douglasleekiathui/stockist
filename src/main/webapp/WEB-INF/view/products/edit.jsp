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
            <title>View all products</title>
        </head>

        <body>
<h3>Edit Product page</h3>
<form:form method="POST" modelAttribute="product" 
action="${pageContext.request.contextPath}/products/edit/${product.productNo}.html">
	<table>
		<tbody>
		<tr>
				<td>Product No</td>
				<td><form:input path="productNo" readOnly="true" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><form:input path="productDescription" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Dimensions></td>
				<td><form:input path="dimension" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Manufacturer</td>
				<td><form:input path="manufacturer" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Shelf Location></td>
				<td><form:input path="shelfLocation" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><form:input path="price" /></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="submit" value="Update" /></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</form:form>
</body>
</html>