
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<h3>Supplier List Page</h3>
<a href="${pageContext.request.contextPath}/suppliers/create.html">Add Supplier</a>
<c:if test="${fn:length(sList) gt 0}">
	<table class="table">
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
						href="${pageContext.request.contextPath}/suppliers/edit/${suppliers.supplierNo}.html"><spring:message
								code="caption.edit" /></a></td>
					<td><a
						href="${pageContext.request.contextPath}/suppliers/delete/${suppliers.supplierNo}.html"><spring:message
								code="caption.delete" /></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:if>