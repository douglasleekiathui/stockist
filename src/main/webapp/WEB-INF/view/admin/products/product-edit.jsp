<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
            <div class="row">
                <div class="col-sm">
<h5>Edit Product Page</h5>
<form:form method="POST" modelAttribute="product" 
action="${pageContext.request.contextPath}/admin/products/product-edit/${product.productNo}.html">
	<table>
		<tbody>
		<tr>
				<td><spring:message code="fieldLabel.product_no"></spring:message></td>
				<td><form:input path="productNo" readOnly="true"  class="form-control"/></td>
				<td></td>
			</tr>
			<tr>
				<td><spring:message code="fieldLabel.product_description"></spring:message></td>
				<td><form:input path="productDescription"  class="form-control" /></td>
				<td><form:errors path="productDescription" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><spring:message code="fieldLabel.product_dimension"></spring:message></td>
				<td><form:input path="dimension"  class="form-control"/></td>
				<td><form:errors path="dimension" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><spring:message code="fieldLabel.product_manufacturer"></spring:message></td>
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
				<td><spring:message code="fieldLabel.product_shelf_location"></spring:message></td>
				<td>
				<select class="custom-select" name="shelfLocation" id="shelfLocation">
				  <option value="ONSITE" ${product.shelfLocation == "ONSITE" ? 'selected="selected"' : ''}>ONSITE</option>
				  <option value="STORE" ${product.shelfLocation == "STORE" ? 'selected="selected"' : ''}>STORE</option>
				</select>
				</td>
			</tr>
			<tr>
				<td><spring:message code="fieldLabel.product_onhand_qty"></spring:message></td>
				<td><form:input path="onhandQty"  class="form-control"  type="number"  required="required"/></td>
				<td><form:errors path="onhandQty" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><spring:message code="fieldLabel.product_min_qty"></spring:message></td>
				<td><form:input path="minQty"  class="form-control"  type="number" required="required"/></td>
				<td><form:errors path="minQty" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><spring:message code="fieldLabel.product_primary_supplier"></spring:message></td>
				<td><form:input path="primarySupplier" readOnly="true" class="form-control"  /></td>
			</tr>
			<tr>
				<td><spring:message code="fieldLabel.product_reorder_qty"></spring:message></td>
				<td><form:input path="reorderQty"  class="form-control" type="number"  required="required" /></td>
				<td><form:errors path="reorderQty" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><spring:message code="fieldLabel.product_price"></spring:message></td>
				<td><form:input path="price"  class="form-control" /></td>
				<td><form:errors path="price" cssStyle="color: red;" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Update" class="btn btn-primary" /></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</form:form>
</div>
</div>
</div>
