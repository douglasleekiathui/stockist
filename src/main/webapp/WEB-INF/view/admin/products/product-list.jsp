<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

            <div class="container">
            <div class="row">
                <div class="col-sm">
                <a href="${pageContext.request.contextPath}/admin/products/product-new.html">Add A New Product</a>
                	<br/>
				<form:form method="POST" modelAttribute="productSearch"	action="${pageContext.request.contextPath}/admin/products/product-list">
	    			<div class="input-group">
	     				 <form:input path="searchText" type="text" class="form-control" placeholder="Search for..." aria-label="Search for..." />
					<select class="custom-select" name="searchType" id="searchType">
					  <option value="productNo" ${productSearch.searchType == "productNo" ? 'selected="selected"' : ''}><spring:message code="fieldLabel.product_no"></spring:message></option>
					  <option value="productDescription" ${productSearch.searchType == "productDescription" ? 'selected="selected"' : ''}><spring:message code="fieldLabel.product_description"></spring:message></option>
					  <option value="manufacturer" ${productSearch.searchType == "manufacturer" ? 'selected="selected"' : ''}><spring:message code="fieldLabel.product_manufacturer"></spring:message></option>
					  <option value="shelfLocation" ${productSearch.searchType == "shelfLocation" ? 'selected="selected"' : ''}><spring:message code="fieldLabel.product_shelf_location"></spring:message></option>
					</select>
					<br/>
	      					<span class="input-group-btn">
	        					<button class="btn btn-primary" type="submit"><spring:message code="caption.search_by"></spring:message></button>
	        					<a href ="${pageContext.request.contextPath}/admin/products/product-list" type="reset" class="btn btn-primary"><spring:message code="caption.reset"></spring:message></a>
	      					</span>
	    			</div>
				</form:form>
					</div>
					<br/>
                        <table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th scope="col"><spring:message code="fieldLabel.product_no"></spring:message></th>
                                        <th scope="col"><spring:message code="fieldLabel.product_description"></spring:message></th>
                                        <th scope="col"><spring:message code="fieldLabel.product_dimension"></spring:message></th>
                                        <th scope="col"><spring:message code="fieldLabel.product_manufacturer"></spring:message></th>
                                        <th scope="col"><spring:message code="fieldLabel.product_shelf_location"></spring:message></th>
                                        <th scope="col"><spring:message code="fieldLabel.product_price"></spring:message></th>
                                        <th scope="col"><spring:message code="caption.edit"></spring:message></th>
                                        <th scope="col"><spring:message code="caption.delete"></spring:message></th>
            							
                                    </tr>
                                </thead>
                                <c:forEach var="p" items="${productList}">
                                    <tr>
                                        <th> <a href="${pageContext.request.contextPath}/admin/products/product-detail/${p.productNo}.html">${p.productNo}</a></th>
                                        <td>${p.productDescription}</td>
                                        <td>${p.dimension}</td>
                                        <td>${p.manufacturer}</td>
                                        <td>${p.shelfLocation}</td>
                                        <td>${p.price}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/admin/products/product-edit/${p.productNo}.html"><spring:message code="caption.edit"></spring:message></a>
                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/admin/products/delete/${p.productNo}.html"><spring:message code="caption.delete"></spring:message></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                           </div>
                </div>
                <script>
			$(document).ready(function() {
			    $('#table').DataTable( {
			        select: false,
			        searching: false
			    } );
			} );
			</script>
               
			</body>
</html>
			
