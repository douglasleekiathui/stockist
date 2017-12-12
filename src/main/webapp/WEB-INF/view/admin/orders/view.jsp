<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
                crossorigin="anonymous">
         
         	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                    crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
                    crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
                    crossorigin="anonymous"></script>
    			<link href="css/master.css" rel="stylesheet" />
<!-- <script type="text/javascript" src="path_to/jquery.js"></script>
<script type="text/javascript" src="path_to/jquery.simplePagination.js"></script>
<link type="text/css" rel="stylesheet"
	href="path_to/simplePagination.css" />-->

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
<div class="container">
            <div class="row">
                <div class="col-sm">
<h5><spring:message code="title.reorderReport" /></h5>
<br/>
<table>
<c:if test="${s != null}">
<a href=<c:url value="/admin/orders/new/s=${s.supplierNo}"/>>Update new receipt or purchase</a>

<tr>
<td><spring:message code="supplierNo" />: </td>
<td>${s.supplierNo} </td>
</tr>
<tr>
<td><spring:message code="supplierName" />: </td>
<td> ${s.supplierName} </td>
<td></td>
</tr>

</c:if>
<br/>
<display:table class="table" id="p" name="pList" requestURI="" pagesize="10" export="true" >
<display:setProperty name="paging.banner.some_items_found" value="{0} {1} found <br/> Displaying {2} to {3}.<br/>" />
<c:if test="${s == null}">
	<display:column class="supplier" titleKey="supplierName" sortable="true">
	<a href="<c:url value="/admin/orders/${p.primarySupplier.supplierNo}.html" />">
	<c:out value="${p.primarySupplier.supplierName}" /></a></display:column>
</c:if>



    <display:column class="numeric text-justify" titleKey="displaytag.productNo" sortable="true"><a href = "<c:url value = "/admin/orders/new/p=${p.productNo}.html"/>">

    <c:out value="${p.productNo}"/></a></display:column>
    <display:column class="numeric text-justify" property="price" titleKey="displaytag.price" sortable="true"/>
    <display:column class="numeric text-justify" property="onhandQty" titleKey="displaytag.onhandQty"  sortable="true"/>
    <display:column class="numeric text-justify" property="reorderQty"  titleKey="displaytag.reorderQty" sortable="true"/>
    <display:column class="numeric text-justify" property="minQty" titleKey="displaytag.minQty" sortable="true"/>
    <display:column class="numeric text-justify" titleKey="displaytag.orderQty" sortable="true"> 
    <c:out value="${java.lang.Math.max(0,p.reorderQty + p.minQty - p.onhandQty)*1}"/></display:column>
    <display:column class="numeric text-justify" titleKey="displaytag.totalPrice" sortable="true"> 
    <c:out value="${java.lang.Math.max(0,(p.reorderQty + p.minQty - p.onhandQty)) * p.price}"/></display:column>
</display:table>
</table>
</div>
</div>
</div>
</body>

