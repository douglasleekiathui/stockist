<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<!-- <script type="text/javascript" src="path_to/jquery.js"></script>
<script type="text/javascript" src="path_to/jquery.simplePagination.js"></script>
<link type="text/css" rel="stylesheet"
	href="path_to/simplePagination.css" />-->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reorder Inventory</title>
</head>
<body>

<span><spring:message code="reorderReportTitle" /></span>
<br/>
<c:if test="${s != null}">
	<spring:message code="supplierNo" />= ${s.supplierNo} 
	<br/>
	<spring:message code="supplierName" />= ${s.supplierName}	
</c:if>
<br/>
<display:table id="p" name="pList" requestURI="" pagesize="20" >
<c:if test="${s == null}">
	<display:column titleKey="supplierName" sortable="true"><a href="<c:url value="/products/orders/${p.primarySupplier.supplierNo}.html" />"><c:out value="${p.primarySupplier.supplierName}" /></a></display:column>
</c:if>
    <display:column titleKey="displaytag.productNo" sortable="true"><a href = "<c:url value = "/products/orders/new/p=${p.productNo}.html"/>"><c:out value="${p.productNo}"/></a></display:column>
    <display:column property="price" titleKey="displaytag.price" sortable="true"/>
    <display:column property="onhandQty" titleKey="displaytag.onhandQty" sortable="true"/>
    <display:column property="reorderQty" titleKey="displaytag.reorderQty" sortable="true"/>
    <display:column property="minQty" titleKey="displaytag.minQty" sortable="true"/>
    <display:column titleKey="displaytag.orderQty" sortable="true"> <c:out value="${p.reorderQty + p.minQty - p.onhandQty}"/></display:column>
    <display:column titleKey="displaytag.totalPrice" sortable="true"> <c:out value="${(p.reorderQty + p.minQty - p.onhandQty) * p.price}"/></display:column>
</display:table>



</body>
</html>