<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
												<a href="${pageContext.request.contextPath}/mechanic/mechanic-product-detail/${products.productNo}.html">View Details</a>
											</td>
											<td>
												<a href="${pageContext.request.contextPath}/mechanic/recordUsage/p=${products.productNo}.html">Record Usage</a>
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
			</body>
				