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
                <div class="col-sm">
<h5>Create New Product Page</h5>
<form:form method="POST" modelAttribute="product"
action="${pageContext.request.contextPath}/admin/products/product-new.html">
	<table>
		<tbody>
		<tr>
				<td>Product No</td>
				<td><form:input path="productNo" readOnly="true" class="form-control"/></td>
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
			<td>Supplier</td>
			<td>
				<select class="custom-select" name="primarySupplier" id="primarySupplier">
				  <option value="S0001" ${product.primarySupplier == "S0001" ? 'selected="selected"' : ''}>TOYOTA JAPAN</option>
				  <option value="S0002" ${product.primarySupplier == "S0002" ? 'selected="selected"' : ''}>TOYOTA APAC</option>
				  <option value="S0003" ${product.primarySupplier == "S0003" ? 'selected="selected"' : ''}>NISSAN JAPAN</option>
				  <option value="S0004" ${product.primarySupplier == "S0004" ? 'selected="selected"' : ''}>NISSAN APAC</option>
				  <option value="S0005" ${product.primarySupplier == "S0005" ? 'selected="selected"' : ''}>MAZDA JAPAN</option>
				  <option value="S0006" ${product.primarySupplier == "S0006" ? 'selected="selected"' : ''}>MAZDA APAC</option>
				  <option value="S0007" ${product.primarySupplier == "S0007" ? 'selected="selected"' : ''}>HONDA HEADQUARTERS</option>
				  <option value="S0008" ${product.primarySupplier == "S0008" ? 'selected="selected"' : ''}>HONDA ASIA PACIFIC PTE LTD</option>
				  <option value="S0009" ${product.primarySupplier == "S0009" ? 'selected="selected"' : ''}>HAPPY AND OILY</option>
				  <option value="S0010" ${product.primarySupplier == "S0010" ? 'selected="selected"' : ''}>HOUSE OF MIRRORS</option>
				  <option value="S0011" ${product.primarySupplier == "S0011" ? 'selected="selected"' : ''}>MITSUBISHI</option>
				  <option value="S0012" ${product.primarySupplier == "S0012" ? 'selected="selected"' : ''}>LEXUS</option>
				  <option value="S0013" ${product.primarySupplier == "S0013" ? 'selected="selected"' : ''}>SUBARU</option>
				  <option value="S0014" ${product.primarySupplier == "S0014" ? 'selected="selected"' : ''}>SUZUKI</option>
				  <option value="S0015" ${product.primarySupplier == "S0015" ? 'selected="selected"' : ''}>HINO</option>
				  <option value="S0016" ${product.primarySupplier == "S0016" ? 'selected="selected"' : ''}>DAIHATSU</option>
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
