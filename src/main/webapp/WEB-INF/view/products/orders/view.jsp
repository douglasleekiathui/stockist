<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Replenish Inventory</title>
</head>
<body>

<spring:message code="test"/>


<br />
<div>
<span> Part Number </span>
<span> Description </span>
<span> Dimension </span>
<span> Primary Supplier</span>
<span> In Stock </span>
<span> Recommended Purchase Qty  </span>
</div>
<c:forEach var="p" items="${pList}">
<div>
<span> ${p.productNo} </span>
<span> ${p.productDescription} </span>
<span> ${p.dimension} </span>
<span> ${p.primarySupplier.supplierName} </span>
<span> ${p.onhandQty} </span>
<span> ${p.reorderQty}+${p.minQty}-${p.onhandQty}  </span>
</div>
</c:forEach>

<!--  manual creation of pagination -->
<div class="pagination" style="bottom:-10; position:absolute;">
  <a href="#">&laquo;</a>
  <a href="#">1</a>
  <a href="#">2</a>
  <a href="#">3</a>
  <a href="#">4</a>
  <a href="#">5</a>
  <a href="#">6</a>
  <a href="#">&raquo;</a>
</div>




</body>
</html>