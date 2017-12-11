<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
		<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
			<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

				<link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
				<link href="https://cdn.datatables.net/select/1.2.4/css/select.bootstrap4.min.css" rel="stylesheet" />

				<div class="container">
					<div class="col xs-12">
						<a href="${pageContext.request.contextPath}/products/create.html">Add A New Product</a>
						<br/>
						<form:form method="POST" modelAttribute="productSearch" action="${pageContext.request.contextPath}/mechanic/list">
							<div class="input-group">
								<form:input path="searchText" type="text" class="form-control" placeholder="Search for..." aria-label="Search for..." />
								<select class="custom-select" name="searchType" id="searchType">
									<option value="productNo" ${productSearch.searchType=="productNo" ? 'selected="selected"' : ''}>Part Number</option>
									<option value="productDescription" ${productSearch.searchType=="productDescription" ? 'selected="selected"' : ''}>Product Description</option>
									<option value="manufacturer" ${productSearch.searchType=="manufacturer" ? 'selected="selected"' : ''}>Manufacturer</option>
									<option value="shelfLocation" ${productSearch.searchType=="shelfLocation" ? 'selected="selected"' : ''}>Shelf Location</option>
								</select>
								<span class="input-group-btn">
									<button class="btn btn-primary" type="submit">Search By</button>
								</span>
							</div>
						</form:form>
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
								</tr>
							</thead>
							<c:forEach var="p" items="${productList}">
								<tr>
									<th scope="row">${p.productNo}</th>
									<td>${p.productDescription}</td>
									<td>${p.dimension}</td>
									<td>${p.manufacturer}</td>
									<td>${p.shelfLocation}</td>
									<td>${p.price}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
				<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
				<script src="https://cdn.datatables.net/select/1.2.4/js/dataTables.select.min.js"></script>
				<script>
					$(document).ready(function () {
						$('#table').DataTable({
							select: false,
							searching: false
						});
					});
				</script>