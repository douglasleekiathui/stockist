<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head runat="server">
    <!--include-->
<link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"  rel="stylesheet" />
<link href="https://cdn.datatables.net/select/1.2.4/css/select.bootstrap4.min.css"  rel="stylesheet" />
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
                crossorigin="anonymous">
         
         	      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                    crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
                    crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
                    crossorigin="anonymous"></script>
				<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>			
			<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>		
			<script src="https://cdn.datatables.net/select/1.2.4/js/dataTables.select.min.js"></script>	
    <link href="css/master.css" rel="stylesheet" />
<body>
            <div class="container">
            <div class="row">
                <div class="col-sm">
                <a href="${pageContext.request.contextPath}/admin/products/product-new.html">Add A New Product</a>
                	<br/>
				<form:form method="POST" modelAttribute="productSearch"	action="${pageContext.request.contextPath}/products/product-list">
	    			<div class="input-group">
	     				 <form:input path="searchText" type="text" class="form-control" placeholder="Search for..." aria-label="Search for..." />
					<select class="custom-select" name="searchType" id="searchType">
					  <option value="productNo" ${productSearch.searchType == "productNo" ? 'selected="selected"' : ''}>Part Number</option>
					  <option value="productDescription" ${productSearch.searchType == "productDescription" ? 'selected="selected"' : ''}>Product Description</option>
					  <option value="manufacturer" ${productSearch.searchType == "manufacturer" ? 'selected="selected"' : ''}>Manufacturer</option>
					  <option value="shelfLocation" ${productSearch.searchType == "shelfLocation" ? 'selected="selected"' : ''}>Shelf Location</option>
					</select>
					<br/>
	      					<span class="input-group-btn">
	        					<button class="btn btn-primary" type="submit">Search By</button>
	        					<a href ="${pageContext.request.contextPath}/admin/products/product-list" type="reset" class="btn btn-primary">Reset</a>
	      					</span>
	    			</div>
				</form:form>
					</div>
					<br/>
                        <table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th scope="col">Part Number</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Dimensions</th>
                                        <th scope="col">Manufacturer</th>
                                        <th scope="col">Shelf Location</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Edit</th>
                                        <th scope="col">Delete</th>
            							
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
                                            <a href="${pageContext.request.contextPath}/admin/products/product-edit/${p.productNo}.html">Edit</a>
                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/admin/products/delete/${p.productNo}.html">Delete</a>
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
			
