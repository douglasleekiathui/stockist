<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<c:url value="/css/simple.css" var="ss"/>
<link rel="STYLESHEET" type="text/css"
	href="${ss}" />
<tiles:insertAttribute name="header" />
</head>
<body>
	<table style="width: 100%">
		<tr>
			<td style="width: 180; border: 1" valign="top">
				<div>
					
					<tiles:insertAttribute name="menu" />
				</div>
			</td>
			<td>
				<div>
					<h3>
						<spring:message code="${bodyTitle}" />
					</h3>
					<tiles:insertAttribute name="body" />
				</div>
			</td>
		</tr>
	</table>
	
	<!-- ======== Footer ======== -->
				<div id="footer" align="center">
				  <hr>
					<small> &copy;Team4 Stockist &#169;
            2017<br />
            Contact
            25 Heng Mui Keng Terrace, 119615
            Singapore<br />
            Infolink:+65-162093<br />
            E-mail:  isstraining@nus.edu.sg
         </small>
				</div>
</body>
</html>
