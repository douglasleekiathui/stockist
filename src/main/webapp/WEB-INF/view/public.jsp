<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<title>hello.jsp</title>
<body>
	<h1>${menu}</h1>
<br>
<a href="<%=request.getContextPath()%>/admin" >[Admin]</a>
<a href="<%=request.getContextPath()%>/login" >[login]</a>
<a href="<%=request.getContextPath()%>/public" >[public]</a>
<br>

	<sec:authorize access="hasRole('MECHANIC')">
		<!-- For login user -->
		<c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
				User : ${pageContext.request.userPrincipal.name} | <a
					href="javascript:formSubmit()"> Logout</a>
			</h2>
		</c:if>


	</sec:authorize>
</body>
</html>