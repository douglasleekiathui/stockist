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
<title>Receive or Purchase Inventory</title>
</head>
<body>



Update Inventory Receipt/Purchase
<form:form method="POST" modelAttribute="tx" action="${pageContext.request.contextPath}/products/orders/new/p=${p.productNo}.html" >
Date: <form:input type="date" path="transactionDate"/>
Supplier Name: <form:input type="text" path="createdFor"/>
<c:forEach varStatus="tl" items="${tx.transactionLines}">
<div>
Line: ${tl.index+1}
<br/>
Part Number: <form:input type="text" path="transactionLines[${tl.index}].productNo"/>
<br/>
Posted Qty: <form:input type="text" path="transactionLines[${tl.index}].postedQty"/>
</div>
</c:forEach>
<input type="submit" value="Submit" />
</form:form>
</body>
</html>