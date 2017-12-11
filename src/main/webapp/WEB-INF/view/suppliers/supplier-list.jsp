
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<h3>Supplier List page</h3>
<a href="${pageContext.request.contextPath}/suppliers/create.html">Add Supplier</a>
<c:if test="${fn:length(sList) gt 0}">
	<table style="cellspacing: 2; cellpadding: 2; border: 1;">
		<thead>
			<tr class="listHeading">
				<th><spring:message code="fieldLabel.supplier_no" /></th>
				<th><spring:message code="fieldLabel.supplier_name" /></th>
				<th><spring:message code="fieldLabel.supplier_contact" /></th>
				<th><spring:message code="fieldLabel.supplier_email" /></th>
				<th><spring:message code="fieldLabel.record_status" /></th>

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