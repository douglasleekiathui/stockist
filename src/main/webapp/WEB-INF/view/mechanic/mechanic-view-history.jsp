<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

				<div class="container">
					<div class="row">
						<div class="col-sm">
<h5>View History Page</h5>

			<div>
				<a href="${pageContext.request.contextPath}/mechanic/list.html">Go Back</a>
			</div>

<c:if test="${fn:length(tList) gt 0}">

	<table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
	 <thead>
	 <tr class="listHeading">
		<th>Transaction No.</th>
		<th>Date</th>
	    <th>Type</th>
		<th>Created By</th>
		<th>Created For</th>
	</tr>
 </thead>
  <tbody>
	<c:forEach var="tList" items="${tList}">
		<tr class="listRecord">
			<td>${tList.transactionNo }</td>
			<td>${tList.transactionDate }</td>
			<td>${tList.transactionType }</td>
			<td>${tList.createdBy }</td>
			<td>${tList.createdFor}</td>	
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
				




