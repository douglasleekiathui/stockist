<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
                crossorigin="anonymous">
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <title>mechanic products list</title>
        </head>

        <body>
            <div class="container">
                <div class="col xs-12">
                 <a href="${pageContext.request.contextPath}/products/create.html">Add A New Product</a>
                	<br/>
				<form:form method="POST" modelAttribute="productSearch"	action="${pageContext.request.contextPath}/mechanic/list">
	    			<div class="input-group">
	     				 <form:input path="searchText" type="text" class="form-control" placeholder="Search for..." aria-label="Search for..." />
					<select class="custom-select" name="searchType" id="searchType">
					  <option value="productNo" ${productSearch.searchType == "productNo" ? 'selected="selected"' : ''}>Part Number</option>
					  <option value="productDescription" ${productSearch.searchType == "productDescription" ? 'selected="selected"' : ''}>Product Description</option>
					  <option value="manufacturer" ${productSearch.searchType == "manufacturer" ? 'selected="selected"' : ''}>Manufacturer</option>
					  <option value="shelfLocation" ${productSearch.searchType == "shelfLocation" ? 'selected="selected"' : ''}>Shelf Location</option>
					</select>
	      					<span class="input-group-btn">
	        					<button class="btn btn-primary" type="submit">Search By</button>
	      					</span>
	    			</div>
				</form:form>
					</div>
					<br/>
                        <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Part Number</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Dimensions</th>
                                        <th scope="col">Manufacturer</th>
                                        <th scope="col">Shelf Location</th>
                                        <th scope="col">Price</th>         							
                                    </tr>
                                </thead>
                                <c:forEach var="p" items="${productList}">
                                    <tr>
                                        <th scope="row">${p.productNo}</th>
                                        <td>${p.productDescription}</td>
                                        <td>${p.dimension}</td>
                                        <td>${p.manufacturer}</td>
                                        <td>${p.shelfLocation}</td>
                                        <td>${p.price}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                           
                </div>
				<div class="col xs-12">
			 		<nav aria-label="...">
					  <ul class="pagination pagination-md justify-content-center">
					    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
					      <a class="page-link" href="/stockist/mechanic/list/${currentPage-1}" tabindex="-1">Previous</a>
					    </li>
					    <c:forEach begin="1" end="${noOfPages}" varStatus="loop">					    
					    	<li class="page-item ${loop.index == currentPage ? 'active' : ''}"><a class="page-link" href="/stockist/mechanic/list/${loop.index}">${loop.index}</a></li>
						</c:forEach>
					    <li class="page-item ${currentPage == noOfPages ? 'disabled' : ''}">
					      <a class="page-link" href="/stockist/mechanic/list/${currentPage+1}">Next</a>
					    </li>
					  </ul>
					</nav>
				</div>   
			</div>            
         	      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                    crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
                    crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
                    crossorigin="anonymous"></script>
        </body>

        </html>