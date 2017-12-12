<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users</title>
</head>
<body>
<div>
<span><spring:message code="fieldLabel.user"></spring:message></span>
<span><spring:message code="fieldLabel.user_role"></spring:message></span>
</div>
<c:forEach var="u" items="${userList}">
<div>
<span> <c:out value="${u.user}" />  </span>
<span> <c:out value="${u.userRole}" />  </span>
</div>
</c:forEach>

</body>
</html>