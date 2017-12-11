<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
			<link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"  rel="stylesheet" />
			<link href="https://cdn.datatables.net/select/1.2.4/css/select.bootstrap4.min.css"  rel="stylesheet" />
				<div class="container">
					<div class="row">
						<div class="col-sm">
							<h3>Products List page</h3>

							<div>
								<a href="${pageContext.request.contextPath}/mechanic/viewHistory/${products.productNo}.html">View History</a>
						</div>


							<c:if test="${fn:length(productsList) gt 0}">

								<table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
  <thead>
									<tr class="listHeading">
										<th>Product No.</th>
										<th>Product Description</th>
										<th>Qty</th>
										<th> </th>
										<th> </th>
									</tr>

  </thead>
  <tbody>
									<c:forEach var="products" items="${productsList}">
										<tr class="listRecord">
											<td>${products.productNo }</td>
											<td>${products.productDescription}</td>
											<td>${products.onhandQty}</td>
											<td>
												<a href="${pageContext.request.contextPath}/products/detail/${products.productNo}.html">View Details</a>
											</td>
											<td>
												<a href="${pageContext.request.contextPath}/mechanic/recordUsage/${products.productNo}.html">Record Usage</a>
											</td>
										</tr>
									</c:forEach>
</tbody>
								</table>
							</c:if>
						</div>
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
				