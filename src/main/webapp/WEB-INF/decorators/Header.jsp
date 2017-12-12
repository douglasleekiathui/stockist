<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head runat="server">
<!--include-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
	integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
	crossorigin="anonymous"></script>
<link href="css/master.css" rel="stylesheet" />
<title></title>

</head>
<body>

	<!--banner-->
	<div class="jumbotron">
		<div class="container text-center">

			<h1>Team4</h1>
			<p>Stockist Inventory Management System</p>
		</div>
	</div>


	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link" href="<c:url value="/logout.html"/>">Logout</a></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false">Product</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="<c:url value="/admin/products/view.html"/>">View</a> 
				<a class="dropdown-item" href="<c:url value="/admin/products/new.html"/>">New</a>
			</div>
		</li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false">Supplier</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="<c:url value="/admin/suppliers/supplier-list.html"/>">View</a>
				<a class="dropdown-item" href="<c:url value="/admin/suppliers/supplier-new.html"/>">New</a>
			</div>
		</li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false">User</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="<c:url value="/admin/users/user-list.html"/>">View</a> 
				<a class="dropdown-item" href="<c:url value="/admin/users/user-new.html"/>">New</a> 
				<a class="dropdown-item" href="#">Something else here</a> 
				<a class="dropdown-item" href="#">Separated link</a>
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
			href="<c:url value="/mechanic/mechanic-products-list.html"/>">Mechanic</a>
		</li>

	</ul>
	
	
