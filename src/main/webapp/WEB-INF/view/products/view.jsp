<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View all products</title>
</head>
<body>
<div>
<span>Part Number</span>
<span>Description</span>
<span>Dimensions</span>
<span>Manufacturer</span>
<span>Shelf Location</span>
</div>
<c:forEach var="p" items="${productList}">
<div>
<span> <c:out value="${p.productNo}" />  </span>
<span> <c:out value="${p.productDescription}" /> </span>
<span> <c:out value="${p.dimension}" /> </span>
<span> <c:out value="${p.manufacturer}" /> </span>
<span> <c:out value="${p.shelfLocation}" /> </span>
</div>
</c:forEach>


</body>
</html>