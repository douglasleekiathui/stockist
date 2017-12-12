
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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
</body>
</html>