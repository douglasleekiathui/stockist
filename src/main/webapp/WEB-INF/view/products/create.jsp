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
<h3>Create New Product Page</h3>
<form:form method="POST" modelAttribute="product"
action="${pageContext.request.contextPath}/products/create.html">
	<table>
		<tbody>
		<tr>
				<td>Product No</td>
				<td><form:input path="productNo" class="form-control"/></td>
				<td><form:errors path="productNo" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><form:input path="productDescription" class="form-control" /></td>
				<td><form:errors path="productDescription" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td>Dimensions</td>
				<td><form:input path="dimension" class="form-control" /></td>
				<td><form:errors path="dimension" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td>Manufacturer</td>
				<td>
				<select class="custom-select" name="manufacturer" id="manufacturer">
				  <option value="NA" ${product.manufacturer == "NA" ? 'selected="selected"' : ''}>NA</option>
				  <option value="TOYOTA" ${product.manufacturer == "TOYOTA" ? 'selected="selected"' : ''}>TOYOTA</option>
				  <option value="MAZDA" ${product.manufacturer == "MAZDA" ? 'selected="selected"' : ''}>MAZDA</option>
				  <option value="HONDA" ${product.manufacturer == "HONDA" ? 'selected="selected"' : ''}>HONDA</option>
				  <option value="NISSAN" ${product.manufacturer == "NISSAN" ? 'selected="selected"' : ''}>NISSAN</option>
				  <option value="MITSUBISHI" ${product.manufacturer == "MITSUBISHI" ? 'selected="selected"' : ''}>MITSUBISHI</option>
				  <option value="LEXUS" ${product.manufacturer == "LEXUS" ? 'selected="selected"' : ''}>LEXUS</option>
				  <option value="SUBARU" ${product.manufacturer == "SUBARU" ? 'selected="selected"' : ''}>SUBARU</option>
				  <option value="HINO" ${product.manufacturer == "HINO" ? 'selected="selected"' : ''}>HINO</option>
				  <option value="DAIHATSU" ${product.manufacturer == "SUBARU" ? 'selected="selected"' : ''}>DAIHATSU</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>Shelf Location</td>
				<td>
				<select class="custom-select" name="shelfLocation" id="shelfLocation">
				  <option value="ONSITE" ${product.shelfLocation == "ONSITE" ? 'selected="selected"' : ''}>ONSITE</option>
				  <option value="STORE" ${product.shelfLocation == "STORE" ? 'selected="selected"' : ''}>STORE</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>Price</td>
				<td><form:input path="price" class="form-control"/></td>
				<td><form:errors path="price" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Create" class="btn btn-primary" /></td>
			</tr>
		</tbody>
	</table>
</form:form>
</body>
</html>