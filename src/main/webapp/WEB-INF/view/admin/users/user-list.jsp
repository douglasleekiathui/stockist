
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
                crossorigin="anonymous">
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <title>View all products</title>
        </head>
    <body>
<h3>User List page</h3>
<div class="container">
                <div class="col xs-12">
<a href="${pageContext.request.contextPath}/admin/users/create.html">Add User</a>
<c:if test="${fn:length(uList) gt 0}">
	<table class="table">
		<thead>
			<tr class="listHeading">
				<th><spring:message code="fieldLabel.user" /></th>
				<th><spring:message code="fieldLabel.password" /></th>
				<th><spring:message code="fieldLabel.user_role" /></th>

				<th><spring:message code="caption.edit" /></th>
				<th><spring:message code="caption.delete" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="users" items="${uList}">
			 
				<tr class="listRecord">
					<td>${users.user}</td>
					<td>${users.password}</td>
					<td>${users.userRole}</td>

					<td><a
						href="${pageContext.request.contextPath}/admin/users/edit/${users.user}.html"><spring:message
								code="caption.edit" /></a></td>
					<td><a
						href="${pageContext.request.contextPath}/admin/users/delete/${users.user}.html"><spring:message
								code="caption.delete" /></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:if>
	</div>   
			</div>
				 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                    crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
                    crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
                    crossorigin="anonymous"></script>
</body>    
</html>
