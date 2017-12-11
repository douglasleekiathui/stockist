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
<style>
.displaytable{font-family: Arial,"San Serif";margin:auto;padding-top:1em;paddiing-bottom:1em;}
.displaytable th{background-color:lightblue;font-weight:normal;padding: 5px 0 0 5px;}
.displaytable td{padding: 5px 0 0 5px;}
.displaytable a{text-decoration:none;color:black}
.displaytable a:hover {font-weight:bold;}
.supplier{min-width:200px;}
.numeric{min-width:100px;text-align:center;}
.pagelinks{margin:auto;}
</style>
</head>
<body>

<span><spring:message code="title.reorderReport" /></span>
<br/>
<c:if test="${s != null}">
	<spring:message code="supplierNo" />= ${s.supplierNo} 
	<spring:message code="supplierName" />= ${s.supplierName}
	<a href=<c:url value="/products/orders/new/s=${s.supplierNo}"/>>Update new receipt or purchase</a>
</c:if>
<br/>
<display:table class="displaytable" id="p" name="pList" requestURI="" pagesize="20" export="true">
<display:setProperty name="paging.banner.some_items_found" value="{0} {1} found <br/> Displaying {2} to {3}.<br/>" />
<c:if test="${s == null}">
	<display:column class="supplier" titleKey="supplierName" sortable="true"><a href="<c:url value="/products/orders/${p.primarySupplier.supplierNo}.html" />"><c:out value="${p.primarySupplier.supplierName}" /></a></display:column>
</c:if>
    <display:column class="numeric" titleKey="displaytag.productNo" sortable="true"><a href = "<c:url value = "/products/orders/new/p=${p.productNo}.html"/>"><c:out value="${p.productNo}"/></a></display:column>
    <display:column class="numeric" property="price" titleKey="displaytag.price" sortable="true"/>
    <display:column class="numeric" property="onhandQty" titleKey="displaytag.onhandQty" sortable="true"/>
    <display:column class="numeric" property="reorderQty" titleKey="displaytag.reorderQty" sortable="true"/>
    <display:column class="numeric" property="minQty" titleKey="displaytag.minQty" sortable="true"/>
    <display:column class="numeric" titleKey="displaytag.orderQty" sortable="true"> <c:out value="${java.lang.Math.max(0,p.reorderQty + p.minQty - p.onhandQty)*1}"/></display:column>
    <display:column class="numeric" titleKey="displaytag.totalPrice" sortable="true"> <c:out value="${java.lang.Math.max(0,(p.reorderQty + p.minQty - p.onhandQty)) * p.price}"/></display:column>
</display:table>



</body>
</html>