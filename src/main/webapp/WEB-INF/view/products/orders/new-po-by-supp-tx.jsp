<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Purchase Inventory</title>
</head>
<body>



for Supplier
<form:form method="POST" commandName="tx" action="${pageContext.request.contextPath}/products/orders/new.html" >
Date: <form:input type="date" path="transactionDate"/>

</form:form>
</body>
</html>