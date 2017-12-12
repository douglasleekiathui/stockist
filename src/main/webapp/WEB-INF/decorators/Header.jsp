<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



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
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false">Product</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="<c:url value="/admin/products/product-list.html"/>">View</a> 
				<a class="dropdown-item" href="<c:url value="/admin/products/product-new.html"/>">New</a>
			</div>
		</li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false">Supplier</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="<c:url value="/admin/suppliers/list.html"/>">View</a>
				<a class="dropdown-item" href="<c:url value="/admin/suppliers/create.html"/>">New</a>
			</div>
		</li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false">User</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="<c:url value="/admin/users/list.html"/>">View</a> 
				<a class="dropdown-item" href="<c:url value="/admin/users/create.html"/>">New</a> 
			</div>
		</li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false">Reports</a>
			<div class="dropdown-menu">
				<a class="dropdown-item"
					href="<c:url value="/admin/users/user-list.html"/>">View</a>
			</div>
		</li>
		<li class="nav-item"><a class="nav-link"
			href="<c:url value="/mechanic/list.html"/>">Mechanic</a>
		</li>
        <li class="nav-item"><a class="nav-link" href="<c:url value="/logout.html"/>">Logout</a></li>
        </ul>
      </div>
    </nav>
	
	
