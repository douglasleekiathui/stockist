<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

            <div class="container">
            <div class="row">
                <div class="col-sm">
                <h5><spring:message code="title.reorderReport" /><a href="<c:url value="/admin/orders/all.html"/>"> (<spring:message code="title.viewByProduct"></spring:message>)</a></h5>
                	<br/>
			
                        <table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th scope="col"><spring:message code="fieldLabel.supplier_no"></spring:message></th>
                                        <th scope="col"><spring:message code="fieldLabel.supplier_namee"></spring:message></th>            							
                                    </tr>
                                </thead>
                                <c:forEach var="s" items="${sList}">
                                    <tr>
                                        <th> <a href="${pageContext.request.contextPath}/admin/reports/reorder/${s.supplierNo}.html">${s.supplierNo}</a></th>
                                        <td>${s.supplierName}</td>
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
			