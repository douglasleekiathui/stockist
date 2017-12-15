<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



	<!--banner-->
	<div class="jumbotron mb-0">
		<div class="container text-center">

			<h1>Team4</h1>
			<p>Stockist Inventory Management System</p>
		</div>
	</div>

<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-5">
<div class="container">
      <a class="navbar-brand" href="/stockist/">SIMS</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarsExample04">
        <ul class="navbar-nav mr-auto">
        
        <sec:authorize access="hasRole('ROLE_ADMIN')">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false"><spring:message code="header.product"></spring:message></a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="<c:url value="/admin/products/product-list.html"/>"><spring:message code="header.view"></spring:message></a> 
				<a class="dropdown-item" href="<c:url value="/admin/products/product-new.html"/>"><spring:message code="header.new"></spring:message></a>
			</div>
		</li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false"><spring:message code="header.supplier"></spring:message></a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="<c:url value="/admin/suppliers/list.html"/>"><spring:message code="header.view"></spring:message></a>
				<a class="dropdown-item" href="<c:url value="/admin/suppliers/create.html"/>"><spring:message code="header.new"></spring:message></a>
			</div>
		</li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false"><spring:message code="header.user"></spring:message></a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="<c:url value="/admin/users/list.html"/>"><spring:message code="header.view"></spring:message></a> 
				<a class="dropdown-item" href="<c:url value="/admin/users/create.html"/>"><spring:message code="header.new"></spring:message></a> 
			</div>
		</li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false"><spring:message code="header.order"></spring:message></a>
			<div class="dropdown-menu">
				<a class="dropdown-item"
 					href="<c:url value="/admin/orders/all.html"/>"><spring:message code="header.view"></spring:message></a> 
			</div>
		</li>
		
		</sec:authorize>
		
		
		<li class="nav-item"><a class="nav-link"
			href="<c:url value="/mechanic/list.html"/>"><spring:message code="header.mechanic"></spring:message></a>
		</li>
        <li class="nav-item" style="position:absolute;right:10;"><a class="nav-link" href="<c:url value="/logout.html"/>"><spring:message code="header.logout"></spring:message></a></li>
        </ul>
      </div>
    </nav>
	
	
