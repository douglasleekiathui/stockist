<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<title>Denied</title>
<body>
<div style="text-align:center;">
	<h1>Access is denied</h1>


	<c:choose>
		<c:when test="${empty username}">
			<h2>You do not have permission to access this page!</h2>
		</c:when>
		<c:otherwise>
			<h2>Username : ${username} <br/>You do not have permission to access this page!</h2>
		</c:otherwise>
	</c:choose>
	
	<img src="https://vignette.wikia.nocookie.net/animal-jam-clans-1/images/a/a4/17831664-Emoticon-saying-no-with-his-finger-Stock-Vector-smiley-cartoon-face.jpg/revision/latest?cb=20170126025739"/>
</div>
</body>
</html>