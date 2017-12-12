
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="container">
            <div class="row">
                <div class="col-sm">


<h5>Supplier List Page</h5>
<a href="${pageContext.request.contextPath}/admin/suppliers/create.html">Add Supplier</a>
<c:if test="${fn:length(sList) gt 0}">
	<table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
		<thead>
			<tr class="listHeading">
				<th><spring:message code="fieldLabel.supplier_no" scope="col" /></th>
				<th><spring:message code="fieldLabel.supplier_name" scope="col" /></th>
				<th><spring:message code="fieldLabel.supplier_contact" scope="col"/></th>
				<th><spring:message code="fieldLabel.supplier_email" scope="col"/></th>
				<th><spring:message code="fieldLabel.record_status" scope="col" /></th>

				<th><spring:message code="caption.edit" /></th>
				<th><spring:message code="caption.delete" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="suppliers" items="${sList}">
				<tr class="listRecord">
					<td>${suppliers.supplierNo}</td>
					<td>${suppliers.supplierName}</td>
					<td>${suppliers.supplierContact}</td>
					<td>${suppliers.supplierEmail}</td>
					<td>${suppliers.recordStatus}</td>

					<td align="center"><a
						href="${pageContext.request.contextPath}/admin/suppliers/edit/${suppliers.supplierNo}.html"><spring:message
								code="caption.edit" /></a></td>
					<td><a
						href="${pageContext.request.contextPath}/admin/suppliers/delete/${suppliers.supplierNo}.html"><spring:message
								code="caption.delete" /></a></td>
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